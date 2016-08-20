/**
 * 
 */
function stylejs(){
	$('a.more_selector').bind('mouseover',function(){
		var position=$(this).css('background-position').split('px');
		var newX=parseInt(position[0].trim())-43;
		var newY=parseInt(position[1].trim());
		
		$(this).css('background-position',newX+'px '+newY+'px');
	});
	$('a.more_selector').bind('mouseout',function(){
		var position=$(this).css('background-position').split('px');
		var newX=parseInt(position[0].trim())+43;
		var newY=parseInt(position[1].trim());
		$(this).css('background-position',newX+'px '+newY+'px');
	});
	
	$('a.more_selector').bind('click',function(){
		var state=$(this).attr('data-state');
		
		if(state=='0'){
			var position=$(this).css('background-position').split('px');
			var newX=parseInt(position[0].trim());
			var newY=parseInt(position[1].trim())-17;
			$(this).css('background-position',newX+'px '+newY+'px');
			$(this).attr('data-state','1');
		}else{
			var position=$(this).css('background-position').split('px');
			var newX=parseInt(position[0].trim());
			var newY=parseInt(position[1].trim())+17;
			$(this).css('background-position',newX+'px '+newY+'px');
			$(this).attr('data-state','0');
		}
	});
}
function hotquestion(){
	var lis=$('._j_elite li');
	$.each(lis,function(){
		$(this).bind('mouseover',function(){
			$('._j_elite li').removeClass('on');
			$(this).addClass('on');
		});
		
	});
}
function showType(){
	$('._j_cate_dropbox').on('mouseover',function(){
		$('._j_cate_list').css('display','block');
	});
	$('._j_cate_dropbox').on('mouseout',function(){
		$('._j_cate_list').css('display','none');
	});
	$('._j_option_next').on('click',function(){
		$('._j_category').html(this.innerHTML);
		//alert($(this).attr('data-cid'));
		$('._j_category').attr('data-cid',$(this).attr('data-cid'));
		$('._j_cate_list').css('display','none');
	});
}

function titleCheck(){
	$('._j_word_check').on('input',function(){
		var title=$('._j_title').val();
		$('.item-title ._j_word_num').html(title.length);
		var tip=$('.item-title .err-tips');
		if(title.length>80){
			tip.html("标题最大长度不能超过80");
			tip.css('display','block');
			$(this).attr('data-flag','false');
		}else{
			$(this).attr('data-flag','true');
			tip.css('display','none');
		}
	});
	$('._j_word_check').on('change',function(){
		var title=$('._j_title').val();
		var min_num=parseInt($('._j_min_num').html());
		var tip=$('.item-title .err-tips');
		if(title.length<min_num){
			tip.html("标题最小长度不能小于"+min_num);
			if(title.length==0){
				tip.html("请输入标题");
			}
			$(this).attr('data-flag','false');
			tip.css('display','block');
		}else{
			$(this).attr('data-flag','true');
			tip.css('display','none');
		}
	});
}

function detailCheck(){
	CKEDITOR.instances['question'].on('instanceReady',function(){
		this.document.on('input',function(){
			var content=editor.document.getBody().getText();
			var length=content.trim().length;
			$('#_js_answerText ._j_word_num').html(length);
			var tip=$('#_js_answerText .err-tips');
			if(length>1000){
				tip.html("内容最大长度不能超过1000");
				$('#_js_answerText').attr('data-flag','false');
				tip.css('display','block');
			}else{
				tip.css('display','none');
				$('#_js_answerText').attr('data-flag','true');
				if(length==0){
					tip.html("内容不能为空");
					$('#_js_answerText').attr('data-flag','false');
					tip.css('display','block');
				}
			}
		});
	});
}

function addTag(){
	$('.add-tag').on('blur',function(){
		var text=this.value;
		var tags=$('._j_tags .a-tag');
		if(text.length>0){
			var aTag=$('<a class="a-tag" data-tag="'+text+'"><em>'+text+'</em><i class="_j_del_tag">×</i></a>');
			$(this).before(aTag);
			$(this).val('');
			deleteTag();
			if(tags.length==4){
				$(this).css('display','none');
			}
		}
	});
	
}

function deleteTag(){
	$('._j_del_tag').unbind('click');
	$('._j_del_tag').on('click',function(){
		$(this).parent().remove();
		var tags=$('._j_tags .a-tag');
		if(tags.length==4){
			$('._j_tags .add-tag').css('display','block');
		}
	});
}

function submitQuestion(){
	$('._j_publish').bind('click',function(){
		var title=$('._j_title').val();
		if(title.trim().length==0){
			alert('标题不能为空');
			return;
		}
		var location=$('._j_mddid').val();
		var type=$('._j_category').attr('data-cid');
		var content=editor.document.getBody().getText();
		if(content.trim().length==0){
			alert('内容不能为空');
			return;
		}
		var html=editor.document.getBody().getHtml();
		var keys=$('.a-tag em');
		var key='';
		for(var i=0;i<keys.length;i++){
			key+=keys.eq(i).html()+';';
		}
		var params={'title':title,'location':location,'qtype':type,'content':content,'html':html,'keys':key};
		$.ajax({
			type:'post',
			url:'qa',
			data:{'type':"addq",'params':JSON.stringify(params)},
			dataType:"json",
			success:function(data){
				window.location.href="qadetail.jsp?qid="+data.id;
			},
			error:function(msg){
				alert(msg);
			}
		});
	});
}

function groupquestion(){
	$.each($('.cate-tab li'),function(){
		
		$(this).bind('click',function(){
			$('.cate-tab li').removeClass('on');
			$(this).addClass('on');
		});
	});
}

function loadmore(){
	$('._j_page_loader').bind('click',function(){
		var index=$(this).attr('data-index');
		$.ajax({
			type:'post',
			url:'qa',
			data:{'type':"load",'index':index},
			dataType:"json",
			success:function(data){
				if(data.flag==1){
					var list=data.list;
					var inner='';
					
					for(var i=0;i<list.length;i++){
						inner+='<li class="item clearfix _j_question_item">'+
    						'<div class="wen">'+
				        '<div class="label">'+
				            '<span class="avatar avatar32">'+
				            	'<a href="/wenda/u/88971262.html" class="_j_filter_click" target="_blank">'+
				                	'<img class="_j_filter_click" src="" height="32" width="32">'+
				                '</a>'+
				            '</span>'+
				            '<span class="icon icon-gl"></span>'+
				        '</div>'+
				        '<div class="title">'+
				            '<a href="" class="_j_filter_click" target="_blank">'+list[i].title+'</a>'+
				        '</div>'+
				    '</div>'+

					'<div class="da">'+
        				'<div class="label">'+
				            '<span class="avatar avatar48">'+
				            	'<a href="" target="_blank" class="_j_filter_click">'+
				            		'<img class="_j_filter_click" src="" height="48" width="48">'+
				            	'</a>'+
				            '</span>'+
				            '<span class="icon icon-da"></span>'+
				        '</div>'+
						'<div class="user">'+
				            '<a class="name _j_filter_click" href="/wenda/u/92597770.html" target="_blank">阿茜麦</a>'+
				            '<a class="level _j_filter_click" href="/rank/lv.php?uid=92597770" target="_blank">LV.13</a>'+
				            '<div class="usertitle"></div>'+
				        '</div>'+
        				'<div class="desc">'+
                            '<p>'+list[i].content+'</p>'+
            			'</div>'+
					'</div>'+
				    '<div class="tags">'+
				        '<a class="a-tag _j_filter_click" href="/wenda/area-10189.html" target="_blank">香港</a>'+
				        '<a class="a-tag _j_filter_click" href="/wenda/tag-1310.html" target="_blank">海洋公园</a>'+
				        '<a class="a-tag _j_filter_click" href="/wenda/tag-1298.html" target="_blank">交通</a>'+
				    '</div>'+

					'<div class="info clearfix">'+
				        '<ul class="">'+
				            '<li>'+
				                '<span class="time">42分钟前</span>'+
				            '</li>'+
				            '<li><a>有用 ('+list[i].accept+')</a></li>'+
				            '<li><a>同问 (0)</a></li>'+
				            '<li>回答 ('+list[i].reply+')</li>'+
				            '<li>'+
				                '<a>浏览 ('+list[i].readtime+')</a>'+
				            '</li>'+
				        '</ul>'+
     					
					'</div>'+
				'</li>';
					}
					var li=$(inner);
					$('._j_pager_box').append(li);
					
				}else{
					alert(data.msg);
				}
			},
			error:function(msg){
				alert(msg);
			}
		});
	});
}