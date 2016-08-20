<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ include file="_sessioncheck.jsp" %>
<%@ page import="com.bean.UserInfo" %>
<%
	UserInfo us=null;
	String nickname=null;
	String headpic=null;
	if(u!=null){
		us=u.getProperty();
		nickname=us.getNickname();
		headpic=us.getHeadpicture();
	}
	
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>发表问题</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/personal.css">
	<script type="text/javascript" src="../js/page.js" ></script>
	<script type="text/javascript" src="../js/question.js" ></script>
	<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var userId="<%=u==null?"":u.getId() %>";
			login();
			dropmenu();
			showType();
			titleCheck();
			detailCheck();
			addTag();
			deleteTag();
			submitQuestion();
		});
	</script>

  </head>
  
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
                	<li class="head-nav-hotel"><a href="travelnotes.jsp" title="游记攻略">游记攻略</a></li>
                	<li class="head-nav-community head-nav-dropdown _j_shequ_nav_show head-nav-active" id="_j_nav_community"><a href="qa.jsp"title="论坛">论坛</a></li>

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
	                    
						<li><a href="" target="_blank" rel="nofollow">私信</a></li>
						<li><a href="" target="_blank" rel="nofollow">系统通知</a></li>
						<li><a href="" target="_blank" rel="nofollow">问答消息</a></li>
	
	                </ul>
	            </div>
	            
	            <div style="display: none;" class="dropdown-menu dropdown-user hide" id="_j_user_panel">
	                <ul>
	                    <li><a href="personalinfo.jsp" target="_blank" title="我的窝" rel="nofollow" ><i class="icon-wo"></i>我的窝<span class="level">LV.1</span> </a></li>
	                    <li><a href="writenote.jsp" target="_blank" class="drop-write" title="写游记" rel="nofollow" ><i class="icon-writenotes"></i>写游记</a></li>
	                    <li><a href="myqa.jsp" target="_blank" title="我的问答" rel="nofollow" ><i class="icon-wenda"></i>我的问答</a></li>
	                    <li><a href="myfriend.jsp" target="_blank" title="我的好友" rel="nofollow" ><i class="icon-friend"></i>我的好友</a></li>
	                    <li><a href="myorder.jsp" title="我的订单" target="_blank" rel="nofollow"><i class="icon-order"></i>我的订单</a></li>
	                    <li><a href="loginout.jsp" title="退出登录" rel="nofollow"><i class="icon-logout"></i>退出</a></li>
	                </ul>
	            </div>
			</div>
			<div class="shadow"></div>

		</div>
	</div>

	<div class="wrap">
		<div class="crumb">
	        <a href="qa.jsp">旅游问答</a>
	        &gt;
	        <strong>我要提问</strong>
	    </div>
		<div class="q-create">
				<div class="item item-title ">
		            <div class="content _j_word">
		                <h2>问题标题</h2>
						<a name="inputtitle"> </a>
		                <div class="area"><textarea class="_j_title _j_word_check" data-flag="false" placeholder="标题不少于15个字哦"></textarea></div>
		                <p class="txt-gray mt10">
		                    <span class="_j_word_num">0</span>/<span class="_j_max_num">80</span> 字
		                    <span class="_j_min_num" style="display:none;">15</span>
		                </p>
		                <div class="side-tips"><p>提问三大招：【具体】、【真实】、【诚恳】<br>结伴/交易/与旅行无关的提问【将被删除】，到时候别哭哦~</p></div>
		                <div class="err-tips" style="display: none;"></div>
		            </div>
		        </div>
		        <div class="item item-location">
		        	<div class="content">
		        		<h3 class="hd">选择目的地</h3>
		        		<div class="area"><textarea class="_j_mddid"></textarea></div>
		        	</div>
		        </div>
		        <div class="item item-reward">
		            <div class="content">
		                <h3 class="hd">选择正确分类，问题才能得到尽快回答</h3>
		                <div class="ui-sel _j_cate_dropbox">
						    <div class="sel-hd err-input"><i><b></b></i><span class="_j_category" data-cid="0">请选择分类</span></div>
						    <ul class="sel-bd _j_cate_list" style="display: none;">
						                <li class="_j_option_next" data-cid="1">行程</li>
						                <li class="_j_option_next" data-cid="2">美食</li>
						                <li class="_j_option_next" data-cid="4">住宿</li>
						                <li class="_j_option_next" data-cid="5">购物</li>
						                <li class="_j_option_next" data-cid="6">当地体验</li>
						                <li class="_j_option_next" data-cid="7">交通</li>
						                <li class="_j_option_next" data-cid="8">出入境</li>
						                <li class="_j_option_next" data-cid="9">实用指南</li>
						                <li class="_j_option_next" data-cid="88">通讯</li>
						                <li class="_j_option_next" data-cid="98">蚂蜂窝</li>
						     </ul>
						      
						 </div>
						 <div class="err-tips" style="display: none;"></div>
					</div>
		        </div>
		        
		        <div class="item item-detail">
		            <div class="content _j_word" id="_js_answerText" data-flag="false">
		                <div class="popup-title clearfix">
		                    <h3 class="hd flt1">
		                       	 问题详细内容
		                    </h3>
		                </div>
		                <div class="area">
		                	<div class="wysiwyg-container">
		                		<textarea name="question"></textarea>
		                		<script type="text/javascript">
									var editor = CKEDITOR.replace('question', { height: '112px', width: '665px' });
								</script>
			                </div>
			            </div>
			            <p class="txt-gray mt10">
			                <span class="_j_word_num">0</span>/<span class="_j_max_num">1000</span> 字
			            </p>
			            <div class="side-tips"><p>详细说明此问题，背景信息、具体疑问、参考资料等。如有多个疑问，建议分条说明。</p></div>
			            <div class="err-tips" style="display: none;"></div>
		         	</div>
		        </div>
		        
		        
		        <div class="item item-tag">
		            <div class="content">
		                <h3 class="hd">添加问题标签</h3>
		                <div class="bd _j_tags">
		                	
		                    <input class="add-tag" type="text">
		                </div>
		                <div class="side-tips"><p>添加恰当的标签，能让更多擅长此类问题的蜂蜂来回答。觉得标签不够准确，可自行删减。前2个标签是系统分类，建议保存。<br>每个问题最多可添加5个标签。</p></div>
		                <div class="err-tips" style="display: none;"></div>
		            </div>
		        </div>
		        
		        <div class="item-action"><a class="_j_publish _j_loading_elem" href="#">发布问题 </a></div>
		        
		        
		</div>

	</div>


	<div id="footer">
		
		<div class="wrap">
			

			<p>生活不止眼前的苟且，还有诗和远方的田野</p>

		</div>

	</div>
</html>
