<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%@ page import="com.bean.UserInfo" %>
<%@ page import="com.bean.Question" %>
<%
	User u=(User)session.getAttribute("user");
	String nickname="";
	Question q=null;
	String headpic="images/pp120.jpg";
	if(u!=null){
		UserInfo us=u.getProperty();
		nickname=us.getNickname();
		headpic=us.getHeadpicture();
	}
	String qid=request.getParameter("qid");
	if(qid!=null){
		q=Question.getQuestionById(qid);
	}
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>问答</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/view.css">
	<script type="text/javascript" src="../js/page.js" ></script>
	<script type="text/javascript">
		
		$(document).ready(function(){
			login();
			loginsubmit();
			dropmenu();
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
	                <input id="lpassport" name="passport" placeholder="您的邮箱/手机号" autocomplete="off" class="" value="" type="text">
	            </div>
	            <div class="login-input">
	                <input id="lpassword" name="password" placeholder="您的密码" autocomplete="off" class="" type="password">
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
					<a title="重庆旅游" href="../index.html"><img class="logo-l" src="../images/logo.jpg"></a>
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
                	<li class="head-nav-hotel"><a href="travelnotes.jsp" title="游记攻略">游记攻略</a></li>
                	<li class="head-nav-community head-nav-dropdown _j_shequ_nav_show  head-nav-active" id="_j_nav_community"><a href="qa.jsp"title="论坛">论坛</a></li>

				</ul>
				
				<% if(u==null){ %>
				<div class="login-out">
					<a id="_j_showlogin" title="登录蚂蜂窝" href="javascript:;" rel="nofollow">登录</a>
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
	                    <li><a href="myorder.jsp" title="我的订单" target="_blank" rel="nofollow" data-cs-p="order"><i class="icon-order"></i>我的订单</a></li>
	                    <li><a href="loginout.jsp" title="退出登录" rel="nofollow"><i class="icon-logout" data-cs-p="logout"></i>退出</a></li>
	                </ul>
	            </div>
			</div>
			<div class="shadow"></div>

		</div>

	</div>


	<div id="qadetail" class="qadetail">
		<div class="wrap clearfix">
			<div class="col-main">
				<div class="crumb">
	                <a href="/wenda/" target="_blank">蚂蜂窝问答</a> &gt; <span><%=q.getTitle() %></span>
	            </div>

	            <div class="search">
				
					<div class="search-panel">
					    <div class="hd clearfix _j_suggest_hd">
					        <div class="sp-input">
					            <input class="_j_suggest" placeholder="提问前请先搜索，看看你的问题其他蜂蜂是否已经问过" type="text">
					        </div>
					        <div class="sp-button">
					            <input class="_j_search clickstat" data-cs-p="suggest_goto_search" type="button">
					        </div>
					    </div>
					    <div class="bd _j_suggest_box" style="display: none;"></div>
					</div>
				</div>


				<div id="" class="q-detail">
					<div class="q-content">
						<div class="q-title">
	                        <a href="/wenda/area-11030.html" target="_blank" class="location"><i></i><%=q.getLocation() %></a>
	                        <h1><%=q.getTitle() %></h1>
	                        
	                    </div>

	                    <div class="q-desc">
	                    	<%=q.getHtml() %>
						</div>

						<div class="q-info1 clearfix">
	                        <div class="q-tags fl">
	                        	<a class="a-tag" href="/wenda/tag-1451.html" target="_blank">自由行</a>
	                            <a class="a-tag" href="/wenda/tag-1294.html" target="_blank">行程</a>
	                            <a class="a-tag" href="/wenda/area-11030.html" target="_blank">济州岛</a>
	                        </div>
	                        <div class="pub-bar fr">
	                            <a href="/wenda/u/32924263.html" class="photo"> <img src="../<%=headpic %>" height="16" width="16"></a>
	                            <a class="name" href="/wenda/u/32924263.html" target="_blank"><%=q.getAuthor() %></a>
	                            <span class="time"><%=q.getQtime() %></span>
	                        </div>
	                    </div>
					</div>

					<div class="q-operate clearfix">
	                    

	                    <div class="fr">
		                    <span class="atten-num"><span id="_j_same_num">0</span>人关注</span>
		                        <a class="btn-atten _j_same_question" rel="nofollow">关注</a>
		                    <a class="btn-answer _j_btn_goanswer" rel="nofollow">回答</a>                                            
		                </div>

	                </div>


				</div>


				<div class="answer-wrap">
					
					<div class="hd" id="_j_anum"><%=q.getReply() %>个回答</div>
					<div class="pagelet-block">
						<div class="bd">
							
							<ul class="answer-list _j_pager_box">
								<li class="answer-item clearfix _j_answer_item _js_answer6491073">
									<div class="answer-user _js_answerAva">
										
								        <a class="_j_filter_click" href="/wenda/u/68145594.html" target="_blank">
								        	<img src="http://file31.mafengwo.net/M00/33/92/wKgBs1cwuSGAWQZDAADEru4LgaU87.head.w48.jpeg" class="photo" height="48" width="48">
								        </a>
								        <a class="btn-zan _js_zan "><i></i><span>2</span></a>
    
									</div>

									<div class="answer-content">
										<div class="answer-info clearfix">
								            <div class="user-bar fl">
								                <a class="name" href="/wenda/u/68145594.html" target="_blank">砖砖砖砖砖砖砖砖</a>
								                <a class="level" href="/rank/lv.php?uid=68145594" target="_blank" rel="nofollow">LV.16</a>
								            </div>
								        </div>

								        <div class="_j_answer_html">
								        	不会很赶，但是牛岛上面应该玩不到那么久，可以牛岛和日出峰一天完成<br>
											第三天就在西归浦一路回中文区，可以去山君不离，独立岩啊，偶来小路，柱状节理带<br>
											第四天的行程比较简单点咯，去一下中文区附近的博物馆，这样不会太累，而且不怕耽误时间，<br>
											也不会离的太远。<br>
											但是总体行程是不错的，不会太赶，行程可以慢慢调整的<br>
										</div>
									</div>

								</li>


							</ul>
						</div>
					</div>
				</div>


			</div>

			<div class="col-side"></div>
		</div>
	</div>

	<div id="footer">
		
		<div class="wrap">
			

			<p>生活不止眼前的苟且，还有诗和远方的田野</p>

		</div>

	</div>


</body>
</html>
