function pwdView(){
	var pwd=document.getElementById('pwd');
	pwd.onclick=function(){
		var password=document.getElementById('password');
		
		var temp=password.value;
		if(password.type=="password"){
			var replace=document.getElementById('replace');
			replace.innerHTML='<input name="password" id="password" type="text"  value="" class="login-input"/>';
			document.getElementById('password').value=temp;
		}
		if(password.type=="text"){
			var replace=document.getElementById('replace');
			replace.innerHTML='<input name="password" id="password" type="password"  value="" class="login-input"/>';
			document.getElementById('password').value=temp;
		}
	}
}

function login(){
	$('.login-btn').bind('click',function(){
		var passport=$('#username').val();
		var password=$('#password').val();
		
		$.ajax({
			type:'post',
			url:'login',
			data:{'type':"admin",'passport':passport,'password':password},
			dataType:"json",
			success:function(data){
				if(data.loginflag==1){
					alert('登录成功');
					window.location.href="admin/index.jsp"; 
				}else{
					alert(data.errorinfo);
				}
			},
			error:function(msg){
				alert(msg);
			}
		});
	});
}

function loginout(){
	$('#loginout').bind('click',function(){
		$.ajax({
			type:'post',
			url:'login',
			data:{'type':"adminout"},
			dataType:"json",
			success:function(data){
				if(data.flag==1){
					alert('注销成功');
					window.location.href="/CQTravel/admin"; 
				}
			},
			error:function(msg){
				alert(msg);
			}
		});
	});
}

function usersearch(){
	$('#_j_search').bind('click',function(){
		$('#list').empty();
		$('#list').append($('<tr class="head">'+
								'<th width="10%">用户名</th>'+
								'<th width="10%">昵称</th>'+
								'<th width="5%">性别</th>'+
								'<th width="10%">现居地</th>'+
								'<th width="15%">生日</th>'+
								'<th width="10%">身份证</th>'+
								'<th width="10%">手机号码</th>'+
								'<th width="15%">QQ</th>'+
								'<th width="15%">邮箱</th>'+
							'</tr>'));
		var username=$('#username').val();
		var nickname=$('#nickname').val();
		var gender=$('input:radio:checked').val();
		var city=$('#city').val();
		var phone=$('#phone').val();
		var qq=$('#qq').val();
		if(username.length==0&&nickname.length==0&&city.length==0&&phone.length==0&&qq.length==0){
			alert('用户名、昵称、城市、手机、QQ不能全部为空！')
			return;
		}
		//alert(username+":"+nickname+":"+city+":"+phone+":"+qq+":"+gender)
		$.ajax({
			type:'post',
			url:'search',
			data:{'type':"usersearch",'username':username,'nickname':nickname,'gender':gender,'city':city,'phone':phone,'qq':qq},
			dataType:"json",
			success:function(data){
				if(data.searchflag==1){
					var result=data.result;
					var inner='';
					//alert(result.length);
					for(var i=0;i<result.length;i++){
						var gender=result[i].gender==1?"男":"女";
						var first=i==0?'<tr class="active">':'<tr>'
						
						inner+=first+
									'<td>'+result[i].id+'</td>'+
									'<td>'+result[i].nickname+'</td>'+
									'<td>'+gender+'</td>'+
									'<td>'+result[i].city+'</td>'+
									'<td>'+result[i].birth+'</td>'+
									'<td>'+result[i].idcard+'</td>'+
									'<td>'+result[i].phone+'</td>'+
									'<td>'+result[i].qq+'</td>'+
									'<td>'+result[i].email+'</td>'+
								'</tr>';
					}
					var li=$(inner);
					$('#list').append(li);
					listselect();
				}else{
					alert(data.error);
				}
			},
			error:function(msg){
				alert(msg);
			}
		});
	});
}

function listselect(){
	var trs=$('#list tr');
	$.each(trs,function(){
		var c=this.className;
		if(c=="head"){
			return;
		}
		$(this).bind('click',function(){
			//alert('click');
			var trss=$('#list tr');
			$.each(trss,function(){
				$(this).removeClass('active');
			});
			$(this).addClass('active');
			
		});
	});
}

function userdelete(){
	$('#_j_delete').bind('click',function(){
		var selected=$('#list tr.active');
		alert(selected.length);
		if(selected.length!=0){
			
			var tds=selected.children('td');
			var id=tds[0].innerHTML;
			deleteconfim();
		}
	});
}

function deleteconfim(){
	$('#_j_delete').click(function(){
		var selected=$('#list tr.active');
		//alert(selected.length);
		if(selected.length!=0){
			
			var tds=selected.children('td');
			var id=tds[0].innerHTML;
			var name=tds[1].innerHTML;
			var sex=tds[2].innerHTML;
			var location=tds[3].innerHTML;
			$('#user').html(id);
			$('#name').html(name);
			$('#sex').html(sex);
			$('#location').html(location);
			$('.loginbg').fadeIn(100);
			$('.loginbox').slideDown(200);
		}
	});
	$('.title .close').click(function(){
		$('.loginbg').fadeOut(100);
		$('.loginbox').slideUp(200);
	});
	$('#deletesubmit').click(function(){
		var username=$('#user').html();
		$.ajax({
			type:'post',
			url:'search',
			data:{'type':"userdelete",'username':username},
			dataType:"json",
			success:function(data){
				if(data.searchflag==1){
					alert('用户信息删除成功！');
					$('.title .close').trigger('click');
					location.reload();
				}else{
					alert(data.error);
				}
			},
			error:function(msg){
				alert(msg);
			}
		});
	});
}
function getroomtype(){
	$('#roomtype').empty();
	$.ajax({
		type:'post',
		url:'search',
		data:{'type':"roomtype"},
		dataType:"json",
		success:function(data){
			if(data.searchflag==1){
				var type=data.type;
				var inner='<option value="0"></option>';
				for(var i in type){
					inner+='<option value="'+i+'">'+type[i]+'</option>';
								
				}
				var option=$(inner);
				$('#roomtype').append(option);
			}else{
				alert(data.error);
			}
		},
		error:function(msg){
			alert(msg);
		}
	});
}

function search(obj){
	$('#_j_search').bind('click',function(){
		var objtype='';
		var params={};
		$('#list').empty();
		if(obj=="hotel"){
			$('#list').append($('<tr class="head">'+
									'<th width="10%">酒店编号</th>'+
									'<th width="10%">所在地</th>'+
									'<th width="10%">酒店名称</th>'+
									'<th width="15%">酒店地址</th>'+
									'<th width="25%">网站评价</th>'+
									'<th width="5%">价格</th>'+
									'<th width="10%">房型</th>'+
									'<th width="10%">好评数</th>'+
									'<th width="5%">景点</th>'+
							'</tr>'));
			var hotelid=$('#hotelid').val();
			var location=$('#location').val();
			var hotelname=$('#hotelname').val();
			var hoteladdress=$('#hoteladdress').val();
			var roomtype=$('#roomtype').val();
			var hotelview=$('#hotelview').val();
			if(hotelid.length==0&&location.length==0&&hotelname.length==0&&hoteladdress.length==0&&hotelview.length==0){
				alert('酒店编号、所在地、酒店名称、酒店地址、附近景点不能全部为空！')
				return;
			}
			objtype='hotel';
			params={'id':hotelid,'location':location,'name':hotelname,'address':hoteladdress,'roomtype':roomtype,'view':hotelview};
		}else if(obj=="view"){
			$('#list').append($('<tr class="head">'+
					'<th width="10%">景点编号</th>'+
					'<th width="10%">所在地</th>'+
					'<th width="15%">景点名称</th>'+
					'<th width="20%">景点地址</th>'+
					'<th width="30%">网站评价</th>'+
					'<th width="5%">价格</th>'+
					'<th width="10%">好评数</th>'+
			'</tr>'));
			
			var viewid=$('#viewid').val();
			var location=$('#location').val();
			var viewname=$('#viewname').val();
			var viewaddress=$('#viewaddress').val();
			if(viewid.length==0&&location.length==0&&viewname.length==0&&viewaddress.length==0){
				alert('景点编号、所在地、景点名称、景点地址不能全部为空！')
				return;
			}
			
			objtype='view';
			params={'id':viewid,'location':location,'name':viewname,'address':viewaddress};
		}else if(obj=="note"){
			$('#list').append($('<tr class="head">'+
					'<th width="10%">游记编号</th>'+
					'<th width="20%">标题</th>'+
					'<th width="15%">作者</th>'+
					'<th width="15%">发表时间</th>'+
					'<th width="10%">点击量</th>'+
					'<th width="10%">点赞量</th>'+
					'<th width="10%">回复量</th>'+
					'<th width="10%">关联地</th>'+
			'</tr>'));
			 
			var noteid=$('#noteid').val();
			var notetitle=$('#notetitle').val();
			var noteauthor=$('#noteauthor').val();
			var location=$('#location').val();
			var notecontent=$('#notecontent').val();
			if(noteid.length==0&&notetitle.length==0&&noteauthor.length==0&&location.length==0&&notecontent.length==0){
				alert('游记编号、所在地、标题、作者、内容不能全部为空！')
				return;
			}
			
			objtype='note';
			params={'id':noteid,'location':location,'title':notetitle,'author':noteauthor,'content':notecontent};
			
		}else if(obj=="qa"){
			$('#list').append($('<tr class="head">'+
					'<th width="10%">问题编号</th>'+
					'<th width="20%">标题</th>'+
					'<th width="15%">作者</th>'+
					'<th width="15%">发表时间</th>'+
					'<th width="10%">点击量</th>'+
					'<th width="10%">点赞量</th>'+
					'<th width="10%">回复量</th>'+
					'<th width="10%">关联地</th>'+
			'</tr>'));
			 
			var id=$('#qaid').val();
			var title=$('#qatitle').val();
			var author=$('#qaauthor').val();
			var location=$('#location').val();
			var content=$('#qacontent').val();
			if(id.length==0&&title.length==0&&author.length==0&&location.length==0&&content.length==0){
				alert('问题编号、所在地、标题、作者、内容不能全部为空！')
				return;
			}
			
			objtype='qa';
			params={'id':id,'location':location,'title':title,'author':author,'content':content};
		}
		//alert(hotelid+":"+location+":"+hotelname+":"+hoteladdress+":"+roomtype+":"+hotelview)
		$.ajax({
			type:'post',
			url:'search',
			data:{'type':"search",'subtype':objtype,'params':JSON.stringify(params)},
			dataType:"json",
			success:function(data){
				if(data.searchflag==1){
					var result=data.result;
					var inner='';
					var type=data.type;
					//alert(result.length);
					if(type=="hotel"){
						for(var i=0;i<result.length;i++){
							var first=i==0?'<tr class="active">':'<tr>'
								
								inner+=first+
								'<td>'+result[i].id+'</td>'+
								'<td>'+result[i].location+'</td>'+
								'<td>'+result[i].name+'</td>'+
								'<td>'+result[i].address+'</td>'+
								'<td>'+result[i].comment+'</td>'+
								'<td>'+result[i].price+'</td>'+
								'<td>'+result[i].roomtype+'</td>'+
								'<td>'+result[i].opt+'</td>'+
								'<td>'+result[i].view+'</td>'+
								'</tr>';
						}
					}else if(type=="view"){
						for(var i=0;i<result.length;i++){
							var first=i==0?'<tr class="active">':'<tr>'
								
								inner+=first+
								'<td>'+result[i].id+'</td>'+
								'<td>'+result[i].location+'</td>'+
								'<td>'+result[i].name+'</td>'+
								'<td>'+result[i].address+'</td>'+
								'<td>'+result[i].comment+'</td>'+
								'<td>'+result[i].price+'</td>'+
								'<td>'+result[i].opt+'</td>'+
								'</tr>';
						}
					}else if(type=="note"){
						for(var i=0;i<result.length;i++){
							var first=i==0?'<tr class="active">':'<tr>'
								
								inner+=first+
								'<td>'+result[i].id+'</td>'+
								'<td>'+result[i].title+'</td>'+
								'<td>'+result[i].author+'</td>'+
								'<td>'+result[i].uploadtime+'</td>'+
								'<td>'+result[i].readtime+'</td>'+
								'<td>'+result[i].opt+'</td>'+
								'<td>'+result[i].reply+'</td>'+
								'<td>'+result[i].location+'</td>'+
								'</tr>';
						}
					}else if(type=="qa"){
						for(var i=0;i<result.length;i++){
							var first=i==0?'<tr class="active">':'<tr>'
								
								inner+=first+
								'<td>'+result[i].id+'</td>'+
								'<td>'+result[i].title+'</td>'+
								'<td>'+result[i].author+'</td>'+
								'<td>'+result[i].datetime+'</td>'+
								'<td>'+result[i].readtime+'</td>'+
								'<td>'+result[i].accept+'</td>'+
								'<td>'+result[i].reply+'</td>'+
								'<td>'+result[i].location+'</td>'+
								'</tr>';
						}
					}
					var li=$(inner);
					$('#list').append(li);
					listselect();
				}else{
					alert(data.error);
				}
			},
			error:function(msg){
				alert(msg);
			}
		});
	});
}
function alter(obj){
	$('#_j_alter').click(function(){
		var selected=$('#list tr.active');
		//alert(selected.length);
		if(selected.length!=0){
			var tds=selected.children('td');
			var id=tds[0].innerHTML;
			$.ajax({
				type:'post',
				url:'search',
				data:{'type':"getobjbyid",'subtype':obj,'id':id},
				dataType:"json",
				success:function(data){
					if(data.searchflag==1){
						$('#alterinfo').empty();
						var resultobj=data.result;
						var inner='';
						if(data.type=="hotel"){
							inner+='<tr>'+
										'<td>酒店编号</td>'+
										'<td id="_a_id">'+resultobj.id+'</td>'+
										'<td>所在地</td>'+
										'<td><input id="_a_location" type="text" value="'+resultobj.location+'"/></td>'+
									'</tr>'+
									'<tr>'+
										'<td>酒店名称</td>'+
										'<td><input id="_a_name" type="text" value="'+resultobj.name+'"/></td>'+
										'<td>酒店地址</td>'+
										'<td><input id="_a_address" type="text" value="'+resultobj.address+'"/></td>'+
									'</tr>'+
									'<tr>'+
										'<td>酒店介绍</td>'+
										'<td><input id="_a_description" type="text" value="'+resultobj.description+'"/></td>'+
										'<td>入住描述</td>'+
										'<td><input id="_a_checkin" type="text" value="'+resultobj.checkin+'"/></td>'+
									'</tr>'+
									'<tr>'+
										'<td>特别提示</td>'+
										'<td><input id="_a_tips" type="text" value="'+resultobj.tips+'"/></td>'+
										'<td>评价</td>'+
										'<td><input id="_a_comment" type="text" value="'+resultobj.comment+'"/></td>'+
									'</tr>'+
									'<tr>'+
										'<td>价格</td>'+
										'<td><input id="_a_price" type="text" value="'+resultobj.price+'"/></td>'+
										'<td>房型</td>'+
										'<td>'+
											'<select id="_a_roomtype">'+
												'<option value="1">标准间</option>'+
												'<option value="2">商务间</option>'+
												'<option value="3">家庭间</option>'+
											'</select>'+
										'</td>'+
									'</tr>'+
									'<tr>'+
										'<td>附近景点</td>'+
										'<td><input id="_a_view" type="text" value="'+resultobj.view+'"/></td>'+
									'</tr>';
						}else if(data.type=="view"){
							inner+='<tr>'+
							'<td>景点编号</td>'+
							'<td id="_a_id">'+resultobj.id+'</td>'+
							'<td>所在地</td>'+
							'<td><input id="_a_location" type="text" value="'+resultobj.location+'"/></td>'+
						'</tr>'+
						'<tr>'+
							'<td>景点名称</td>'+
							'<td><input id="_a_name" type="text" value="'+resultobj.name+'"/></td>'+
							'<td>景点地址</td>'+
							'<td><input id="_a_address" type="text" value="'+resultobj.address+'"/></td>'+
						'</tr>'+
						'<tr>'+
							'<td>景点介绍</td>'+
							'<td><input id="_a_description" type="text" value="'+resultobj.description+'"/></td>'+
							'<td>预订须知</td>'+
							'<td><input id="_a_checkin" type="text" value="'+resultobj.checkin+'"/></td>'+
						'</tr>'+
						'<tr>'+
							'<td>评价</td>'+
							'<td><input id="_a_comment" type="text" value="'+resultobj.comment+'"/></td>'+
							'<td>价格</td>'+
							'<td><input id="_a_price" type="text" value="'+resultobj.price+'"/></td>'+
						'</tr>';
						}
						var li=$(inner);
						$('#alterinfo').append(li);
						$('.loginbg').fadeIn(100);
						$('.alterbox').slideDown(200);
					}else{
						alert(data.error);
					}
				},
				error:function(msg){
					alert(msg);
				}
			});
			
			
		}
	});
	$('.title .close').click(function(){
		$('.loginbg').fadeOut(100);
		$('.alterbox').slideUp(200);
	});
	$('#altersubmit').click(function(){
		var params={};
		var id=$('#_a_id').html();
		var location=$('#_a_location').val();
		var name=$('#_a_name').val();
		var address=$('#_a_address').val();
		var description=$('#_a_description').val();
		var checkin=$('#_a_checkin').val();
		var comment=$('#_a_comment').val();
		var price=$('#_a_price').val();
		if(obj=="hotel"){
			var tips=$('#_a_tips').val();
			var roomtype=$('#_a_roomtype').val();
			var view=$('#_a_view').val();
			params={'id':id,'location':location,'name':name,'address':address,'description':description,
				'checkin':checkin,'tips':tips,'comment':comment,'price':price,'roomtype':roomtype,'view':view};
			
		}else if(obj=="view"){
			params={'id':id,'location':location,'name':name,'address':address,'description':description,
					'checkin':checkin,'comment':comment,'price':price};
		}
		$.ajax({
			type:'post',
			url:'search',
			data:{'type':"alter",'subtype':obj,
				 'params':JSON.stringify(params)},//传递json数组需要先序列化
			dataType:"json",
			success:function(data){
				if(data.searchflag==1){
					var type=data.type;
					if(type=="hotel")
						alert('酒店信息修改成功！');
					else if(type=="view")
						alert('景点信息修改成功！');
					$('.title .close').trigger('click');
					$('#_j_search').trigger('click');
				}else{
					alert(data.error);
				}
			},
			error:function(msg){
				alert(msg);
			}
		});
	});
}
function deletes(obj){
	$('#_j_delete').click(function(){
		var selected=$('#list tr.active');
		//alert(selected.length);
		if(selected.length!=0){
			var tds=selected.children('td');
			if(obj=="note"||obj=="qa"){
				var id=tds[0].innerHTML;
				var locate=tds[7].innerHTML;
				var title=tds[1].innerHTML;
				var author=tds[2].innerHTML;
				var time=tds[3].innerHTML;
				$('#objid').html(id);
				$('#locate').html(locate);
				$('#title').html(title);
				$('#author').html(author);
				$('#time').html(time);
			}else{
				var id=tds[0].innerHTML;
				var locate=tds[1].innerHTML;
				var name=tds[2].innerHTML;
				var address=tds[3].innerHTML;
				var price=tds[5].innerHTML;
				$('#objid').html(id);
				$('#locate').html(locate);
				$('#name').html(name);
				$('#address').html(address);
				$('#price').html(price);
			}
			$('.loginbg').fadeIn(100);
			$('.loginbox').slideDown(200);
		}
	});
	$('.title .close').click(function(){
		$('.loginbg').fadeOut(100);
		$('.loginbox').slideUp(200);
	});
	$('#deletesubmit').click(function(){
		var objid=$('#objid').html();
		$.ajax({
			type:'post',
			url:'search',
			data:{'type':"delete",'subtype':obj,'objid':objid},
			dataType:"json",
			success:function(data){
				if(data.searchflag==1){
					alert('信息删除成功！');
					$('.title .close').trigger('click');
					$('#_j_search').trigger('click');
				}else{
					alert(data.error);
				}
			},
			error:function(msg){
				alert(msg);
			}
		});
	});
}

function addrow(obj){
	$('#_j_add').bind('click',function(){
		var index=$('#list tr').length;
		var inner='';
		if(obj=="hotel"){
			inner='<tr>'+
				'<td>'+index+'</td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td>'+
				'<select>'+
				'<option value="1">标准间</option>'+
				'<option value="2">商务间</option>'+
				'<option value="3">家庭间</option>'+
				'</select>'+
				'</td>'+
				'<td><input type="text" /></td>'+
			'</tr>';
		}else if(obj=="view"){
			inner='<tr>'+
				'<td>'+index+'</td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
				'<td><input type="text" /></td>'+
			'</tr>';
		}
		$('#list').append($(inner));
		listselect();
	});
}
function subrow(){
	$('#_j_sub').bind('click',function(){
		var selected=$('#list tr.active');
		//alert(selected.length);
		if(selected.length!=0){
			selected.remove();
			updateindex();
		}
	});
}
function updateindex(){
	var trs=$('#list tr');
	var i=1;
	$.each(trs,function(){
		var c=this.className;
		if(c=="head"){
			return;
		}
		$(this).children('td')[0].innerHTML=i++;
	});
}
function insert(type){
	$('#_j_insert').bind('click',function(){
		var trs=$('#list tr');
		if(trs.length==1){
			return;
		}
		var objs=new Array();
		var subtype='';
		
		if(type=="hotel"){
			subtype='hotel';
			for(var i=1;i<trs.length;i++){
				var aInputs=$(trs[i]).find('input');
				var aSelect=$(trs[i]).find('select');
				var obj={'id':aInputs[0].value,'location':aInputs[1].value,'name':aInputs[2].value,'address':aInputs[3].value,
						'description':aInputs[4].value,'checkin':aInputs[5].value,'tips':aInputs[6].value,'comment':aInputs[7].value,
						'price':aInputs[8].value,'roomtype':aSelect.val(),'view':aInputs[9].value};
				objs.push(obj);
			}
		}else if(type=="view"){
			subtype='view';
			for(var i=1;i<trs.length;i++){
				var aInputs=$(trs[i]).find('input');
				var obj={'id':aInputs[0].value,'location':aInputs[1].value,'name':aInputs[2].value,'address':aInputs[3].value,
						'description':aInputs[4].value,'checkin':aInputs[5].value,'comment':aInputs[6].value,
						'price':aInputs[7].value,'ext':aInputs[8].value};
				objs.push(obj);
			}
		}
		$.ajax({
			type:'post',
			url:'search',
			data:{'type':"insert",'subtype':subtype,
				 'objs':JSON.stringify(objs)},//传递json数组需要先序列化
			dataType:"json",
			success:function(data){
				if(data.searchflag==1){
					alert('插入成功！');
					location.reload();
				}else{
					alert(data.error);
				}
			},
			error:function(msg){
				alert(msg);
			}
		});
	});
}

function clear(){
	$('#_j_clear').bind('click',function(){
		$('.search-bar input:text').val("");
	});
}

function menuclick(){
	var ul=document.getElementById('nav_dot');
	var lis=ul.getElementsByTagName('li');

	var i=0;
	for(i=0;i<lis.length;i++){
		lis[i].onclick=function(){
			for(var j=0;j<lis.length;j++){
				lis[j].getElementsByTagName('div')[0].style.display="none";
			}
			var odiv=this.getElementsByTagName('div')[0];
			odiv.style.display="block";
		}
	}
}





function nullcheck(){
	var id=document.getElementById("id").value.replace(/(^\s*)|(\s*$)/g,"");
	var name=document.getElementById("name").value.replace(/(^\s*)|(\s*$)/g,"");
	var idcard=document.getElementById("idcard").value.replace(/(^\s*)|(\s*$)/g,"");
	var academy=document.getElementById("academy").value.replace(/(^\s*)|(\s*$)/g,"");
	var major=document.getElementById("major").value.replace(/(^\s*)|(\s*$)/g,"");
	var classes=document.getElementById("classes").value.replace(/(^\s*)|(\s*$)/g,"");
	
	
	if(id==null||id==""){
		alert('请输入学号');
		return false;
	}
	if(name==null||name==""){
		alert('请输入姓名');
		return false;
	}
	if(idcard==null||idcard==""){
		alert('请输入身份证号码');
		return false;
	}
	if(academy==null||academy==""){
		alert('请选择学院');
		return false;
	}
	if(major==null||major==""){
		alert('请选择专业');
		return false;
	}
	if(classes==null||classes==""){
		alert('请输入班级');
		return false;
	}
	
	return true;
}

function detailChg(){
	var result=document.getElementById("result");
	
	var lis=result.getElementsByTagName("li");
	for(var i=0;i<lis.length;i++){
		lis[i].index=i;
		lis[i].onclick=function(){
			var detail=document.getElementById("detail");
			var divs=detail.getElementsByTagName("div");
			for(var j=0;j<divs.length;j++){
				divs[j].style.display="none";
			}
			divs[this.index].style.display="block";
		}
	}
}

