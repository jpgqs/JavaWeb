<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ include file="_sessioncheck.jsp" %>
<%@ page import="com.bean.Order" %>
<%@ page import="com.bean.Hotel" %>
<%
	String id=u.getId();
	ArrayList<Order> orders=null;
	if(id!=null){
		orders=Order.getOrdersByUser(id);
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>我的订单</title>
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


	<div class="wrap">
	    <div class="mian dialogue" style="margin-top: 20px;">
	        <div class="th">我的订单 <i class="icon _j_edit_msg"></i><span class="news"><i class="checkbox _j_unread" data-type="1"></i> 只看未读消息</span></div>
	        <div class="dia_list _j_sms_list">
	        	<% if(orders!=null&&orders.size()>0){
	        			for(Order order:orders){
	        				//Hotel hotel=Hotel.getHotelById(order.getObjid());
	        	 %>
		        <div class="clearfix msgitem" >
				    <div class="msg_logocnt bgi"></div>
				    <div class="msg_infocnt">
				        <h2>
				            <span class="mtitle"><strong><%=order.getObjtype()==1?"酒店订单":"其他订单" %></strong></span>
				            <span class="time"><%=order.getOrdertime() %></span>
				        </h2>
				        <div class="content">
				        <a href="/home/userlogo.php" target="_blank"><%=order.getObjname() %></a>
				        <p><%=order.getObjext() %></p>
				        <p>￥ <span class="hotelprice"><%=order.getPrice() %></span> </p>
				        <p>入住时间:<span class="checkin"><%=order.getBeginday() %></span> 离店时间:<span class="checkout"><%=order.getEndday() %></span> </p>
				        </div>
				    </div>
				    <a class="msg_closer _j_msg_closer bgi"></a>
				</div>
				<%		}
					}
				 %>
	        </div>
	        <div class="pagin" id="smallpager"></div>
	    </div>
	</div>


	<div id="footer">
		
		<div class="wrap">
			

			<p>生活不止眼前的苟且，还有诗和远方的田野</p>

		</div>

	</div>



</body>
</html>
