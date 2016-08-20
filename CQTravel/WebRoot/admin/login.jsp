<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<link href="css/admin.css" rel="stylesheet" type="text/css" />
	<title>登录后台管理系统</title>
	<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="js/adminjs.js"></script>
	<script type="text/javascript">
		window.onload=function(){
			login();
			pwdView();
		}
	</script>

  </head>
  
  <body>
    <div id="loginbox">

		<div class="login-content">	
			<h2>后台登录</h2>
	
   			<form action="" method="post" id="login-form" name="login-form">
    			<div class="login-info">
					<span class="user">&nbsp;</span>
					<input name="username" id="username" type="text"  value="" class="login-input"/>
				</div>
    			<div class="login-info">
				<span id="pwd" class="pwd">&nbsp;</span>
				<span id="replace">
					<input name="password" id="password" type="password"  value="" class="login-input"/>
				</span>
				
				</div>
    			<div class="login-type">
    				<input type="radio" name="type" checked="checked" value="administrator">管理员登录
    			</div>
   				<div class="login-oper">
					<input name="" type="button" value="登 录" class="login-btn"/>
					<input name="" type="reset" value="重 置" class="login-reset"/>
				</div>
    		</form>
    	</div>
   
	</div>   
  </body>
</html>
