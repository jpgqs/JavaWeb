<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%@ page import="java.lang.Exception" %>
<%
	String[] tips={"",""};
	String action=request.getParameter("action");
	String username="";
	String idcard="";
	if(action!=null&&action.equals("reset")){
		username=request.getParameter("username");
		idcard=request.getParameter("idcard");
		User u=null;
		try{
			u=User.reset(username, idcard);
			if(u!=null){
				out.println("<script type=\"text/javascript\">");
				out.println("alert('登录密码已重置为身份证后六位');");
				out.println("</script>");
				idcard=username="";
			//session.setAttribute("user", u);
			//response.sendRedirect("../index.jsp");
			}else{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('请不要输入空格');");
				out.println("</script>");
			}
		}catch(Exception e){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+e.getMessage()+"');");
			out.println("</script>");
		}
		
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>找回密码</title>
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
				<span><a href=""></a></span>
				<span>    </span>
				<span><a href=""></a></span>
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
					<a href="">找回密码</a>
					
				</li>
			</ul>
		</div>
	</div>

	<div class="wrap">
		<div class="loginbox">
			<form action="" method="post">
				<input type="hidden" name="action" value="reset"/>
				<div class="crm">
					<input type="text" placeholder="请输入学号" name="username" id="username" >
					<script type="text/javascript">
						document.getElementById("username").value=<%=username %>
					</script>
				</div>
				<div class="crm">
					<input type="password" placeholder="请输入身份证号" name="idcard" id="password">
					<script type="text/javascript">
						document.getElementById("password").value=<%=idcard %>
					</script>
				</div>
				<div class="crm">
					<input id="loginbutton" type="submit" value="重置密码">
				</div>
			</form>
			
			<div class="crm">
				<a href="resetpwd.html">信息有误？联系管理员</a>
			</div>			
		</div>
	</div>


	<div id="footer">
		<span>联系管理员 | 重庆邮电大学 | 重庆市南岸区崇文路2号 | 400065</span>
	</div>
</body>
</html>
