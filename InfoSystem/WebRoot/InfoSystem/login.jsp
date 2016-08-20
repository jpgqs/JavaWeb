<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%@ page import="java.lang.Exception" %>
<%
	String[] tips={"",""};
	String action=request.getParameter("action");
	String username="";
	String password="";
	if(action!=null&&action.equals("login")){
		username=request.getParameter("username");
		password=request.getParameter("password");
		User u=null;
		try{
			u=User.login(username, password);
		}catch(Exception e){
			if(e.getMessage().contains("用户名")){
				tips[0]="*用户名不存在";
			}else if(e.getMessage().contains("密码")){
				tips[1]="*密码错误";
			}else{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('"+e.getMessage()+"');");
				out.println("</script>");
			}
		}
		if(u!=null){
			session.setAttribute("user", u);
			session.setMaxInactiveInterval(1800);
			response.sendRedirect("personalpage.jsp");
		}
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>学生登录</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<script type="text/javascript" src="../js/page.js"></script>
	<script type="text/javascript">
		window.onload=function(){
			menufocus();
			
			onfocus();
		}
	</script>

  </head>
  
  <body>
	<div id="header">
		<div class="wrap">
			<div id="top"></div>
			<div class="bg"></div>
			<div class="login">
				<span><a href="">找回密码</a></span>
				<span>  |  </span>
				<span><a href="">登录</a></span>
			</div>
			<div>
				<img id="logo" src="../images/logo.png">
				<img id="motto" src="../images/motto.png">
			</div>
		</div>
		
	</div>

	<div class="menu" id="nav">
		<div class="wrap">
			<ul>
				<li><a href="../index.jsp">首页</a>
					<ul class="menu-inner"></ul>
				</li>
				<li>
					<a href="">登录</a>
					
				</li>
			</ul>
		</div>
	</div>

	<div class="wrap">
		<div class="loginbox">
			<form action="" method="post" onsubmit="return logincheck();">
				<input type="hidden" name="action" value="login"/>
				<div class="crm">
					<input type="text" placeholder="学号" name="username" id="username" >
					<script type="text/javascript">
						document.getElementById("username").value=<%=username %>
					</script>
					<p><%=tips[0] %></p>
				</div>
				<div class="crm">
					<input type="password" placeholder="初始密码身份证后六位" name="password" id="password">
					<script type="text/javascript">
						document.getElementById("password").value=<%=password %>
					</script>
					<p><%=tips[1] %></p>
				</div>
				<div class="crm">
					<input id="loginbutton" type="submit" value="立即登录">
				</div>
			</form>
			
			<div class="crm">
				<a href="resetpwd.jsp">忘记密码？</a>
			</div>			
		</div>
	</div>


	<div id="footer">
		<span>联系管理员 | 重庆邮电大学 | 重庆市南岸区崇文路2号 | 400065</span>
	</div>
</body>
</html>
