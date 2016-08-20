<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>找回密码</title>
<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script type="text/javascript" src="../js/page.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	
	});
</script>
</head>
<body>

	<div class="wrapper">
		<div class="container">

			<a href="../index.jsp" title="返回首页" class="reglogo"></a>

			<div class="signup-forms">
				<div class="signup-box" id="_j_signup_box">
					<div class="inner">
						<form action="login.jsp" method="post" id="_j_signup_form">
							<input name="token" value="" type="hidden">
							<div class="form-field" style="display:block;">
								<input id="user" name="passport" placeholder="您的用户名" autocomplete="off"
									class="" value="" type="text">
								<input id="password" name="password" placeholder="您的密码" autocomplete="off"
									class="" value="" type="password">
								<input id="rpassword" name="rpassword" placeholder="重复您的密码" autocomplete="off"
									class="" value="" type="password">
								<div class="err-tip"></div>
							</div>
							
							<div class="submit-btn">
								<input id="registerbtn" value="立即注册" type="button">
							</div>
						</form>

					</div>
					<div class="bottom-link">
						已经注册?<a href="#">马上登录</a>
					</div>
				</div>

				
			</div>


		</div>
	</div>

	<div class="fullscreen-bg"></div>


</body>
</html>
