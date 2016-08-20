<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ include file="_sessioncheck.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>系统消息</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/view.css">
	<script type="text/javascript" src="../js/page.js" ></script>
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
					<a title="重庆旅游" href="../index.html"><img class="logo-l" src="../images/logo.jpg"></a>
				</div>
				
				<ul id="head-nav" class="head-nav">
                    
                    
                    <li class="head-nav-index "><a href="../index.html">首页</a></li>
                    <li class="head-nav-place "><a href="../travel/destination.html" title="目的地">目的地</a></li>
                    <li class="head-nav-gonglve "><a href="../travel/hotel.html" title="酒店推荐">酒店推荐</a></li>
                    <li class="head-nav-sales head-nav-dropdown _j_sales_nav_show" id="_j_nav_sales">
                        <a class="drop-toggle" href="../travel/view.html"title="旅游景点">
                            旅游景点
                        </a>
                    </li>
                    <li class="head-nav-hotel"><a href="../travel/travelnotes.html" title="游记攻略">游记攻略</a></li>
                    <li class="head-nav-community head-nav-dropdown _j_shequ_nav_show head-nav-active" id="_j_nav_community"><a href="../travel/qa.html"title="论坛">论坛</a></li>

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
	                    
						<li><a href="personalmsg.jsp" target="_blank" rel="nofollow">私信</a></li>
						<li><a href="sysmsg.jsp" target="_blank" rel="nofollow">系统通知</a></li>
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


	<div class="mfw_main w1000">
		<h1>系统消息</h1>

		<div class="list" id="_j_listcnt">
        	<div class="clearfix msgitem first" data-msgtype="0">
        		<div class="msg_logocnt bgi"></div>
        		<div class="msg_infocnt">
			        <h2>
			            <span class="mtitle"><strong>系统通知</strong></span>
			            <span class="time">2016-05-09 11:42:15</span>
			        </h2>
        			<div class="content">
        				恭喜你第一次获得<font color="red">蜂蜜</font>！<br>在蚂蜂窝，蜂蜜是最货真价实的货币<br>
        				在<font color="red">蚂蜂窝商店</font>有数百种商品可以兑换！蜂蜜的本质在于鼓励蜂蜂<br>
        				用自己的旅行经历，帮助更多需要出行的蜂蜂<br>
        				<a href="http://www.mafengwo.cn/mall/" target="_blank">去<font color="#EDA000">蚂蜂窝商店</font>看看》》》</a><br>
        				<a href="http://www.mafengwo.cn/i/2947856.html" target="_blank">了解更多获得<font color="#EDA000">蜂蜜</font>的途径》》》</a><br>
        				<a href="http://www.mafengwo.cn/mall/" target="_blank"><img src="http://images.mafengwo.net/images/mfw-ask/sys_wenda_honey.jpeg"></a>
        			</div>
    			</div>
    			<a class="msg_closer _j_msg_closer bgi" data-msgid="1533820624898744"></a>
        	</div>

			<div class="clearfix msgitem" data-msgtype="0">
			    <div class="msg_logocnt bgi"></div>
			    <div class="msg_infocnt">
			        <h2>
			            <span class="mtitle"><strong>系统通知</strong></span>
			            <span class="time">2016-05-09 01:33:20</span>
			        </h2>
			        <div class="content"><a href="/home/userlogo.php" target="_blank">上传个头像，增长积分，可以下载更多旅游攻略！</a></div>
			    </div>
			    <a class="msg_closer _j_msg_closer bgi" data-msgid="1533782314967608"></a>
			</div>


			<div class="clearfix msgitem" data-msgtype="0">
			        <div class="msg_logocnt bgi"></div>
			        <div class="msg_infocnt">
			        <h2>
			            <span class="mtitle"><strong>系统通知</strong></span>
			            <span class="time">2016-05-08 23:33:15</span>
			        </h2>
			        <div class="content"><a href="/home/userlogo.php" target="_blank">上传个头像，增长积分，可以下载更多旅游攻略！</a></div>
			    </div>
			    <a class="msg_closer _j_msg_closer bgi" data-msgid="1533774759431272"></a>
			</div>


			<div class="clearfix msgitem" data-msgtype="0">
			        <div class="msg_logocnt bgi"></div>
			        <div class="msg_infocnt">
			        <h2>
			            <span class="mtitle"><strong>系统通知</strong></span>
			            <span class="time">2016-04-25 00:08:50</span>
			        </h2>
			        <div class="content"><a href="/home/userlogo.php" target="_blank">上传个头像，增长积分，可以下载更多旅游攻略！</a></div>
			    </div>
			    <a class="msg_closer _j_msg_closer bgi" data-msgid="1532508640726748"></a>
			</div>


			<div class="clearfix msgitem">
			        <div class="msg_logocnt bgi"></div>
			        <div class="msg_infocnt">
			        <h2>
			            <span class="mtitle"><strong>系统通知</strong></span>
			            <span class="time">2016-04-23 23:11:49</span>
			        </h2>
			        <div class="content"><a href="/home/userlogo.php" target="_blank">上传个头像，增长积分，可以下载更多旅游攻略！</a></div>
			    </div>
			    <a class="msg_closer _j_msg_closer bgi" data-msgid="1532414456277722"></a>
			</div>



    	</div>

		<div class="meg_page"></div>
	</div>


	<div id="footer">
		
		<div class="wrap">
			

			<p>生活不止眼前的苟且，还有诗和远方的田野</p>

		</div>

	</div>



</body>
</html>
