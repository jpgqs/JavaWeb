<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ include file="_sessioncheck.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>游记攻略</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/personal.css">
	<script type="text/javascript" src="../js/page.js" ></script>
	<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var userId="<%=u==null?"":u.getId() %>";
			login();
			dropmenu();
			notetitle();
			notesubmit();
			addheadpic();
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
	                <input name="passport" placeholder="您的邮箱/手机号" autocomplete="off" data-verification-name="帐号" class="" value="" type="text">
	            </div>
	            <div class="login-input">
	                <input name="password" placeholder="您的密码" autocomplete="off" data-verification-name="密码" class="" type="password">
	            </div>
	            
	            <div class="login-buttons">
	                <button type="submit">登录</button>
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
					<a id="_j_showlogin" title="登录蚂蜂窝" href="javascript:;" rel="nofollow">登录</a>
					<span class="split">|</span>
					<a href="travel/register.jsp" title="注册帐号" rel="nofollow">注册</a>
				</div>
					<% } else { %>
				<div class="login-info">
					<div class="head-user" id="_j_head_user">
                        <a class="drop-trigger" href="personalinfo.jsp" title="<%=u.getId() %>的窝" rel="nofollow">
                            <div class="user-image">
                            	<img src="../images/pp120.jpg" alt="小明。的窝" height="32" width="32">
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
	                    <li><a href="order.jsp" title="我的订单" target="_blank" rel="nofollow"><i class="icon-order"></i>我的订单</a></li>
	                    <li><a href="loginout.jsp" title="退出登录" rel="nofollow"><i class="icon-logout"></i>退出</a></li>
	                </ul>
	            </div>
			</div>
			<div class="shadow"></div>

		</div>
	</div>

	<div class="wrap">
		<div class="ap-head">
			<h1>发表新话题/文章</h1>
		</div>
		
		<div class="set_index">
				<div id="_j_pluplader_btn_container_1" class="set_page">
	            	<a role="button" class="set_add  _j_uploaderattop _j_upload_toppic" id="_j_upload_toppic"></a>
	                <h2>设置游记头图</h2>
	                <p>图片建议选择尺寸大于1680px的高清大图，如相机原图</p>
	                <div class="clear"></div>
	            	<div style="position: absolute; top: 200px; left: 275px; width: 67px; height: 67px; overflow: hidden; z-index: -1;" class="moxie-shim moxie-shim-html5" id="">
			<form id="picform" enctype="multipart/form-data" method="post" action="upload.jsp">
	            <input accept="image/jpg,image/jpeg,image/png,image/gif" id="picpath" name="pic" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" type="file" />
			</form>
	            	</div>
	            </div>
		</div>
		<div class="ap-wrap">
                <input type="hidden" id="userid" value="<%=u==null?"":u.getId() %>"/>
                <input type="hidden" id="headpic" value=""/>
                <dl class="title cf">
                    <dd>
                        <label style="display: block;" class="">请在这里输入标题</label>
                        <span class="char-limit _j_char_limit hide">可输入<strong>48</strong>字</span>
                        <input id="title" name="title" maxlength="48" value="" type="text">
                        <input id="headpath" name="headpath" type="hidden">
                        <input id="gid" name="gid" value="0" type="hidden">
                        <input id="cid" name="cid" type="hidden">
                        <input id="rid" name="rid" value="0" type="hidden">
                        <input id="sfrom" name="sfrom" value="0" type="hidden">
						<input name="target" value="iframe" type="hidden">
                    </dd>
                </dl>

                <dl class="body cf">
                    <dd name="content_div" id="content_div">
                        <div style="width: 665px;" class="mfweditor">
                        	<textarea name="news" style="width:500px;"></textarea> 
								<script type="text/javascript">
								var editor = CKEDITOR.replace('news', { height: '440px', width: '1000px' });
							</script>
                        </div>

                    </dd>
                </dl>

               
                <div class="btns">
                    
                    <input id="notesubmit" class="btn_submit" value="发表" type="button">
                    <div class="cont">或者</div>
                    <input class="btn_save" value="保存草稿" type="button">
                   
                </div>
		</div>

	</div>


	<div id="footer">
		
		<div class="wrap">
			

			<p>生活不止眼前的苟且，还有诗和远方的田野</p>

		</div>

	</div>
</html>
