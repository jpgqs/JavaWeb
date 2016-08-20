<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%@ page import="com.bean.UserInfo" %>
<%@ page import="com.bean.Hotel" %>
<%
	User user=(User)session.getAttribute("user");
	UserInfo us=null;
	String nickname=null;
	String headpic=null;
	if(user!=null){
		us=user.getProperty();
		nickname=us.getNickname();
		headpic=us.getHeadpicture();
	}
	String hotelId=request.getParameter("hotelid");
	Hotel hotel=null;
	if(hotelId!=null){
		hotel=Hotel.getHotelById(hotelId);
	}
	
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>酒店推荐</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/jingdian.css">
	<link rel="stylesheet" type="text/css" href="../css/room.css">
	<script type="text/javascript" src="../js/page.js" ></script>
	<script type="text/javascript" src="../laydate/laydate.js"></script>
	<script type="text/javascript" src="../js/view.js" ></script>
	<script type="text/javascript">
		
		$(document).ready(function(){
			login();
			dropmenu();
			loginsubmit();
			book();
			bookdate();
		});
	</script>
</head>
<body style="position: relative;">
	
	<div class="loginbg" style="display:none;"></div>
	<div class="loginbox" style="display:none;">
		<div class="title">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>登录</h3>
     	</div>

     	<div class="loginnav">
     		<form action="login.jsp" method="post">
     			
	            <div class="errer-info hide"></div>
	            <p>在这里你可以查找攻略，分享旅行，结识朋友</p>
	            <div class="login-input">
	                <input id="lpassport" name="passport" placeholder="您的邮箱/手机号" autocomplete="off" class="" value="" type="text">
	            </div>
	            <div class="login-input">
	                <input id="lpassword" name="password" placeholder="您的密码" autocomplete="off" class="" type="password">
	            </div>
	            
	            <div class="login-buttons">
	                <input id="loginsubmit" value="登录" type="button">
	                <span><a href="/forget">忘记密码?</a></span>
	            </div>

	     	</form>
     	</div>
     	<div class="regist-link">还没有注册？<a href="/regist.html">立即注册&gt;&gt;</a></div>
	</div>
	
	<div class="bookbox" style="display:none;">
		<div class="title">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>预订房间</h3>
     	</div>
		<input type="hidden" id="user" value="<%=user==null?"unlogin":user.getId() %>"/>
     	<div class="loginnav" style="width:360px;padding:10px;">
     		<form action="" method="post">
     			
	            <div class="errer-info hide"></div>
	            <p>您的订单信息为：</p>
	            <p><%=hotel.getName() %><span class="hotelprice"><%=hotel.getPrice() %></span>元/晚</p>
	            <ul class="date-wrap clearfix">
				
					<li class="d-item">
	                    <span class="s-tit">入住</span>
	                    <div class="d-inp">
	                        <input class="hasDatepicker" id="_j_datepicker_1" type="text" onclick="laydate()"><i id="_j_datepicker_icon_1"></i>
	                    </div>
	                </li>
	                <li class="d-item">
	                    <span class="s-tit">离店</span>
	                    <div class="d-inp">
	                        <input class="hasDatepicker" readonly="readonly" id="_j_datepicker_2" type="text" value=""><i id="_j_datepicker_icon_2"></i>
	                    </div>
	                </li>
	                <li class="d-total" style="display:none">共入住<span id="_j_nightnum">10</span>晚</li>
	                <li class="d-add" style="display:none"><i id="_j_adddate"></i></li>
	                <li class="d-sub" style="display:none">-</li>
				</ul>
				<p class="hotelpay">总价：<span class="totalcost">888</span> 元</p>
	            
	            <div class="login-buttons">
	                <input id="booksubmit" value="确认预订" type="button">
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
                	<li class="head-nav-gonglve head-nav-active"><a href="hotel.jsp" title="酒店推荐">酒店推荐</a></li>
                	<li class="head-nav-sales head-nav-dropdown _j_sales_nav_show" id="_j_nav_sales">
                    	<a class="drop-toggle" href="view.jsp"title="旅游景点">
                        	旅游景点
                    	</a>
                	</li>
                	<li class="head-nav-hotel"><a href="travelnotes.jsp" title="游记攻略">游记攻略</a></li>
                	<li class="head-nav-community head-nav-dropdown _j_shequ_nav_show" id="_j_nav_community"><a href="qa.jsp"title="论坛">论坛</a></li>

				</ul>
				
					<% if(user==null){ %>
				<div class="login-out">
					<a id="_j_showlogin" title="登录我的窝" href="javascript:;" rel="nofollow">登录</a>
					<span class="split">|</span>
					<a href="travel/register.jsp" title="注册帐号" rel="nofollow">注册</a>
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
	                    
						<li><a href="personalmsg.jsp" target="_blank" rel="nofollow">私信</a></li>
						<li><a href="sysmsg.jsp" target="_blank" rel="nofollow">系统通知</a></li>
						<li><a href="" target="_blank" rel="nofollow">问答消息</a></li>
	
	                </ul>
	            </div>
	            
	            <div style="display: none;" class="dropdown-menu dropdown-user hide" id="_j_user_panel" data-cs-t="user_nav">
	                <ul>
	                    <li><a href="personalinfo.jsp" target="_blank" title="我的窝" rel="nofollow" data-cs-p="wo"><i class="icon-wo"></i>我的窝<span class="level">LV.1</span> </a></li>
	                    <li><a href="writenote.jsp" target="_blank" class="drop-write" title="写游记" rel="nofollow" data-cs-p="writenotes"><i class="icon-writenotes"></i>写游记</a></li>
	                    <li><a href="myqa.jsp" target="_blank" title="我的问答" rel="nofollow" data-cs-p="wenda"><i class="icon-wenda"></i>我的问答</a></li>
	                    <li><a href="myfriend.jsp" target="_blank" title="我的好友" rel="nofollow" data-cs-p="friend"><i class="icon-friend"></i>我的好友</a></li>
	                    <li><a href="order.jsp" title="我的订单" target="_blank" rel="nofollow" data-cs-p="order"><i class="icon-order"></i>我的订单</a></li>
	                    <li><a href="loginout.jsp" title="退出登录" rel="nofollow"><i class="icon-logout" data-cs-p="logout"></i>退出</a></li>
	                </ul>
	            </div>
			</div>
			<div class="shadow"></div>

		</div>

	</div>

	<div id="media-wrapper" class="layoutfix">
	<input type="hidden" id="hotelid" value="<%=hotel.getId() %>"/>
    <div class="media-left">
    <img src="../<%=hotel.getHeadpicture() %>" width="500px" height="280px">
    </div>  
        <div class="media-right">
            <h2 class="media-title"><%=hotel.getName() %></h2>
            <ul>
                <li style="">
                    <em>酒店地址</em>
                    <span>
                        <%=hotel.getAddress() %>
                    </span>
                    <a class="map-icon goToAnchor" href="javascript:void(0);" style=""></a>
                </li>
                <li class="time" style=";">
                    <em>酒店介绍</em>
                    <span class="j-limit"><%=hotel.getDescription() %></span>
                </li>
                <li class="promise" style=";">
                    <em>入住和离店</em>
                    <div id="J-MediaLabel" class="media-label-wrapper">
                        <span ><%=hotel.getCheckin() %></br>特别提示：<%=hotel.getTips() %></span>
                    </div>
                </li>
            </ul>
            <div id="J-LatestComment" class="comment" style=";"><i class="head"></i>
            	<span><%=hotel.getComment() %></span>
            	<span class="from"> <i></i></span>
            	<i class="tail"></i></div>
        </div>
        <div class="media-price" style=";">
            <a id="bookroom" href="javascript:void(0);"><i class="head"></i>
            <div class="price-box">
                <dfn>¥</dfn>
                <span>
               <%=hotel.getPrice() %>          
                </span> </br>
                立即预订
            </div>
            <i class="tail"></i></a>
        </div>
    </div>
        <div id="J-content" class="d-wrapper">
                            <!--预订须知-->
                                <!--预订须知-->
    <div class="c-wrapper no-border-top layoutfix">
        <div class="c-wrapper-style">
            <i class="detail-icon-1">
                预订须知
            </i>
            <i class="detail-icon-t">
            </i>
        </div>
        <dl class="c-wrapper-info">

            <dd style="">
                <strong>优待政策</strong>
                <div></div>
                <div>免票政策：可携带儿童1.2米以下免费入住。<br>优惠政策：网上可以预订酒店超低价格，网上预订不参与酒店会员优惠活动。<br>以上信息仅供参考，具体以酒店当天披露为准。</div>
            </dd>
            <dd>
                <strong>预订限制</strong>
                 <div>本房间仅限最多2人入住，加床费用请咨询前台客服。</div>
            </dd>
            <dd style="">
                <strong>
                    入住时间
                </strong>
                <div>
                    当天14:00以后 到次日12:00以前。
                </div>
            </dd>
            <dd style="">
                <strong>
                    温馨提示
                </strong>
                <div>
                    预订有效期：（1）预订以后请与当天凌晨12:00以前入住，延期不保留房间。（2）如有突发情况不能准时入住，请提前通知，改变预订时间。
                </div>
            </dd>
            <dd>
                <strong>
                    安全指南
                </strong>
                <div>
                    酒店安全是出行入住的生命线，为保障游客“住得安心、住得舒适、住得放心”，从酒店入住常识出发，严禁携带有毒危险物品，遵守酒店安全指南。<br>出行前，提醒您仔细阅读相关内容，重视酒店入住规则，使您的拥有一个良好的住宿体验。
                </div>
            </dd>
        </dl>
    </div>
</div>	

	<div id="footer">
		
		<div class="wrap">
			

			<p>生活不止眼前的苟且，还有诗和远方的田野</p>

		</div>

	</div>



</body>
</html>
