<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ include file="_sessioncheck.jsp" %>
<%@ page import="com.bean.UserInfo" %>
<%@ page import="java.lang.Exception" %>
<%
	request.setCharacterEncoding("utf-8");
	UserInfo us=u.getProperty();
	String nickname=us.getNickname();
	String headpic=us.getHeadpicture();
	int gender=us.getGender();
	String birth=us.getBirth();
	String city=us.getCity();
	String signature=us.getSignature();
	
	String action=request.getParameter("action");
	if(action!=null&&"alter".equals(action)){
		String name=request.getParameter("name");
		String genders=request.getParameter("gender");
		String acity=request.getParameter("city");
		String abirth=request.getParameter("birthday");
		String aintro=request.getParameter("intro");
		//System.out.println(name+"-"+genders+"-"+acity+"-"+abirth+"-"+aintro);
		try{
			UserInfo newUi=UserInfo.alterBasicInfo(us.getId(), name, genders, acity, abirth, aintro);
			u.setProperty(newUi);
			session.removeAttribute("user");
			session.setAttribute("user", u);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('个人信息修改成功');");
			out.println("</script>");
			out.flush();
			
		}catch(Exception e){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+e.getMessage()+"');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
		}
		out.println("<script  type=\"text/javascript\"> ");
		out.println(" window.location.replace(\"personalinfo.jsp\");");
		out.println("</script> ");
	}
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>我的信息</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/personal.css">
	<script type="text/javascript" src="../js/page.js" ></script>
	<script type="text/javascript" src="../laydate/laydate.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			login();
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
                	<li class="head-nav-hotel"><a href="travelnotes.jsp" title="游记攻略">游记攻略</a></li>
                	<li class="head-nav-community head-nav-dropdown _j_shequ_nav_show" id="_j_nav_community"><a href="qa.jsp"title="论坛">论坛</a></li>

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
	                    <li><a href="order.jsp" title="我的订单" target="_blank" rel="nofollow"><i class="icon-order"></i>我的订单</a></li>
	                    <li><a href="loginout.jsp" title="退出登录" rel="nofollow"><i class="icon-logout"></i>退出</a></li>
	                </ul>
	            </div>
			</div>
			<div class="shadow"></div>

		</div>
	</div>

	<div class="wrap clearfix">
		<div class="aside">
			
            <a href="personalinfo.jsp" class="on"><i class="i1"></i>我的信息</a>
            <a href="myheadpic.jsp"><i class="i2"></i>我的头像</a>
            <a href="personalsecure.jsp"><i class="i4"></i>账号安全</a>
            
            <a href="myblacklist.jsp"><i class="i9"></i>黑名单管理</a>
        
		</div>

		<div class="content">
			<div class="hd">
                <strong>我的信息</strong>
                
            </div>
            <div class="userinfo">
            	
				<form id="_j_form" action="" method="post">
					<input type="hidden" name="action" value="alter"/>
					<dl class="clearfix">
						
                		<dt>昵称：</dt>
                		<dd><input name="name" value="<%=nickname %>" maxlength="16" autocomplete="off"type="text"></dd>
            
					</dl>

					<dl class="clearfix">
		                <dt>性别：</dt>
		                <dd>
		                    <label><span class="cssradio"><input name="gender" value="1" <%=gender==1?"checked=\"true\"":"" %> type="radio"><span></span></span>男</label>
		                    <label><span class="cssradio"><input name="gender" value="0" <%=gender==0?"checked=\"true\"":"" %> type="radio"><span></span></span>女</label>
		                    <label><span class="cssradio"><input name="gender" value="2" <%=gender==2?"checked=\"true\"":"" %> type="radio"><span></span></span>保密</label>
		                </dd>
		            </dl>

		            <dl class="clearfix">
		                <dt>居住城市：</dt>
		                <dd>
		                    <div class="input-group">
		                        <input name="city" value="<%=city %>" autocomplete="off" data-verification-name="居住城市" class="" type="text">
		                        <ul class="input-suggest"></ul>
		                    </div>
		                </dd>
		            </dl>

		            <dl class="clearfix">
		                <dt>出生日期：</dt>
		                <dd>
		                    <input readonly="true" name="birthday" value="<%=birth %>" class="" autocomplete="off" type="text" onclick="laydate()">
		                </dd>
		            </dl>
		            <dl class="clearfix">
		                <dt>个性签名：</dt>
		                <dd><textarea name="intro"  maxlength="100"><%=signature %></textarea></dd>
		            </dl>
		            <div class="btn-sub"><button type="submit">保存</button></div>
				</form>

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
