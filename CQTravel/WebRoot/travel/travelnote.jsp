<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.Note" %>
<%@ page import="com.bean.NoteReply" %>
<%@ page import="com.bean.UserInfo" %>
<%@ page import="com.bean.User" %>
<%
	String noteid=request.getParameter("noteid");
	Note n=null;
	UserInfo ui=null;
	User u=(User)session.getAttribute("user");
	ArrayList<NoteReply> nrs=null;
	String notepic=null;
	if(noteid!=null){
		n=Note.getNoteById(noteid);
		if(n!=null){
			String author=n.getAuthor();
			ui=UserInfo.getInfoById(author);
			nrs=n.getReplies();
			notepic=n.getHeadpicture();
		}
	}
	String nickname="";
	String headpic="images/pp120.jpg";
	if(u!=null){
		UserInfo us=u.getProperty();
		nickname=us.getNickname();
		headpic=us.getHeadpicture();
	}
	
	
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>游记攻略</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/view.css">
	<script type="text/javascript" src="../js/page.js" ></script>
	<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			contentfocus('<%=n.getAuthor() %>','<%=n.getId() %>')
			login();
			loginsubmit();
			dropmenu();
			detailding();
		});
	</script>
</head>
<body>
	<div class="loginbg" style="display:none;"></div>
	<div class="loginbox" style="display:none;">
		<div class="title">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>登录</h3>
     	</div>

     	<div class="loginnav">
     		<form action="" method="post">
     			
	            <div class="errer-info hide"></div>
	            <p>在这里你可以查找攻略，分享旅行，结识朋友</p>
	           <div class="login-input">
	                <input id="lpassport" name="passport" placeholder="您的邮箱/手机号" autocomplete="off"class="" value="" type="text">
	            </div>
	            <div class="login-input">
	                <input id="lpassword" name="password" placeholder="您的密码" autocomplete="off"  class="" type="password">
	            </div>
	            
	            <div class="login-buttons">
	                <input id="loginsubmit" value="登录" type="button">
	                <span><a href="/forget">忘记密码?</a></span>
	            </div>

	     	</form>
     	</div>
     	<div class="regist-link">还没有注册？<a href="/regist.html">立即注册&gt;&gt;</a></div>
	</div>
	<div id="header">
		<div class="myheader">
			
			<div class="header-wrap clearfix">
				<div class="logo">
					<a title="重庆旅游" href="../index.jsp"><img class="logo-l" src="../images/logo.jpg"></a>
				</div>
				
				<ul id="head-nav" class="head-nav">
					
					
                	<li class="head-nav-index "><a href="../index.jsp">首页</a></li>
               		<li class="head-nav-place"><a href="destination.jsp" title="目的地">目的地</a></li>
                	<li class="head-nav-gonglve"><a href="hotel.jsp" title="酒店推荐">酒店推荐</a></li>
                	<li class="head-nav-sales head-nav-dropdown _j_sales_nav_show" id="_j_nav_sales">
                    	<a class="drop-toggle" href="view.jsp"title="旅游景点">
                        	旅游景点
                    	</a>
                	</li>
                	<li class="head-nav-hotel  head-nav-active"><a href="travelnotes.jsp" title="游记攻略">游记攻略</a></li>
                	<li class="head-nav-community head-nav-dropdown _j_shequ_nav_show" id="_j_nav_community"><a href="qa.jsp"title="论坛">论坛</a></li>

				</ul>
				
				<% if(u==null){ %>
				<div class="login-out">
					<a id="_j_showlogin" title="登录我的窝" href="javascript:;" rel="nofollow">登录</a>
					<span class="split">|</span>
					<a href="register.jsp" title="注册帐号" rel="nofollow">注册</a>
				</div>
					<% } else { %>
				<div class="login-info">
					<div class="head-user" id="_j_head_user">
                        <a class="drop-trigger" href="personalinfo.jsp" title="<%=nickname %>的窝" rel="nofollow">
                            <div class="user-image">
                            	<img src="../<%=headpic %>" alt="<%=nickname %>的窝" height="32" width="32">
                            </div>
                            
                            <i class="icon-caret-down"></i>
                        </a>
                    </div>
                    
                    <div class="head-msg" id="_j_head_msg">
                        <a class="drop-trigger" href="javascript:" rel="nofollow">
                            <i class="icon-msg"></i>
                           		 消息
                            <i class="icon-caret-down"></i>
                            <span style="display: none;" class="head-msg-new hide"></span>
                        </a>
                    </div>
				</div>
					<% } %>
			
			</div>
			
			<div class="dropdown-group">
				<div class="dropdown-menu dropdown-msg hide" id="_j_msg_panel" style="z-index: 10; display: none;">
	                <ul>
	                    
						<li><a href="personalmsg.jsp" target="_blank" rel="nofollow">私信</a></li>
						<li><a href="sysmsg.jsp" target="_blank" rel="nofollow">系统通知</a></li>
						<li><a href="" target="_blank" rel="nofollow">问答消息</a></li>
	
	                </ul>
	            </div>
	            
	            <div style="display: none;" class="dropdown-menu dropdown-user hide" id="_j_user_panel" data-cs-t="user_nav">
	                <ul>
	                    <li><a href="personalinfo.jsp" target="_blank" title="我的窝" rel="nofollow" data-cs-p="wo"><i class="icon-wo"></i>我的窝<span class="level">LV.1</span> </a></li>
	                    <li><a href="writenote.jsp" target="_blank" class="drop-write" title="写游记" rel="nofollow" data-cs-p="writenotes"><i class="icon-writenotes"></i>写游记</a></li>
	                    <li><a href="myqa.jsp" target="_blank" title="我的问答" rel="nofollow" data-cs-p="wenda"><i class="icon-wenda"></i>我的问答</a></li>
	                    <li><a href="myfriend.jsp" target="_blank" title="我的好友" rel="nofollow" data-cs-p="friend"><i class="icon-friend"></i>我的好友</a></li>
	                    <li><a href="order.jsp" title="我的订单" target="_blank" rel="nofollow" data-cs-p="order"><i class="icon-order"></i>我的订单</a></li>
	                    <li><a href="loginout.jsp" title="退出登录" rel="nofollow"><i class="icon-logout" data-cs-p="logout"></i>退出</a></li>
	                </ul>
	            </div>
			</div>
			<div class="shadow"></div>

		</div>
	</div>
	<% if(notepic!=null){ %>
	<div id="pic">
		<div id="pic_container" class="show-slider">
			<ul class="show-image">
				<li class="first">
					<a class="show-pic" href="">
						<img src="../<%=n.getHeadpicture() %>">
					</a>

				</li>

			</ul>
			<div class="title_bg"></div>
			<div class="view_info">
				
	            <div class="vi_con">
	                <h1 style="white-space: nowrap; word-wrap: normal;" class="headtext lh80"><%=n.getTitle() %></h1>
	            </div>
	        </div>
		</div>
	</div>
	<div class="view_title clearfix">
        <div id="" class="pagelet-block" >
        	<div class="vt_center">
            	<div class="ding _j_ding_father">
                	<a rel="nofollow" class="up_act" href="javascript:;" data-value="<%=n.getId() %>" title="顶">顶</a>
					<div id="opt<%=n.getId() %>" class="num _j_up_num"><%=n.getOpt() %></div>
        		</div>
        		<div class="person">
        			<a href="/u/86548609.html" target="_blank" class="per_pic">
        				<img src="../<%=ui.getHeadpicture() %>" alt="" width="120">
        			</a>
                	<strong>
                		<a href="" target="_blank" class="per_name" title="<%=ui.getNickname() %>"><%=ui.getNickname() %></a>
                	</strong>
        			<a href="" target="_blank" class="per_grade" title="LV.11">LV.1</a>
                    <a href="javascript:void(0);" class="per_attention">
                		<img src="http://images.mafengwo.net/images/home/tweet/btn_sfollow.gif" title="关注TA" border="0" height="13" width="38">
            		</a>
                <div class="vc_time">
            		<span class="time"><%=n.getUploadtime() %></span>
            		<span><i class="ico_view"></i><%=n.getReadtime() %>/<%=n.getReply() %></span>
                </div>
            </div>
            
        		<div class="bar_share _j_share_father _j_top_share_group">
            	
					<div class="bs_collect ">
					    <a href="javascript:void(0);" rel="nofollow" title="收藏" class="bs_btn _j_do_fav" >
					    	<i></i>
					    	<span><%=n.getCollect() %></span>
					    	<strong>收藏</strong>
					    </a>
					</div>
        		</div>
        	</div>
        </div>
	</div>


	<% }else{ %>
	
	<div class="post-hd">
	    <div class="post-hd-wrap clearfix">
	        
	        <div class="post_title clearfix">
	            <h1><%=n.getTitle() %></h1>
	        </div>
	                
	        <div class="bar_share">            
				<div class="bs_collect">
				    <a href="javascript:void(0);" rel="nofollow" title="收藏" class="bs_btn _j_do_fav"><i></i><span><%=n.getCollect() %></span><strong>收藏</strong></a>
				</div>

		                
		        <div class="post-up">
		    
		        	<a role="button" rel="nofollow"  class="up_act" title="顶">顶</a>
		    
		    		<div class="num _j_up_num topvote675289"><%=n.getOpt() %></div>
				</div>

	                
	                
	    	</div>
        
    	</div>
	</div>
	<% } %>
	<div class="post_wrap view">
		<div class="post_main no-border">
			
			<div class="post_item">
			
			<% if(notepic==null){ %>
				<div class="author_info" style="display:block;">
                	<div class="avatar_box">
                    	<div class="out_pic" val="17571560">
	                        <a href="/u/17571560.html" target="_blank">
	                            <img src="../<%=ui.getHeadpicture() %>" title="<%=ui.getNickname() %>" width="48">
	                        </a>
                            <a target="_blank" href="/club/" class="i-fengshou"></a>
                        </div>
                    <div>
	                </div>
	                    <div class="out_lv">
	                    	<a href="/rank/lv.php?uid=17571560" target="_blank">LV.28</a>
	                    </div>
	                </div>
	                <div class="out_flw">
	                    <a href="#" class="_j_add_friend _j_remove" data-to_uid="17571560">
	                    	<img src="http://images.mafengwo.net/images/home/tweet/btn_sfollow.gif" title="关注TA" border="0" height="13" width="38">
	                    </a>
	                </div>
            	</div>
			<% } %>
			
				<div class="post_info">
					<% if(notepic==null){ %>
	                <div class="tools no-bg">
	                    <div class="fl">
	                        <a class="name" href="/u/366786.html" target="_blank"><%=ui.getNickname() %></a>
	                        <span class="date"><%=n.getUploadtime() %></span>
	                    </div>
	                    <div class="act3" data-cs-t="ginfo_person_operate">
	                         <a href="/i/675289.html?landlord_only=1">只看楼主</a>&nbsp;&nbsp;
	                                                                                        
	                        <a onclick="contentfocus('<%=n.getAuthor() %>','<%=n.getId() %>');" href="#pos">回复</a>
	                            
	                        <a href="#" class="report">举报</a>&nbsp;
	                                                        
	                    </div>
	                     <div class="clear"></div>
	                </div>
					<div class="summary">
	                        <div id="exinfo-kwinfo"></div>
	                    </div>
					<% } %>
	                <div class="a_con_text cont" id="pnl_contentinfo" >
	                    
	                    
	                    <p class="_j_note_content">
	                    	<%=n.getHtmlcode() %>
						</p>
	                        
	                </div>
	                <div class="integral">
	                    <div class="legend">获得积分</div>
	                    <a href="/rank/lv.php">
	                       		 发表游记 <b>+30</b>&nbsp;&nbsp;文章被回复 <b><%=n.getReply() %></b></a>
	                </div>

	                <div class="clear"></div>
				</div>
			
				<div class="clear"></div>
			</div>
			
			<div class="post-btm"></div>

			<div class="pagelet-block">
				<div id="_j_reply_list">
					<% if(nrs!=null&&nrs.size()>0){
							for(NoteReply nr:nrs){
								String author=nr.getAuthor();
								String replied=nr.getRepliedid();
								UserInfo ui1=UserInfo.getInfoById(author);
								UserInfo ui2=UserInfo.getInfoById(replied);
					 %>
					<div id="" class="vc_comment">
            			<div class="comm_user">
			                <div class="avatar">
			                    <a href="/u/366786.html" title="王晓喵每天都想去旅行" target="_blank">
			                        <img src="../<%=ui1.getHeadpicture() %>" alt="<%=ui1.getNickname() %>" width="48" height="48">
			                    </a>
			                </div>
			            </div>
			            <div class="comm_con">
			                <dl>
			                    <dt class="clearfix">
				                    <div class="comm_info">
				                        <a href="/u/292708.html" class="comm_name" target="_blank"><%=ui1.getNickname() %></a>
				                        <a href="/u/292708.html" class="comm_grade" target="_blank">LV.11</a>
				                        <a href="javascript:void(0);" role="button" class="comm_attention">
				                            <img src="http://images.mafengwo.net/images/home/tweet/btn_sfollow.gif" title="关注TA" border="0" height="13" width="38">
				                         </a>
				                        <br>
				                        <span class="comm_time"><%=nr.getReplytime() %></span>
				                    </div>
				                    <div class="comm_reply">
				                        <a onclick="contentfocus('<%=nr.getAuthor() %>','<%=n.getId() %>');" href="#pos" class="_j_reply">回复</a>
				                        <a href="javascript:void(0);" class="_j_quote">引用</a>
				                        <a href="javascript:void(0);" >举报</a>
				                    </div>
			                    </dt>
			                    <dd>
			                    	
			                        <div class="comm_word">
			                            <p>回复<%=ui2.getNickname() %>：<%=nr.getContent() %></p>
			                        </div>
			                    </dd>
			                </dl>
			            </div>
		        	</div>
					<% 		}
						}
					 %>
		        	

				</div>
				
				<div class="vc_reply">
					<div class="avatar">
			                    <a href="/u/366786.html" title="<%=nickname %>" target="_blank">
			                        <img src="../<%=headpic %>" alt="<%=nickname %>"  width="48" height="48">
			                    </a>
			        </div>

			        <div class="vc_tags">
			        	

        				<a href="http://www.mafengwo.cn/i/3461300.html" target="_blank" class="about_jp flt2"><span>关于举牌</span><i></i></a>
                		<ul id="vcTags">
            				<li class="_j_publish_tab on">回复游记</li>
                    	</ul>
    
			        </div>
					<input type="hidden" id="noteId" value="" />
					<input type="hidden" id="rauthor" value="<%=u==null?"":u.getId() %>" />
					<input type="hidden" id="rreply" value="" />
			        <div id="pos">
			        	
			        	<textarea name="news" style="width:500px;"></textarea> 
								<script type="text/javascript">
								var editor = CKEDITOR.replace('news', { height: '240px', width: '800px' });
								
							</script>

						<div class="publish_reply">
							<a id="replysubmit" href="javascript:void(0);" class="btn_big _j_publish_reply" title="发表回复">发表回复</a>
						</div>
			        </div>

				</div>
				
			</div>


		</div>
	</div>

	<div id="footer">
		
		<div class="wrap">
			

			<p>生活不止眼前的苟且，还有诗和远方的田野</p>

		</div>

	</div>

	
</body>
</html>
