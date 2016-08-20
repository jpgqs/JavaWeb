
function detailding(){
	$('.up_act').click(function(){
		var noteId=$(this).attr('data-value');
		ajaxding(noteId);
		var old=$('#opt'+noteId).html();
		
		$('#opt'+noteId).html(parseInt(old)+1);
	});
}

function ding(){
	var as=$('.btn-ding');
	//alert(as.length);
	var i=1;
	$.each(as,function(){
		this.index=i++;
		//important：重新绑定之前要解绑之前的事件！
		$(this).unbind('click');
		$(this).click(function(){
			//alert(this.index);
			var noteId=$(this).attr('data-value');
			//alert(noteId);
			ajaxding(noteId);
		});
		
	});
	
}

function ajaxding(noteId){
	$.ajax({
		type:'post',
		url:'note',
		data:{'type':"ding","id":noteId},
		dataType:"json",
		success:function(data){
			var flag=data.flag;
			//alert(flag);
			if(flag==0){
				alert(data.errorinfo);
			}else if(flag==1){
				var old=$('.opt'+noteId).html();
				
				$('.opt'+noteId).html(parseInt(old)+1);
			}else if(flag==2){
				alert('您还未登录，请登陆后重新操作');
				$('#_j_showlogin').trigger('click');
			}else{
				alert('您已经顶过了，请勿重复操作')
			}
			
		},
		error:function(msg){
			alert(msg);
		}
	});
}

function orderchange(){
	$('#hotnote').click(function(){
		$('#hot').css('display','block');
		$('#hotnote').attr('class','active');
		$('#new').css('display','none');
		$('#newnote').attr('class','');
		$('#_j_tn_pagination').css('display','block');
	});
	
	$('#newnote').click(function(){
		$('#hot').css('display','none');
		$('#hotnote').attr('class','');
		$('#new').css('display','block');
		$('#newnote').attr('class','active');
		$('#_j_tn_pagination').css('display','none');
	});
}

/**
 * 页面切换
 */
function pagechange(){
	var pages=$('._j_pageitem');
	var i=0;
	$.each(pages,function(){
		this.index=i++;
		var className=this.className;
		if(className.indexOf("pi")!=-1){//页面切换按钮
			$(this).click(function(){
				if(this.index==1){
					$('.pg-prev').css('display','none');
				}
				if(this.index==2){
					$('.pg-prev').css('display','inline-block');
				}
				var currentpage=$('#currentpage').val();
				if(this.index!=currentpage){
					$('.pg-current').removeClass('pg-current');
					$(this).addClass('pg-current');
					$('#currentpage').val(this.index);
					
					$('#page'+currentpage).css('display','none');
					if($('#page'+this.index).length==0){
						getNoteList(this.index);
					}else{
						$('#page'+this.index).css('display','block');
					}
					
				}
			});
		}else if(className.indexOf("pg-next")!=-1){//下一页
			$(this).click(function(){
				var currentpage=$('#currentpage').val();
				if(currentpage<pages.length-2){
					if(currentpage==1){
						$('.pg-prev').css('display','inline-block');
					}
					$(pages.get(currentpage)).removeClass('pg-current');
					$('#page'+currentpage).css('display','none');
					currentpage++;
					$(pages.get(currentpage)).addClass('pg-current');
					if($('#page'+currentpage).length==0){
						getNoteList(currentpage);
					}else{
						$('#page'+currentpage).css('display','block');
					}
					$('#currentpage').val(currentpage);
				}
			});
		}else{//上一页
			$(this).click(function(){
				var currentpage=$('#currentpage').val();
				if(currentpage>1){
					if(currentpage==2){
						$('.pg-prev').css('display','none');
						$(pages.get(currentpage)).removeClass('pg-current');
						$('#page'+currentpage).css('display','none');
						currentpage--;
						$(pages.get(currentpage)).addClass('pg-current');
						if($('#page'+currentpage).length==0){
							getNoteList(currentpage);
						}else{
							$('#page'+currentpage).css('display','block');
						}
						$('#currentpage').val(currentpage);
					}
				}
			});
		}
	});
}

function getNoteList(index){
	
	$.ajax({
		type:'post',
		url:'note',
		data:{'type':"hotnote",'index':index},
		dataType:"json",
		success:function(data){
			var notes=data.notes;
			var uis=data.uis;
			var inner='<li id=\'page'+index+'\'>';
			
			
			for(var i=0;i<notes.length;i++){
				var content=notes[i].content;
				var contentstr=content.length>150?content.substr(0,150)+"...":content;
				inner+='<div class="tn-item clearfix">'
			        		+'<div class="tn-image">'
			        			+'<a href="travel/travelnote.jsp?noteid='+notes[i].id+'" target="_blank">'
			        				+'<img src="'+notes[i].headpicture+'" height="150" width="220">'
			        				+'<i class="icon-baozang"></i>'
			        			+'</a>'
			        		+'</div>'
			        		+'<div class="tn-wrapper">'
				        		+'<dl>'
				        			+'<dt>'
				        				+'<a href="travel/travelnote.jsp?noteid='+notes[i].id+'" target="_blank">'+notes[i].title+'</a>'
				        			+'</dt>'
				        			+'<dd>'
				        				+'<a href="travel/travelnote.jsp?noteid='+notes[i].id+'" target="_blank">'+contentstr+'</a>'
				        			+'</dd>'
				        		+'</dl>'
				        		+'<div class="tn-extra">'
				        			+'<span class="tn-ding">'
				        				+'<a class="btn-ding" href="javascript:;" data-value="'+notes[i].id+'" rel="nofollow"></a>'
				        					+'<em class="opt'+notes[i].id+'">'+notes[i].opt+'</em>'
				        			+'</span>'
				        			+'<span class="tn-place"><i></i>'
				        				+'<a href="/travel-scenic-spot/mafengwo/10168.html" target="_blank" rel="nofollow">'+notes[i].location+'</a>，by'
				        			+'</span>'
				        			+'<span class="tn-user">'
				        				+'<a href="/u/5037827.html" target="_blank" rel="nofollow">'
				        				+'<img alt="'+uis[i].nickname+'" width="16" height="16" src="'+uis[i].headpicture+'">'+uis[i].nickname+''
				        				+'</a>'
				        			+'</span>'
				        			+'<span class="tn-nums"><i></i>'+notes[i].readtime+'/'+notes[i].reply+'</span>'
				        		+'</div>'
				        	+'</div>'
			        	+'</div>';
			}
			inner+='</li>'
			//alert(inner);
			var li=$(inner);
			$('#_j_tn_content #hot').append(li);
			ding();
		},
		error:function(msg){
			alert(msg);
		}
	});
}

function searchtips(){
	$('#searchkey').on('input',function(){
		var key=this.value;
		var last=$('#last').val();
		
		if(key.trim()==""){
			$('.m-search-suggest').css('display','none');
		}
		if(key.trim()!=""&&key!=last){
			$('#last').val(key);
			$('.mss-list').empty();
			$.ajax({
				type:'post',
				url:'search',
				data:{'type':"allsuggest",'key':key},
				dataType:"json",
				success:function(data){
					if(data.searchflag==1){
						var suggest=data.suggest;
						var inner='';
						for(var i=0;i<suggest.length;i++){
							var type=suggest[i].type;
							var typestr='';
							var sugg='';
							if(type=="hotel"){
								typestr='酒店攻略';
								sugg=suggest[i].name;
							}
							if(type=="note"){
								typestr='玩法线路攻略';
								sugg=suggest[i].title;
							}
							//alert(sugg);
							var narr=sugg.split(key);
							
							inner+='<li class="mss-item _j_listitem">'
										+'<a href="travel/hotel.jsp" target="_blank">'
											+'<div class="mss-title">'
												+'<span class="mss-fr">'+typestr+'</span>'
												+'<span class="mss-cn">'+narr[0]
												+'<span class="mss-key">'+key+'</span>'+(sugg.indexOf(key)==-1?'':narr[1])
												+'</span>'
												+'<span class="mss-gl"> <!-- 38%的人会选择这条线路 --></span>'
											+'</div>'
										+'</a>'
									+'</li>';
						}
						
					
						//alert(inner);
						var ui=$(inner);
						$('.mss-list').append(ui);
						$('.m-search-suggest').css('display','block');
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
	
	$('#searchkey').blur(function(){
		$('.m-search-suggest').css('display','none');
	});
	
	$('.m-search-suggest').bind('mouseenter',function(){
		$('#searchkey').unbind('blur');
	});
	$('.m-search-suggest').bind('mouseleave',function(){
		$('#searchkey').bind('blur',function(){
			$('.m-search-suggest').css('display','none');
		});
	});
	$('.m-search-suggest').bind('mouseup',function(){
		$('.m-search-suggest').css('display','none');
		
	});
}

function addheadpic(){
	$('#_j_upload_toppic').click(function(){
		$('#picpath').trigger('click');
		$('#picpath').change(function(){
			 var formData = new FormData($('#picform')[0]);  
		     $.ajax({  
		          url: 'upload' ,  
		          type: 'POST',  
		          data: formData,  
		          dataType:"json",
		          async: false,  
		          cache: false,  
		          contentType: false,  
		          processData: false,  
		          success: function (data) { 
		        	  if(data.flag==1){
		        		  $('#_j_pluplader_btn_container_1 h2').css('color','#fff');
		        		  $('#_j_pluplader_btn_container_1 p').css('color','#fff');
		        		  $('.set_index').css('background','url(../'+data.path+') center 0 no-repeat');
		        		  $('.set_index').css('background-size','100% 100%');
		        		  $('#headpath')[0].value=data.path;
		        	  }else{
		        		  
		        		  alert(json.error);  
		        	  }
		          },  
		          error: function (returndata) {  
		              alert(returndata);  
		          }  
		     });  
		});
	});
}

function book(){
	
	$('#bookroom').click(function(){
		var user=$('#user').val();
		if(user=="unlogin"){
			alert('您还未登录，请登陆后重新操作');
			$('#_j_showlogin').trigger('click');
			return;
		}
		$('.loginbg').fadeIn(100);
		$('.bookbox').slideDown(200);
	});
	$('.bookbox .title .close').click(function(){
		$('.loginbg').fadeOut(100);
		$('.bookbox').slideUp(200);
	});
	
	$('#booksubmit').click(function(){
		var user=$('#user').val();
		var hotel=$('#hotelid').val();
		var datecount=$('#_j_nightnum').html();
		var beginday=$('#_j_datepicker_1').val();
		var endday=$('#_j_datepicker_2').val();
		
		$.ajax({
			type:'post',
			url:'order',
			data:{'type':"hotelorder",'hotel':hotel,'user':user,'count':datecount,'beginday':beginday,'endday':endday},
			dataType:"json",
			success:function(data){
				if(data.flag==1){
					alert('预订成功');
					window.location.href="myorder.jsp"; 
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
function contentfocus(user,note){
	
	CKEDITOR.instances['news'].on('instanceReady',function(){
		this.document.on('click',function(){
			$.ajax({
				type:'post',
				url:'login',
				data:{'type':"islogin"},
				dataType:"json",
				success:function(data){
					if(data.flag==0){
						alert('您还未登录，请登陆后再进行评论');
						editor.setReadOnly(true);
						$('#_j_showlogin').trigger('click');
					}else{
						editor.setReadOnly(false);
					}
				},
				error:function(msg){
					alert(msg);
				}
			});
			
		});
		
	});
	
	
	$('#noteId').val(note);
	$('#rreply').val(user);
	
	$('#replysubmit').click(function(){
		var noteId=$('#noteId').val();
		var rauthor=$('#rauthor').val();
		var rreply=$('#rreply').val();
		var html=editor.document.getBody().getHtml();
		var content=editor.document.getBody().getText();
		
		if(content.trim()==""){
			alert('回复内容不能为空,请输入');
			return;
		}
		
		$.ajax({
			type:'post',
			url:'note',
			data:{'type':"notereply",'noteid':noteId,'author':rauthor,'replided':rreply,'html':html,'content':content},
			dataType:"json",
			success:function(data){
				if(data.flag==1){
					alert('回复成功');
					window.location.href="travelnote.jsp?noteid="+data.note; 
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


function notesubmit(){
	$('#notesubmit').click(function(){
		var html=editor.document.getBody().getHtml();
		var content=editor.document.getBody().getText();
		var title=$('#title').val();
		var userId=$('#userid').val();
		var headpath=$('#headpath').val();
		//alert("\'"+headpath+"\'");
		if(title==""){
			alert('标题不能为空,请输入');
			return;
		}
		if(content.trim()==""){
			alert('游记内容不能为空,请输入');
			return;
		}
		
		$.ajax({
			type:'post',
			url:'note',
			data:{'type':"addnote",'username':userId,'headpath':headpath,'title':title,'content':content.trim(),'html':html},
			dataType:"json",
			success:function(data){
				if(data.flag==1){
					alert('游记攻略发布成功');
					window.location.href="travelnote.jsp?noteid="+data.note; 
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



function usersecure(){
	$('#set-pw-btn').click(function(){
		$('.loginbg').fadeIn(100);
		$('.pwdbox').slideDown(200);
	});
	$('#set-email-btn').click(function(){
		$('.loginbg').fadeIn(100);
		$('.emailbox').slideDown(200);
	});
	$('#set-phone-btn').click(function(){
		$('.loginbg').fadeIn(100);
		$('.phonebox').slideDown(200);
	});
	$('.pwdbox .title .close').click(function(){
		$('.loginbg').fadeOut(100);
		$('.pwdbox').slideUp(200);
	});
	$('.emailbox .title .close').click(function(){
		$('.loginbg').fadeOut(100);
		$('.emailbox').slideUp(200);
	});
	$('.phonebox .title .close').click(function(){
		$('.loginbg').fadeOut(100);
		$('.phonebox').slideUp(200);
	});
	
	$('#pwdalter').click(function(){
		var oldpassword=$('#oldpassword').val();
		var newpassword=$('#newpassword').val();
		var newpassword1=$('#newpassword1').val();
		
		if(!pwdcheck(oldpassword)){
			return false;
		}
		if(!pwdcheck(newpassword)){
			return false;
		}
		if(!pwdcheck(newpassword1)){
			return false;
		}
		if(newpassword==oldpassword){
			alert('新旧密码一致，无需更改');
			return false;
		}
		if(newpassword!=newpassword1){
			alert('两次输入密码不一致，请检查');
			return false;
		}
		
		$.ajax({
			type:'post',
			url:'personal',
			data:{'type':"alterpwd",'username':userId,'oldpassword':oldpassword,'newpassword':newpassword},
			dataType:"json",
			success:function(data){
				if(data.flag==1){
					alert('密码修改成功');
					location.reload();
				}else{
					alert(data.errorinfo);
				}
			},
			error:function(msg){
				alert(msg);
			}
		});
		
	});
	
	$('#emailsubmit').click(function(){
		var email=$('#email').val();
		if(!emailcheck(email)){
			return;
		}
		$.ajax({
			type:'post',
			url:'personal',
			data:{'type':"addemail",'username':userId,'email':email},
			dataType:"json",
			success:function(data){
				if(data.flag==1){
					alert('邮箱绑定成功');
					location.reload();
				}else{
					alert(data.errorinfo);
				}
			},
			error:function(msg){
				alert(msg);
			}
		});
	});
	
	$('#phonesubmit').click(function(){
		var phone=$('#phone').val();
		if(!phonecheck(phone)){
			return;
		}
		$.ajax({
			type:'post',
			url:'personal',
			data:{'type':"addphone",'username':userId,'phone':phone},
			dataType:"json",
			success:function(data){
				if(data.flag==1){
					alert('手机绑定成功');
					location.reload();
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
function uploadpic(){
	$('#_j_upload').click(function(){
		$('#upload').trigger('click');
		$('#upload').change(function(){
			if(this.value!=""){
				$('#picupload').submit();
			}
		});
	});
}
function emailcheck(email){
	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(!myreg.test(email)){
		alert('提示\n\n请输入有效的E_mail！');
		return false;
	}else{
		return true;
	}
}

function phonecheck(phone){
	var mobile=/^(13+\d{9})|(159+\d{8})|(153+\d{8})$/;
	if(!mobile.test(phone)){
		alert('提示\n\n请输入有效的手机号码！');
		return false;
	}else{
		return true;
	}
}
function notetitle(){
	$('#title').focus(function(){
		$('.ap-wrap label').css('display','none');
		$('.ap-wrap span').removeClass('hide');
	});
	$('#title').blur(function(){
		if(this.value==""){
			$('.ap-wrap label').css('display','block');
		}
	});
	$('#title').on('input',function(){
		var title=$('#title').val();
		$('._j_char_limit strong')[0].innerHTML=48-title.length;
	});
}
function dropmenu(){
	$('#_j_head_msg').mouseover(function(){
		$('#_j_head_msg .drop-trigger').addClass('drop-trigger-active');
		$('#_j_msg_panel').css('display','block');
		$('#_j_msg_panel').css('top',$(this).height()+'px');
	});
	$('#_j_head_msg').mouseout(function(){
		$('#_j_head_msg .drop-trigger').attr('class','drop-trigger');
		$('#_j_msg_panel').hide();
		$('#_j_msg_panel').mouseover(function(){
			$(this).css('display','block');
		});
		$('#_j_msg_panel').mouseout(function(){
			$(this).hide();
		});
	});
	
	$('#_j_head_user').mouseover(function(){
		$('#_j_head_user .drop-trigger').addClass('drop-trigger-active');
		$('#_j_user_panel').css('display','block');
		$('#_j_user_panel').css('top',$(this).height()+'px');
	});
	$('#_j_head_user').mouseout(function(){
		$('#_j_head_user .drop-trigger').attr('class','drop-trigger');
		$('#_j_user_panel').hide();
		$('#_j_user_panel').mouseover(function(){
			$(this).css('display','block');
		});
		$('#_j_user_panel').mouseout(function(){
			$(this).hide();
		});
	});
}


function login(){
	$('#_j_showlogin').click(function(){
		$('.loginbg').fadeIn(100);
		$('.loginbox').slideDown(200);
	});
	$('.title .close').click(function(){
		$('.loginbg').fadeOut(100);
		$('.loginbox').slideUp(200);
	});
}

function chg(){
	var imgs=$('#pic_container .show-image li');
	var imgnavs=$('#pic_container .show-nav li');

	var count=0;
	timer=setInterval(auto, 5000);

	function auto(){
		if(count==imgs.length-1){
			count=0;
		}else{
			count++;
		}

		for(var i=0;i<imgs.length;i++){
			//alert(i);
			$(imgs[i]).fadeOut(1000);
			$(imgnavs[i]).attr("class","");
		}
		$(imgs[count]).fadeIn(1000);
		$(imgnavs[count]).attr("class","active");
		//imgs[count].style.display="block";
	}

	$('#pic_container').mouseover(function(){
		clearInterval(timer);
	});

	$('#pic_container').mouseout(function(){
		timer=setInterval(auto, 5000);
	});

	for(var i=0;i<imgnavs.length;i++){
		imgnavs[i].index=i;
		$(imgnavs[i]).click(function(){
			clearInterval(timer);
			for(var j=0;j<imgs.length;j++){
				//alert(i);
				$(imgs[j]).fadeOut(1000);
				$(imgnavs[j]).attr("class","");
			}
			$(imgs[this.index]).fadeIn(1000);
			this.className="active";
			count=this.index;
		});
	}
	
}

function regchg(){

	$('.signup-box .bottom-link a').click(function(){
		$('.signup-box').css("display","none");
		$('.login-box').css("display","block");
	});

	$('.login-box .bottom-link a').click(function(){
		$('.login-box').css("display","none");
		$('.signup-box').css("display","block");
	});
}

function headerfade(){
	$('#header .myheader').mouseover(function(){
		$('#header .myheader').attr("class","myheader");
	});
	$('#header .myheader').mouseout(function(){
		$('#header .myheader').addClass("myheader header-place-default");
	});
}


function dechg(){
	var row1=$('.hcontainer .row1')[0];
	var row2=$('.hcontainer .row2')[0];
	var row3=$('.hcontainer .row3')[0];
	
	dchg(row1);
	dchg(row2);	
	dchg(row3);	
	
}

function dchg(obj){
	var lis=obj.getElementsByTagName('li');
	var divs=$('.'+obj.className+' .discovery-tiles');
		for(var j=0;j<lis.length;j++){
			lis[j].index=j;
			lis[j].onclick=function(){
				for(var k=0;k<lis.length;k++){
					lis[k].className='nav3';
					$(divs[k]).css('display','none');
				}
				$(lis[this.index]).addClass("r-nav-active");
				$(divs[this.index]).css('display','block');
			};
		}
}

function logincheck(){
	
	var xmlHTTP;
	if(window.XMLHttpRequest){
		xmlHTTP=new XMLHttpRequest()
	}else{
		xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	var username=$('#lpassport')[0];
	var password=$('#lpassword')[0];
	if(username!=null&&password!=null){
		if(!usercheck(username.value)){
			username.focus();
			return false;
		}
		if(!pwdcheck(password.value)){
			password.focus();
			return false;
		}
		xmlHTTP.onreadystatechange=function(){
			//alert('readyState: '+xmlHTTP.readyState+' status:'+xmlHTTP.status);
			if(xmlHTTP.readyState==4 && xmlHTTP.status==200){
				var result=eval("("+xmlHTTP.responseText+")");
				if(result.loginflag==1){
					alert('登录成功');
					if(window.location.href.indexOf("register")!=-1){
						window.location.href="../index.jsp";
						return;
					}
					window.location.reload();
					
					//$('#loginform').submit();
				}else{
					alert(result.errorinfo);
				}
			}
		};
		
		xmlHTTP.open("post", "login", true);
		xmlHTTP.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlHTTP.send("username="+username.value+"&password="+password.value);
		
		
	}else{
		alert('error');
		return false;
	}
	
}

function usercheck(value){
	value=value.replace(/(^\s*)|(\s*$)/g,"");//去除空格
	//re=new RegExp("[^0-9]");
	if(value==null||value==""){
		alert('请输入用户名');
		return false;
		
	}else if(value.length<8){
		alert('用户名长度有误(<8)');
		return false;
	}
//	var s=value.match(re);
//	if(s!=null){
//		alert('学号中含有非法字符');
//		return false
//	}
	return true;
}

function pwdcheck(value){
	value=value.replace(/(^\s*)|(\s*$)/g,"");
	if(value==null||value==""){
		alert('请输入密码');
		return false;
		
	}
	return true;
}

function loginsubmit(){
	$('#loginsubmit').click(function(){
		logincheck();
	});
	
}

function register(){
	$('#registerbtn').click(function(){
		regchk();
	});
}
function regchk(){
	var username=$('#user')[0];
	var password=$('#password')[0];
	var rpassword=$('#rpassword')[0];
	if(username!=null&&password!=null&&rpassword!=null){
		if(!usercheck(username.value)){
			username.focus();
			return false;
		}
		if(!pwdcheck(password.value)){
			password.focus();
			return false;
		}
		if(!pwdcheck(rpassword.value)){
			password.focus();
			return false;
		}
		if(password.value!=rpassword.value){
			alert('两次输入密码不一致，请检查');
			password.focus();
			return false;
		}
		
		var xmlHTTP;
		if(window.XMLHttpRequest){
			xmlHTTP=new XMLHttpRequest()
		}else{
			xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xmlHTTP.onreadystatechange=function(){
			//alert('readyState: '+xmlHTTP.readyState+' status:'+xmlHTTP.status);
			if(xmlHTTP.readyState==4 && xmlHTTP.status==200){
				var result=eval("("+xmlHTTP.responseText+")");
				if(result.regflag==1){
					alert('注册成功');
					$('#_j_signup_form').submit();
				}else{
					alert(result.errorinfo);
				}
			}
		};
		
		xmlHTTP.open("post", "register", true);
		xmlHTTP.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlHTTP.send("username="+username.value+"&password="+password.value);
		
	}else{
		alert('error');
		return false;
	}
	
}