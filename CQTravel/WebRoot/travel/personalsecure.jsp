<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ include file="_sessioncheck.jsp" %>
<%@ page import="com.bean.UserInfo" %>
<%
	UserInfo us=u.getProperty();
	String password=u.getPassword();
	String email=us.getEmail();
	String phone=us.getPhone();
	String nickname=us.getNickname();
	String headpic=us.getHeadpicture();
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>账号安全</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/personal.css">
	<script type="text/javascript" src="../js/page.js" ></script>
	<script type="text/javascript">
		var userId="<%=u.getId() %>";
		$(document).ready(function(){
			login();
			dropmenu();
			usersecure();
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
	                <input name="passport" placeholder="您的邮箱/手机号" autocomplete="off" data-verification-name="帐号" class="" value="" type="text">
	            </div>
	            <div class="login-input">
	                <input name="password" placeholder="您的密码" autocomplete="off" data-verification-name="密码" class="" type="password">
	            </div>
	            
	            <div class="login-buttons">
	                <input id="loginsubmit" value="登录" type="button">
	                <span><a href="/forget">忘记密码?</a></span>
	            </div>

	     	</form>
     	</div>
     	<div class="regist-link">还没有注册？<a href="/regist.html">立即注册&gt;&gt;</a></div>
	</div>
	
	<div class="pwdbox" style="display:none;">
		<div class="title">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>修改密码</h3>
     	</div>
     	
     	<div class="loginnav">
     		<form action="" method="post">
     			
	            <div class="errer-info hide"></div>
	            <div class="login-input">
	                <input id="oldpassword" name="oldpassword" placeholder="您的旧密码" autocomplete="off" class="" value="" type="password">
	            </div>
	            <div class="login-input">
	                <input id="newpassword" name="newpassword" placeholder="您的新密码" autocomplete="off" class="" type="password">
	            </div>
	            <div class="login-input">
	                <input id="newpassword1" name="newpassword1" placeholder="重复您的新密码" autocomplete="off" class="" type="password">
	            </div>
	            
	            <div class="login-buttons">
	                <input id="pwdalter" value="提交修改" type="button">
	            </div>

	     	</form>
     	</div>
	</div>
	<div class="emailbox" style="display:none;">
		<div class="title">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>绑定邮箱</h3>
     	</div>
     	
     	<div class="loginnav">
     		<form action="" method="post">
     			
	            <div class="errer-info hide"></div>
	            <p>忘记密码后，可以根据绑定的邮箱找回密码，请确认信息的准确</p>
	            <div class="login-input">
	                <input id="email" name="email" placeholder="您的邮箱" autocomplete="off" class="" value="" type="text">
	            </div>
	            
	            <div class="login-buttons">
	                <input id="emailsubmit" value="绑定邮箱" type="button">
	            </div>

	     	</form>
     	</div>
	</div>
	<div class="phonebox" style="display:none;">
		<div class="title">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>绑定手机</h3>
     	</div>
     	
     	<div class="loginnav">
     		<form action="" method="post">
     			
	            <div class="errer-info hide"></div>
	            <p>绑定手机后，账号动态可以及时通知到您</p>
	            <div class="login-input">
	                <input id="phone" name="phone" placeholder="您的手机号" autocomplete="off" data-verification-name="帐号" class="" value="" type="text">
	            </div>
	            
	            <div class="login-buttons">
	                <input id="phonesubmit" value="绑定手机" type="button">
	            </div>

	     	</form>
     	</div>
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
                        <a class="drop-trigger" href="travel/personalinfo.jsp" title="<%=nickname %>的窝" rel="nofollow">
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

	<div class="wrap clearfix">
		<div class="aside">
			
            <a href="personalinfo.jsp"><i class="i1"></i>我的信息</a>
            <a href="myheadpic.jsp"><i class="i2"></i>我的头像</a>
            <a href="personalsecure.jsp" class="on"><i class="i4"></i>账号安全</a>
            
            <a href="myblacklist.jsp"><i class="i9"></i>黑名单管理</a>
        
		</div>

		<div class="content">
			<div class="hd">
                <strong>账号安全</strong>
                
            </div>
            <div class="userpass">
		        <dl class="clearfix">
		            <dt>密码：</dt>
		            <dd>
		                <a href="javascript:;" id="set-pw-btn">修改密码</a>
		                <div id="set-pw">
		                    <div class="ways">
		                        <a href="javascript:;" class="byphone disable"><i></i><p>手机验证修改</p></a>
		                        <a href="/setting/security/passwordemail/" class="bymail"><i></i><p>邮箱验证修改</p></a>
		                    </div>      
		                    
		                </div>
		            </dd>
		        </dl>

		        <dl class="clearfix">
		           	<dt>绑定邮箱：</dt>
		            <dd>
		            <% if("".equals(email)){ %>
		            	<a href="javascript:;" id="set-email-btn">设置邮箱</a>
		            <% } else { %>
		            <%=email %><span class="status"><i></i>已绑定</span>
		            <% } %>
		            </dd>
		        </dl>

		        <dl class="clearfix">
		            <dt>绑定手机：</dt>
		            <dd>
		            <% if("".equals(phone)){ %>
		            	<a href="javascript:;" id="set-phone-btn">设置手机</a>
		            <% } else { %>
		            <%=phone %><span class="status"><i></i>已绑定</span>
		            <% } %>
		            </dd>
		        </dl>
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
