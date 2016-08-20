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
<%
	
	
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>目的地旅游攻略</title>
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<script type="text/javascript" src="../js/page.js" ></script>
	<script type="text/javascript" src="../js/view.js" ></script>
	<script type="text/javascript">
		$(document).ready(function(){
			login();
			dechg();
			loginsubmit();
			dropmenu();
			lineslide();
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
               		<li class="head-nav-place head-nav-active"><a href="destination.jsp" title="目的地">目的地</a></li>
                	<li class="head-nav-gonglve"><a href="hotel.jsp" title="酒店推荐">酒店推荐</a></li>
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

	<div class="hcontainer">
			
			<div class="headpic">
				
				<div class="show-banner">
					<div style="height: auto;" class="cover">
		                <a style="height: 400px;" class="bigimg" href="" target="_blank" >
		                    
		                 <div class="shade"></div>
		                <img style="margin: -126.711px 0px 0px; width: 100%; height: auto;" src="../images/dhbg.jpeg"></a>
		            </div>
				</div>


				<div class="place-search-panel place-search-panel-sm">
		            <h2>旅游景点</h2>
		            <form name="mdd-search-form" action="/group/s.php" method="get">
		                <div class="searchbar">
		                    <input autocomplete="off" class="search-input" name="q" placeholder="我想去..." type="text">
		                    <a class="search-button" href="#" data-cs-l="搜索" role="button"><i class="icon-search"></i></a>
		                </div>
		            </form>
		            <div class="search-suggest-panel search-suggest-place hide">
		                <ul class="suggest-list">

		                </ul>
		            </div>
		            <div class="place-search-hot">
		            	<a href="/travel-scenic-spot/mafengwo/10035.html">仙女山</a>
		            	<a href="/travel-scenic-spot/mafengwo/10083.html">乐和乐都</a>
		            	<a href="/travel-scenic-spot/mafengwo/10207.html">大足石刻</a>
		            	<a href="/travel-scenic-spot/mafengwo/10208.html">金佛山</a>
		            	<a href="/travel-scenic-spot/mafengwo/10754.html">金刀峡</a>
		            </div>
		        </div>
				
			</div>
			<div class="row1">
			<div class="row">
					<div class="wrap">
						
						<div class="r-title">
				            <h2>玩法路线</h2>
				            <div>玩法路线在手，景点、美食、交通、住宿全搞定！</div>
				        </div>
						
						<ul class="r-nav">
                           	<li class="nav3 r-nav-active"><a href="javascript:void(0)">古镇</a></li>
                            <li class="nav3"><a href="javascript:void(0)">高山</a></li>
                            <li class="nav3"><a href="javascript:void(0)">绿水</a></li>
                        </ul>

                        <div class="discovery-tiles" style="display: block;">
                        	<div class="tiles-left">
                        		
                        		<div class="tiles-item tiles-b">
                        			
                        			<a href="">
                        				<img src="../images/gallery/gz_hongya.png" />
                        				<div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>4</strong></span>
	                                		<h3>重庆主城4日玩法</h3>
			                                <p>解放碑 － 朝天门 － 洪崖洞 － 长江索道 － 人民大礼堂 － 三峡博物馆 － 磁器口 － 渣滓洞 － 白公馆 － 南山风景区  </p>
			                            </div>

			                            <div class="info info-line">
			                            	<div class="middle">
			                            		<span class="day"><em>DAY</em><br><strong>2</strong></span>
			                            		<h3>重庆酉阳桃花源-龚滩古镇2日玩法</h3>
			                            		<p class="p-day">D1 尼甘布鱼市 － 圣玛丽教堂 － 圣塞巴斯蒂安教堂 － 尼甘布海滩 </p>
			                            		<p class="p-day">D2 斯里兰卡大象孤儿院 － 狮子岩</p>
			                            		<p class="p-day">D3 丹布勒石窟寺 － 佛牙寺 － 康提湖</p>
			                            		<p class="p-day">D4 皇家植物园 － Mackwoods茶厂 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
			                            		<p class="p-day">...</p>
			                            	</div>
			                            </div>
                        			</a>
                        		</div>

                        		<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/gz_gongtan.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>2</strong></span>
	                                		<h3>重庆酉阳2日玩法</h3>
	                                		<p>桃花源 － 龚滩古镇 － 龙潭古镇 </p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/gz_laitan.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                		<h3>重庆合川1日玩法</h3>
	                                		<p>涞滩古镇 － 钓鱼城 </p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>


                        	</div>



                        	<div class="tiles-right">
                        		
								<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/gz_guicheng.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                			<h3>重庆丰都1日玩法</h3>
                                			<p>丰都县名山镇丰都鬼城</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/gz_baidicheng.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>2</strong></span>
                                			<h3>重庆奉节2日玩法</h3>
                                			<p>白帝城 － 小寨天坑地缝 － 瞿塘峡 </p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                        	</div>
                        </div>
                         <div class="discovery-tiles" style="display: none;">
                        	<div class="tiles-left">
                        		
                        		<div class="tiles-item tiles-b">
                        			
                        			<a href="">
                        				<img src="../images/gallery/gs_wuling.png">
                        				<div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>2</strong></span>
	                                		<h3>武陵山2日玩法</h3>
			                                <p>【非游不可】武陵山大裂谷+石沟峡2日游 </p>
			                            </div>

			                            <div class="info info-line">
			                            	<div class="middle">
			                            		<span class="day"><em>DAY</em><br><strong>8</strong></span>
			                            		<h3>斯里兰卡中南部8日玩法</h3>
			                            		<p class="p-day">D1 尼甘布鱼市 － 圣玛丽教堂 － 圣塞巴斯蒂安教堂 － 尼甘布海滩 </p>
			                            		<p class="p-day">D2 斯里兰卡大象孤儿院 － 狮子岩</p>
			                            		<p class="p-day">D3 丹布勒石窟寺 － 佛牙寺 － 康提湖</p>
			                            		<p class="p-day">D4 皇家植物园 － Mackwoods茶厂 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
			                            		<p class="p-day">...</p>
			                            	</div>
			                            </div>
                        			</a>
                        		</div>

                        		<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/gs_jinyunshan.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                		<h3>缙云山</h3>
	                                		<p>从北到南有朝日峰、香炉峰、狮子峰、聚云峰等九峰</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/gs_chashan.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                		<h3>茶山竹海1日玩法</h3>
	                                		<p>永川茶山竹海，曾因诸葛亮赐名“箕山”而号称“天下第一隐山”</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>


                        	</div>
                        	<div class="tiles-right">
                        		
								<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/longgang.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>2</strong></span>
                                			<h3>云阳龙缸2日玩法</h3>
                                			<p>云阳龙缸云端廊桥+云阳张飞庙2日游玩</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/tiansheng.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                			<h3>天生三桥1日玩法</h3>
                                			<p>武隆天生三桥 － 天坑地缝</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                        	</div>
                        </div>
                        <div class="discovery-tiles" style="display: none;">
                        	<div class="tiles-left">
                        		<div class="tiles-item tiles-b">
                        			
                        			<a href="">
                        				<img src="../images/gallery/ls_pubu.png">
                        				<div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>2</strong></span>
	                                		<h3>万州大瀑布2日玩法</h3>
			                                <p>万州主城+万州大瀑布，畅想美食万州烤鱼 </p>
			                            </div>

			                            <div class="info info-line">
			                            	<div class="middle">
			                            		<span class="day"><em>DAY</em><br><strong>8</strong></span>
			                            		<h3>斯里兰卡中南部8日玩法</h3>
			                            		<p class="p-day">D1 尼甘布鱼市 － 圣玛丽教堂 － 圣塞巴斯蒂安教堂 － 尼甘布海滩 </p>
			                            		<p class="p-day">D2 斯里兰卡大象孤儿院 － 狮子岩</p>
			                            		<p class="p-day">D3 丹布勒石窟寺 － 佛牙寺 － 康提湖</p>
			                            		<p class="p-day">D4 皇家植物园 － Mackwoods茶厂 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
			                            		<p class="p-day">...</p>
			                            	</div>
			                            </div>
                        			</a>
                        		</div>

                        		<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/ls_ayihe.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                		<h3>阿依河1日玩法</h3>
	                                		<p>彭水阿依河漂流1日游玩</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/ls_changshouhu.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                		<h3>长寿湖1日玩法</h3>
	                                		<p>长寿湖 － 长寿古镇</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>


                        	</div>
                        	<div class="tiles-right">
                        		
								<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/wujiang.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>2</strong></span>
                                			<h3>乌江画廊2日玩法</h3>
                                			<p>酉阳桃花源-龚滩古镇-乌江画廊双汽2日游</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/xiaonanhai.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                			<h3>小南海1日玩法</h3>
                                			<p>黔江小南海，湖水终年碧绿如玉，湖光山色，景色怡人</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                        	</div>
                        </div>

					</div>
				</div>
				</div>

				<div class="row-line"></div>

				<div class="row2">
				<div class="row row-bg">
					
					<div class="wrap">
						
						<div class="r-title">
				            <h2>时令推荐</h2>
				            <div>这个季节去哪里</div>
				        </div>
						
						<ul class="r-nav">
                           	<li class="nav3 r-nav-active"><a href="javascript:void(0)">徒步圣地</a></li>
                            <li class="nav3"><a href="javascript:void(0)">亲子乐园</a></li>
                            <li class="nav3"><a href="javascript:void(0)">清凉避暑</a></li>
                        </ul>

                        <div class="discovery-tiles" style="display: block;">
                        	<div class="tiles-left">
                        		
                        		<div class="tiles-item tiles-b">
                        			
                        			<a href="">
                        				<img src="../images/gallery/gs_simianshan.png">
                        				<div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>2</strong></span>
	                                		<h3>重庆江津2日玩法</h3>
			                                <p>四面山 － 白沙古镇 － 骆崃山</p>
			                            </div>

			                            <div class="info info-line">
			                            	<div class="middle">
			                            		<span class="day"><em>DAY</em><br><strong>8</strong></span>
			                            		<h3>斯里兰卡中南部8日玩法</h3>
			                            		<p class="p-day">D1 尼甘布鱼市 － 圣玛丽教堂 － 圣塞巴斯蒂安教堂 － 尼甘布海滩 </p>
			                            		<p class="p-day">D2 斯里兰卡大象孤儿院 － 狮子岩</p>
			                            		<p class="p-day">D3 丹布勒石窟寺 － 佛牙寺 － 康提湖</p>
			                            		<p class="p-day">D4 皇家植物园 － Mackwoods茶厂 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
			                            		<p class="p-day">...</p>
			                            	</div>
			                            </div>
                        			</a>
                        		</div>

                        		<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/damu.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                		<h3>涪陵1日玩法</h3>
	                                		<p>大木花谷 － 武陵山</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/nanshan.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                		<h3>重庆南山1日玩法</h3>
	                                		<p>南山植物园 － 老君洞 － 一棵树观景台</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>


                        	</div>



                        	<div class="tiles-right">
                        		
								<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/dazushike.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                			<h3>大足石刻1日玩法</h3>
                                			<p>宝顶石刻 － 北山石刻 － 昌州古城</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/shizhu.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>2</strong></span>
                                			<h3>石柱2日玩法</h3>
                                			<p>黄水森林公园 － 森林大风堡 － 山野草场 </p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                        	</div>
                        </div>

                        <div class="discovery-tiles" style="display: none;">
                        	<div class="tiles-left">
                        		
                        		<div class="tiles-item tiles-b">
                        			
                        			<a href="">
                        				<img src="../images/gallery/y_leheledu.png">
                        				<div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>2</strong></span>
	                                		<h3>乐和乐都2日玩法</h3>
			                                <p>引爆欢乐，永川乐和乐都二日游 </p>
			                            </div>

			                            <div class="info info-line">
			                            	<div class="middle">
			                            		<span class="day"><em>DAY</em><br><strong>8</strong></span>
			                            		<h3>斯里兰卡中南部8日玩法</h3>
			                            		<p class="p-day">D1 尼甘布鱼市 － 圣玛丽教堂 － 圣塞巴斯蒂安教堂 － 尼甘布海滩 </p>
			                            		<p class="p-day">D2 斯里兰卡大象孤儿院 － 狮子岩</p>
			                            		<p class="p-day">D3 丹布勒石窟寺 － 佛牙寺 － 康提湖</p>
			                            		<p class="p-day">D4 皇家植物园 － Mackwoods茶厂 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
			                            		<p class="p-day">...</p>
			                            	</div>
			                            </div>
                        			</a>
                        		</div>

                        		<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/wenquan.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                		<h3>统景温泉1日玩法</h3>
	                                		<p>重庆统景两江酒店，泡温泉，看统景峡和美丽溶洞</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/longmenzhen.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                		<h3>九龙坡区龙门阵1日玩法</h3>
	                                		<p>亲子欢乐游玩，龙门阵水魔方游乐园</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>
                        	</div>
                        	<div class="tiles-right">
                        		
								<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/yangrenjie.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                			<h3>美心洋人街1日玩法</h3>
                                			<p>重庆游乐园-美心洋人街游玩/p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/jialebi.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                			<h3>南山加勒比1日玩法</h3>
                                			<p>重庆南岸区南山欢乐水上世界——加勒比</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                        	</div>
                        </div>

                        <div class="discovery-tiles" style="display: none;">
                        	<div class="tiles-left">
                        		
                        		<div class="tiles-item tiles-b">
                        			
                        			<a href="">
                        				<img src="../images/gallery/gs_xiannvshan.png">
                        				<div class="title title-line">
	                                		<span class="day"><em>HOT</em><br><strong>1</strong></span>
	                                		<h3>仙女山度假避暑</h3>
			                                <p>武隆仙女山，旅游避暑度假胜地 </p>
			                            </div>

			                            <div class="info info-line">
			                            	<div class="middle">
			                            		<span class="day"><em>DAY</em><br><strong>8</strong></span>
			                            		<h3>斯里兰卡中南部8日玩法</h3>
			                            		<p class="p-day">D1 尼甘布鱼市 － 圣玛丽教堂 － 圣塞巴斯蒂安教堂 － 尼甘布海滩 </p>
			                            		<p class="p-day">D2 斯里兰卡大象孤儿院 － 狮子岩</p>
			                            		<p class="p-day">D3 丹布勒石窟寺 － 佛牙寺 － 康提湖</p>
			                            		<p class="p-day">D4 皇家植物园 － Mackwoods茶厂 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
			                            		<p class="p-day">...</p>
			                            	</div>
			                            </div>
                        			</a>
                        		</div>

                        		<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/shuirongd.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>HOT</em><br><strong>3</strong></span>
	                                		<h3>张关水溶洞</h3>
	                                		<p>重庆市郊张关水溶洞以“水”为胜，它是重庆市郊最近、最大的溶洞</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/wulingshan.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>HOT</em><br><strong>4</strong></span>
	                                		<h3>武陵山大裂谷</h3>
	                                		<p>武陵山国家森林公园地处重庆市涪陵区国有大木林场，巴渝十二景之一</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>


                        	</div>



                        	<div class="tiles-right">
                        		
								<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/gs_jinfoshan.png">
                                        <div class="title title-line">
                                			<span class="day"><em>HOT</em><br><strong>2</strong></span>
                                			<h3>金佛山</h3>
                                			<p>重庆市南川区金佛山，唯一拥有世界自然遗产、国家5A级旅游景区</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/caochang.png">
                                        <div class="title title-line">
                                			<span class="day"><em>HOT</em><br><strong>5</strong></span>
                                			<h3>千野草场</h3>
                                			<p>位于石柱县方斗山，夏季平均气温16~21℃，避暑露营的好地方</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                        	</div>
                        </div>
					</div>
					</div>
				</div>

				<div class="row-line"></div>

				<div class="row3">
				<div class="row">
					<div class="wrap">
						
						<div class="r-title">
				            <h2>主题精选</h2>
				        </div>
						
						<ul class="r-nav">
                           	<li class="nav3 r-nav-active"><a href="javascript:void(0)">青山绿水</a></li>
                            <li class="nav3"><a href="javascript:void(0)">疯狂购物</a></li>
                            <li class="nav3"><a href="javascript:void(0)">红色文化</a></li>
                        </ul>

                        <div class="discovery-tiles" style="display: block;">
                        	<div class="tiles-left">
                        		
                        		<div class="tiles-item tiles-b">
                        			
                        			<a href="">
                        				<img src="../images/gallery/gs_xiannvshan.png">
                        				<div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>3</strong></span>
	                                		<h3>仙女山天生三桥3日玩法</h3>
			                                <p>天生三桥 － 天坑地缝 － 仙女山 － 芙蓉洞 － 芙蓉江 </p>
			                            </div>

			                            <div class="info info-line">
			                            	<div class="middle">
			                            		<span class="day"><em>DAY</em><br><strong>8</strong></span>
			                            		<h3>斯里兰卡中南部8日玩法</h3>
			                            		<p class="p-day">D1 尼甘布鱼市 － 圣玛丽教堂 － 圣塞巴斯蒂安教堂 － 尼甘布海滩 </p>
			                            		<p class="p-day">D2 斯里兰卡大象孤儿院 － 狮子岩</p>
			                            		<p class="p-day">D3 丹布勒石窟寺 － 佛牙寺 － 康提湖</p>
			                            		<p class="p-day">D4 皇家植物园 － Mackwoods茶厂 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
			                            		<p class="p-day">...</p>
			                            	</div>
			                            </div>
                        			</a>
                        		</div>

                        		<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/ls_jindaoxia.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                		<h3>金刀峡1日玩法</h3>
	                                		<p>金刀峡山雄水秀</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/gs_heishangu.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>DAY</em><br><strong>2</strong></span>
	                                		<h3>黑山谷2日玩法</h3>
	                                		<p>走进万盛黑山谷</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>


                        	</div>



                        	<div class="tiles-right">
                        		
								<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/gs_jinfoshan.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>2</strong></span>
                                			<h3>南川金佛山2日玩法</h3>
                                			<p>天星小镇 － 金佛山 － 神龙峡</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/ls_shanxia.png">
                                        <div class="title title-line">
                                			<span class="day"><em>DAY</em><br><strong>3</strong></span>
                                			<h3>长江山峡3日玩法</h3>
                                			<p>瞿塘峡-神女溪-巫山山峡-小小山峡</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                        	</div>
                        </div>

                        <div class="discovery-tiles" style="display: none;">
                        	<div class="tiles-left">
                        		
                        		<div class="tiles-item tiles-b">
                        			
                        			<a href="">
                        				<img src="../images/gallery/jiefangbei.png">
                        				<div class="title title-line">
	                                		<span class="day"><em>HOT</em><br><strong>1</strong></span>
	                                		<h3>解放碑步行街</h3>
			                                <p>解放碑商圈各种百货大楼，还有八一好吃街 </p>
			                            </div>

			                            <div class="info info-line">
			                            	<div class="middle">
			                            		<span class="day"><em>DAY</em><br><strong>8</strong></span>
			                            		<h3>斯里兰卡中南部8日玩法</h3>
			                            		<p class="p-day">D1 尼甘布鱼市 － 圣玛丽教堂 － 圣塞巴斯蒂安教堂 － 尼甘布海滩 </p>
			                            		<p class="p-day">D2 斯里兰卡大象孤儿院 － 狮子岩</p>
			                            		<p class="p-day">D3 丹布勒石窟寺 － 佛牙寺 － 康提湖</p>
			                            		<p class="p-day">D4 皇家植物园 － Mackwoods茶厂 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
			                            		<p class="p-day">...</p>
			                            	</div>
			                            </div>
                        			</a>
                        		</div>

                        		<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/aotelaisi.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>HOT</em><br><strong>3</strong></span>
	                                		<h3>西部奥特莱斯</h3>
	                                		<p>重庆渝北西部奥特莱斯，各种名牌奢侈品，折扣多多</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/wanxiangcheng.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>HOT</em><br><strong>4</strong></span>
	                                		<h3>万象城</h3>
	                                		<p>杨家坪万象城，建筑面积约越100万平方米，一流购物中心及城市商业新地标</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>


                        	</div>



                        	<div class="tiles-right">
                        		
								<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/guanyinqiao.png">
                                        <div class="title title-line">
                                			<span class="day"><em>HOT</em><br><strong>2</strong></span>
                                			<h3>观音桥</h3>
                                			<p>北城天街，大融城，世纪新都，各种帅哥美女聚集地</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/nanping.png">
                                        <div class="title title-line">
                                			<span class="day"><em>HOT</em><br><strong>5</strong></span>
                                			<h3>万达广场</h3>
                                			<p>南坪万达广场，星光时代广场，购物美食享不停</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                        	</div>
                        </div>

                        <div class="discovery-tiles" style="display: none;">
                        	<div class="tiles-left">
                        		
                        		<div class="tiles-item tiles-b">
                        			
                        			<a href="">
                        				<img src="../images/gallery/ciqikou.png">
                        				<div class="title title-line">
	                                		<span class="day"><em>TOH</em><br><strong>1</strong></span>
	                                		<h3>磁器口</h3>
			                                <p>磁器口古镇入选中国历史文化名街，是历经千年变迁演变而来的重庆市重点保护传统街 </p>
			                            </div>

			                            <div class="info info-line">
			                            	<div class="middle">
			                            		<span class="day"><em>DAY</em><br><strong>8</strong></span>
			                            		<h3>斯里兰卡中南部8日玩法</h3>
			                            		<p class="p-day">D1 尼甘布鱼市 － 圣玛丽教堂 － 圣塞巴斯蒂安教堂 － 尼甘布海滩 </p>
			                            		<p class="p-day">D2 斯里兰卡大象孤儿院 － 狮子岩</p>
			                            		<p class="p-day">D3 丹布勒石窟寺 － 佛牙寺 － 康提湖</p>
			                            		<p class="p-day">D4 皇家植物园 － Mackwoods茶厂 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
			                            		<p class="p-day">...</p>
			                            	</div>
			                            </div>
                        			</a>
                        		</div>

                        		<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/baigongguan.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>HOT</em><br><strong>3</strong></span>
	                                		<h3>白公馆</h3>
	                                		<p>位于重庆市沙坪坝区，原是四川军阀白驹的别墅。1939年军统局改建为看守所关押政治犯。</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-c2">
                        			<a href="/mdd/cityroute/11062_119.html" target="_blank">
	                                    <img src="../images/gallery/jinianguan.png">
	                                    <div class="title title-line">
	                                		<span class="day"><em>HOT</em><br><strong>4</strong></span>
	                                		<h3>红岩革命纪念馆</h3>
	                                		<p>红岩革命纪念馆是依托中共中央南方局及八路军驻重庆办事处旧址红岩村和曾家岩50号周公馆</p>
	                            		</div>
	                            		<div class="info info-line">
	                                		<div class="middle">
	                                    		<span class="day"><em>DAY</em><br><strong>1</strong></span>
	                                    		<h3>努沃勒埃利耶1日玩法</h3>
	                                             <p class="">Mackwoods茶厂 － 维多利亚公园 － 努沃勒埃利耶粉红邮局 － 格雷戈里湖</p>
	                                        </div>
	                            		</div>
                        			</a>
                    			</div>


                        	</div>



                        	<div class="tiles-right">
                        		
								<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/zhazidong.png">
                                        <div class="title title-line">
                                			<span class="day"><em>HOT</em><br><strong>2</strong></span>
                                			<h3>渣滓洞</h3>
                                			<p>位于重庆市郊歌乐山下，三面环山，地势隐蔽，1938年开始被国民党特务机关改造成秘密监狱</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                    			<div class="tiles-item tiles-r2b">
                        			<a href="/mdd/cityroute/18044_125.html" target="_blank">
                                        <img src="../images/gallery/geleshan.png">
                                        <div class="title title-line">
                                			<span class="day"><em>HOT</em><br><strong>5</strong></span>
                                			<h3>歌乐山烈士墓</h3>
                                			<p>步行到沙坪坝区歌乐山烈士陵园,去回顾那一段悲壮的历史。</p>
                            			</div>
                            			<div class="info info-line">
                                			<div class="middle">
                                    			<span class="day"><em>DAY</em><br><strong>1</strong></span>
                                    			<h3>加勒1日玩法</h3>
                                                <p class="">高跷渔夫 － 加勒古城 － 荷兰教堂 － 加勒灯塔 － 乌纳瓦图纳</p>
                                         	</div>
                            			</div>
                        			</a>
                    			</div>

                        	</div>
                        </div>	
					</div>
					</div>

				</div>

				<div class="row-line"></div>
				

				<div class="row row-bg">
					
					<div class="wrap">
						
						<div class="row-list">
							<h2 class="hd">更多旅游目的地</h2>
							<div class="bd">
								<dl class="item">
									<dt class="sub-title">主城风光</dt>
									<dd class="clearfix">
										<ul class="col">
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">缙云山 <span class="en">jinyunshan</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">朝天门 <span class="en">chaotianmen</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">金刀峡 <span class="en">jindaoxia</span></a></li>
										</ul>
										<ul class="col">
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">磁器口 <span class="en">ciqikou</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">大礼堂 <span class="en">dalitang</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">博物馆 <span class="en">bowuguan</span></a></li>
										</ul>
										<ul class="col">
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">渣滓洞 <span class="en">zhazidong</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">四面山 <span class="en">simianshan</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">罗汉寺 <span class="en">luohansi</span></a></li>
										</ul>
									</dd>
								</dl>

								<dl class="item">
									<dt class="sub-title">区县美景</dt>
									<dd class="clearfix">
										<ul class="col">
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">彭水阿依河 <span class="en">ayihe</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">南川神龙峡 <span class="en">shenlongxia</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">大足石刻 <span class="en">dazushike</span></a></li>
										</ul>
										<ul class="col">
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">奉节瞿塘峡 <span class="en">qutangxia</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">酉阳桃花源 <span class="en">taohuayuan</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">巫溪小三峡<span class="en">xiaosanxia</span></a></li>
										</ul>
										<ul class="col">
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">万盛黑山谷 <span class="en">heishangu</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">丰都鬼城<span class="en">fengduguicheng</span></a></li>
											<li><a href="/travel-scenic-spot/mafengwo/11698.html" target="_blank">涪陵武陵山 <span class="en">wulingshan</span></a></li>
										</ul>
									</dd>
								</dl>
							</div>
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
