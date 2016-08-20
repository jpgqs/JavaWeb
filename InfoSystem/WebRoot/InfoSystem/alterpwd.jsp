<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="_sessioncheck.jsp" %>
<%@ page import="com.bean.User" %>
<%@ page import="java.lang.Exception" %>
<%
	String action=request.getParameter("action");
	String oldpassword="";
	String newpassword="";
	if(action!=null&&action.equals("alter")){
		oldpassword=request.getParameter("oldpassword");
		newpassword=request.getParameter("newpassword");
		try{
			u=u.alterpwd(oldpassword, newpassword);
			if(u!=null){
				out.println("<script type=\"text/javascript\">");
				out.println("alert('登录密码修改成功,将跳转回首页');");
				out.println("</script>");
				out.flush();
				out.println("<script  type=\"text/javascript\"> ");
				out.println(" window.location.replace(\"../index.jsp\");");
				out.println("</script> ");
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
    <title>修改密码</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<script type="text/javascript" src="../js/page.js"></script>
	<script type="text/javascript">
		window.onload=function(){
			menufocus();
			
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
			<form action="" method="post" onsubmit="return pwdCheck();">
				<input type="hidden" name="action" value="alter"/>
				<div class="crm">
					<input type="password" placeholder="请输入旧密码" name="oldpassword" id="oldpassword" >
					<script type="text/javascript">
						document.getElementById("oldpassword").value=<%=oldpassword %>
					</script>
				</div>
				<div class="crm">
					<input type="password" placeholder="请输入新密码" name="newpassword" id="newpassword">
					<script type="text/javascript">
						document.getElementById("newpassword").value=<%=newpassword %>
					</script>
				</div>
				<div class="crm">
					<input type="password" placeholder="重新输入新密码" name="newpassword2" id="newpassword2">
					<script type="text/javascript">
						document.getElementById("newpassword2").value=<%=newpassword %>
					</script>
				</div>
				<div class="crm">
					<input id="loginbutton" type="submit" value="修改密码">
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
