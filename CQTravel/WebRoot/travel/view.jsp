<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%@ page import="com.bean.UserInfo" %>
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
	
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>景点推荐</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/view.css">
	<link rel="stylesheet" type="text/css" href="../css/room.css">
	<script type="text/javascript" src="../js/page.js" ></script>
	<script type="text/javascript">
		
		$(document).ready(function(){
			login();
			loginsubmit();
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
                	<li class="head-nav-sales head-nav-dropdown _j_sales_nav_show  head-nav-active" id="_j_nav_sales">
                    	<a class="drop-toggle" href="view.jsp"title="旅游景点">
                        	旅游景点
                    	</a>
                	</li>
                	<li class="head-nav-hotel"><a href="travelnotes.jsp" title="游记攻略">游记攻略</a></li>
                	<li class="head-nav-community head-nav-dropdown _j_shequ_nav_show" id="_j_nav_community"><a href="qa.jsp"title="论坛">论坛</a></li>

				</ul>
				
				<% if(user==null){ %>
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
	                    <li><a href="myorder.jsp" title="我的订单" target="_blank" rel="nofollow" data-cs-p="order"><i class="icon-order"></i>我的订单</a></li>
	                    <li><a href="loginout.jsp" title="退出登录" rel="nofollow"><i class="icon-logout" data-cs-p="logout"></i>退出</a></li>
	                </ul>
	            </div>
			</div>
			<div class="shadow"></div>

		</div>

	</div>

	<div class="headerBox header_redesign">
		<div id="headerScrollLimiter" class="headerScrollLimiter" data-backdrop-width="1920">
			<div class="promo" style="overflow:hidden;">
				<img id="backdrop" src="http://ccm.ddcdn.com/cms/img/landers/search/attr_1920_A.jpg" lazy-src="http://ccm.ddcdn.com/cms/img/landers/search/attr_1920_A.jpg">
				<img style="visibility: hidden; opacity: 0;" id="backdrop_blur" src="http://ccm.ddcdn.com/cms/img/landers/search/attr_1920_B.jpg">
			</div>
			<div class="header-search-wrapper">
				<h2>全球62万处景点, 为旅程选择美景</h2>
				<form id="attractionSearch" action="/Search" method="post" onsubmit="return ta.call('ta.pages.home.validate', event, this);">
					<span id="attractions_lander_search_bar_wrap" class="search_bar_wrap">
						<input autocomplete="off" class="header-search-input search-input focusClear" name="q" placeholder="城市或景点名称" id="attractions_lander_loc_handler" type="text">
						<input name="geo" id="attractions_lander_loc_handler_geo-city" value="" type="hidden">
					</span>
					<input class="header-search-submit" onmousedown="" title="搜索" value="搜索" type="submit">
				</form>
			</div>
			
		</div>
	</div>

	<div class="main-wrapper">
		
		<div class="mod-t-wrapper" style="background:#fff;">
			<div class="mod-header">
				<h2>景点推荐</h2>
			</div>
		</div>
		
		
	</div>
	
	<div class="offers">
		<div class="container">
			<div class="col-md-4 offers-left">
				<img src="../images/gallery/gs_jinfoshan.png" class="img-r" alt="">
				<h4>重庆南川金佛山</h4>
				<p>金佛山是拥有世界自然遗产、国家5A级旅游景区、国家级风景名胜区，以其生物多样性特点和独特的喀斯特地貌特征被列入世界自然遗产名单。</p>
				<a class="hvr-shutter-in-horizontal" href="viewdetail.jsp">立即预订</a>
			</div>
			<div class="col-md-4 offers-left">
				<img src="../images/gallery/gs_xiannvshan.png" class="img-r" alt="">
				<h4>重庆武隆天生三桥</h4>
				<p>仙女山气候宜人，风光独好，是绝妙的踏青、消夏、品秋、赏雪之休闲度假胜地，素有“南国牧原”、“山城夏宫”、“东方瑞士”和“落在凡间的伊甸园”之美誉。</p>
				<a class="hvr-shutter-in-horizontal" href="viewdetail.jsp">立即预订</a>
			</div>
			<div class="col-md-4 offers-left">
				<img src="../images/gallery/gs_heishangu.png" class="img-r" alt="">
				<h4>重庆万盛黑山谷</h4>
				<p>黑山谷苍穹之下，最佳洗肺圣地，这里山高林密、溪河纵横，被专家誉为“渝黔生物基因库”，是目前重庆地区最大的、原始生态保护最完好的自然生态风景区。</p>
				<a class="hvr-shutter-in-horizontal" href="viewdetail.jsp">立即预订</a>
			</div>
			<div class="clearfix"></div>
			<div class="offer-btm">
				<div class="col-md-4 offers-left">
					<img src="../images/gallery/gs_simianshan.png" class="img-r" alt="">
					<h4>重庆江津四面山</h4>
					<p>四面山景区位于江津区南部，属云贵高原大娄山北翼余脉，系地质学上的倒置山。景区于1988年被确定为重庆市级自然保护区，1994年被评为第三批国家级风景名胜区。</p>
					<a class="hvr-shutter-in-horizontal" href="viewdetail.jsp">立即预订</a>
				</div>
				<div class="col-md-4 offers-left">
					<img src="../images/gallery/tiansheng.png" class="img-r" alt="">
					<h4>重庆武隆天生三桥</h4>
					<p>天生三硚形成于数百万年前，地下洞穴崩塌形成的三座天生桥，加上其间的两座天坑构成的“三桥夹两坑”喀斯特地貌。天生三硚的规模之大也是世界罕见的。</p>
					<a class="hvr-shutter-in-horizontal" href="viewdetail.jsp">立即预订</a>
				</div>
				<div class="col-md-4 offers-left">
					<img src="../images/gallery/ls_ayihe.png" class="img-r" alt="">
					<h4>重庆彭水阿依河</h4>
					<p>阿依河的景美、阿依河的情浓、水特别清澈、空气也很清新、环境舒适怡人。地处彭水南部“百里乌江画廊”的中下段，是大自然的天然氧吧。</p>
					<a class="hvr-shutter-in-horizontal" href="viewdetail.jsp">立即预订</a>
				</div>
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
