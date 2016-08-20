<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.Administrator" %>
<%
	Administrator admin=Administrator.getContact();
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>联系我们</title>
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
					<a href="">联系我们</a>
					
				</li>
			</ul>
		</div>
	</div>

	<div class="wrap">
		<div style="position:relative;" >
			<table style="margin-left:300px;margin-top:40px;">
			<% if(admin!=null){ %>
				<tr>
					<td>联系电话：</td>
					<td><%=admin.getPhone() %></td>
				</tr>
				<tr>
					<td>QQ:</td>
					<td><%=admin.getQq() %></td>
				</tr>
				<tr>
					<td>电子邮箱:</td>
					<td><%=admin.getEmail() %></td>
				</tr>
			<% } %>
			</table>
		</div>
	</div>


	
</body>
</html>
