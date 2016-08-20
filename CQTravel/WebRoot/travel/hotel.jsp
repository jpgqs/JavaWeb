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
	ArrayList<Hotel> hotels=Hotel.getThreeHotels();
	
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>酒店推荐</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/room.css">
	<script type="text/javascript" src="../js/page.js" ></script>
	<script type="text/javascript" src="../laydate/laydate.js"></script>
	<script type="text/javascript" src="../js/view.js" ></script>
	<script type="text/javascript">
		
		$(document).ready(function(){
			login();
			loginsubmit();
			dropmenu();
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


	<div class="hotel-main clearfix">
		
		<div class="search-wrap">
			<h2 class="htitle"><span>挑选最<em>有料</em>的酒店</span><br>与旅行老司机<em>一起选酒店</em></h2>
			<div class="destination">
                <div class="search-tab">
                    <ul class="tab-group clearfix" id="J_search_tab">
                        <li class="on">酒店</li> 
                    </ul>
                </div>
                <div class="dest-inp">
                    <div class="inp-city">
                        <input class="focus" id="J_input_keyword" placeholder="请输入国家地区城市名称" type="text">
                    </div>
                    <div class="hotel-suggest hide" id="J_suggest_list">
                    	<dl class="clearfix">
                    		<dt>
                    			<i class="icon-hotel"></i>
                    		</dt>

                    		<dd class="first">
                    			<a data-name="啊！旅馆 ah! Guest House" href="/hotel/7414409.html" class="_j_listitem">
                    			<p class="txt-tit"><span class="nums"></span><strong><b>啊</b>！旅馆</strong> ah! Guest House</p><p class="txt-con">南非,西开普省</p></a>
                    		</dd>
                    		<dd>
                    			<a data-name="啊li维奇古村酒店 Alle Vecchie Mura" href="/hotel/7231906.html" class="_j_listitem">
                    				<p class="txt-tit"><span class="nums"></span><strong><b>啊</b>li维奇古村酒店</strong> Alle Vecchie Mura</p>
                    				<p class="txt-con">意大利,利古利亚,萨沃纳</p>
                    			</a>
                    		</dd>

                    		<dd>
                    			<a data-name="啊格络图利斯美芬卡萨马尼加酒店 Agroturisme Finca Sa Maniga" href="/hotel/7264779.html" class="_j_listitem on">
	                    			<p class="txt-tit"><span class="nums"></span><strong><b>啊</b>格络图利斯美芬卡萨马尼加酒店</strong> Agroturisme Finca Sa Maniga</p>
	                    			<p class="txt-con">西班牙,巴利阿里群岛</p>
	                    		</a>
	                    	</dd>

	                    	<dd>
	                    		<a data-name="西江啊成客栈 " href="/hotel/9238777.html" class="_j_listitem">
	                    			<p class="txt-tit"><span class="nums"></span><strong>西江<b>啊</b>成客栈</strong> </p>
	                    			<p class="txt-con">贵州省,黔东南苗族侗族自治州,雷山县</p>
	                    		</a>
	                    	</dd>

	                    </dl>
                    </div>
                </div>
            </div>

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

			<div class="search-btn"><input value="搜索" id="J_btn_search" type="button"></div>
		</div>


		<div class="country-list">
            <dl class="clearfix">
                <dt>
                    <a href="javascript:;">重庆</a>
                </dt>
                <dd>
                    <a target="_blank" href="/hotel/10189/">解放碑</a>
                    <em>|</em>
                </dd>
                <dd>
                            <a target="_blank" href="/hotel/10206/">观音桥</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/10819/">万象城</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/21434/">山峡广场</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/15325/">南坪</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/11065/">江北机场</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/12594/">重庆北站</a>
                                                    </dd>
            </dl>

            <dl class="clearfix">
                    <dt>
                                                    <a href="/hotel/10083/" target="_blank">周边</a>
                                            </dt>
                                            <dd>
                            <a target="_blank" href="/hotel/15284/">武隆</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/11047/">万盛</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/11045/">涪陵</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/24356/">南川</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/14210/">万州</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/11046/">永川</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/13567/">合川</a>
                                                    </dd>
            </dl>

            <dl class="clearfix">
                    <dt>
                                                    <a href="/hotel/10184/" target="_blank">景点</a>
                                            </dt>
                                            <dd>
                            <a target="_blank" href="/hotel/10130/">仙女山</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/11030/">金佛山</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/11025/">洪崖洞</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/11017/">磁器口</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/59319/">黑山谷</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/11016/">金刀峡</a>
                                                    </dd>
            </dl>

            <dl class="clearfix">
                    <dt>
                                                    <a href="/hotel/10183/" target="_blank">房间</a>
                                            </dt>
                                            <dd>
                            <a target="_blank" href="/hotel/10222/">太空舱</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/10765/">经济型</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/11042/">舒适型</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/16283/">江景房</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/10746/">豪华型</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/10769/">家庭房</a>
                                                            <em>|</em>
                                                    </dd>
                                            <dd>
                            <a target="_blank" href="/hotel/11041/">公寓</a>
                                                    </dd>
            </dl>

            
        </div>

	</div>


	<div class="area-view" id="area-view">
		
		<div class="hd">
            <h3>看风景 选酒店</h3>
            <p>入住最喜欢的街区，体验最钟意的当地生活</p>
        </div>
		
		<div class="single">
            <div class="container">
            
            	<% if(hotels!=null&&hotels.size()>0){
            			int flag=0;
            			for(Hotel hotel:hotels){
            				flag++;
            	 %>
                <div class="single-top">
                	<% if(flag%2==1) {%>
                    <div class="col-md-6 single-left">
                        <a href="details.html"><img src="../<%=hotel.getHeadpicture() %>" class="img-responsive" alt=""></a>
                    </div>
                    <div class="col-md-6 single-right">
                        <h3><a href="details.html"><%=hotel.getName() %></a></h3>
                        <p><%=hotel.getDescription() %></p>
                        <p><%=hotel.getComment() %></p>
                        <h5>*酒店只在公共区域提供免费的无限网络连接。</h5>
                        <h6>• 酒店位于<%=hotel.getView() %></h6>
                        <div class="sinbt">
                            <a class="hvr-shutter-in-horizontal" href="rooms.jsp?hotelid=<%=hotel.getId() %>">立即预订</a>
                        </div>
                    </div>
                    <% }else{ %>
                    <div class="col-md-6 single-right">
                        <h3><a href="details.html"><%=hotel.getName() %></a></h3>
                        <p><%=hotel.getDescription() %></p>
                        <p><%=hotel.getComment() %></p>
                        <h5>*酒店只在公共区域提供免费的无限网络连接。</h5>
                        <h6>• 酒店位于<%=hotel.getView() %></h6>
                        <div class="sinbt">
                            <a class="hvr-shutter-in-horizontal" href="rooms.jsp?hotelid=<%=hotel.getId() %>">立即预订</a>
                        </div>
                    </div>
                     <div class="col-md-6 single-left">
                        <a href="details.html"><img src="../<%=hotel.getHeadpicture() %>" class="img-responsive" alt=""></a>
                    </div>
                    <% } %>
                    <div class="clearfix"> </div>
                </div>
                <%		}
                	}
                 %>
                
                
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
