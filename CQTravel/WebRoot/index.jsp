<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%@ page import="com.bean.UserInfo" %>
<%@ page import="com.bean.Note" %>
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
	ArrayList<Note> hotnotes=Note.getHotNotes(0, 10);
	ArrayList<Note> newnotes=Note.getNewNotes(0, 10);
	int notelength=Note.getNotesNum();
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>重庆旅游信息</title>
	<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript" src="js/page.js" ></script>
	<script type="text/javascript">
		$(document).ready(function(){
			login();
			var timer;
			chg();
			loginsubmit();
			dropmenu();
			searchtips();
			pagechange();
			orderchange();
			ding();
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
     		<form id="loginform" action="travel/login.jsp" method="post" >
     			
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
     	<div class="regist-link">还没有注册？<a href="travel/register.jsp">立即注册&gt;&gt;</a></div>
	</div>
	<div id="header">
		<div class="myheader">
			
			<div class="header-wrap clearfix">
				<div class="logo">
					<a title="重庆旅游" href=""><img class="logo-l" src="images/logo.jpg"></a>
				</div>
				
				<ul id="head-nav" class="head-nav">
					
					
                	<li class="head-nav-index head-nav-active"><a href="index.jsp">首页</a></li>
               		<li class="head-nav-place "><a href="travel/destination.jsp" title="目的地">目的地</a></li>
                	<li class="head-nav-gonglve"><a href="travel/hotel.jsp" title="酒店推荐">酒店推荐</a></li>
                	<li class="head-nav-sales head-nav-dropdown _j_sales_nav_show" id="_j_nav_sales">
                    	<a class="drop-toggle" href="travel/view.jsp"title="旅游景点">
                        	旅游景点
                    	</a>
                	</li>
                	<li class="head-nav-hotel"><a href="travel/travelnotes.jsp" title="游记攻略">游记攻略</a></li>
                	<li class="head-nav-community head-nav-dropdown _j_shequ_nav_show" id="_j_nav_community"><a href="travel/qa.jsp"title="论坛">论坛</a></li>

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
                        <a class="drop-trigger" href="travel/personalinfo.jsp" title="<%=nickname %>的窝" rel="nofollow">
                            <div class="user-image">
                            	<img src="<%=headpic %>" alt="<%=nickname %>的窝" height="32" width="32">
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
	                    
						<li><a href="travel/personalmsg.jsp" target="_blank" rel="nofollow">私信</a></li>
						<li><a href="travel/sysmsg.jsp" target="_blank" rel="nofollow">系统通知</a></li>
						<li><a href="" target="_blank" rel="nofollow">问答消息</a></li>
	
	                </ul>
	            </div>
	            
	            <div style="display: none;" class="dropdown-menu dropdown-user hide" id="_j_user_panel" data-cs-t="user_nav">
	                <ul>
	                    <li><a href="travel/personalinfo.jsp" target="_blank" title="我的窝" rel="nofollow" data-cs-p="wo"><i class="icon-wo"></i>我的窝<span class="level">LV.1</span> </a></li>
	                    <li><a href="travel/writenote.jsp" target="_blank" class="drop-write" title="写游记" rel="nofollow" data-cs-p="writenotes"><i class="icon-writenotes"></i>写游记</a></li>
	                    <li><a href="travel/myqa.jsp" target="_blank" title="我的问答" rel="nofollow" data-cs-p="wenda"><i class="icon-wenda"></i>我的问答</a></li>
	                    <li><a href="travel/myfriend.jsp" target="_blank" title="我的好友" rel="nofollow" data-cs-p="friend"><i class="icon-friend"></i>我的好友</a></li>
	                    <li><a href="travel/myorder.jsp" title="我的订单" target="_blank" rel="nofollow" data-cs-p="order"><i class="icon-order"></i>我的订单</a></li>
	                    <li><a href="travel/loginout.jsp" title="退出登录" rel="nofollow"><i class="icon-logout" data-cs-p="logout"></i>退出</a></li>
	                </ul>
	            </div>
			</div>
			<div class="shadow"></div>

		</div>

	</div>

	<div id="pic">
		
		<div id="pic_container" class="show-slider">
			<ul class="show-image">
				<li class="first">
					<a class="show-pic" href="">
						<img src="images/pic1.png">
					</a>

					<a class="show-title dark" href="">
						
                    	<div class="date">
                        	<span class="day">05</span>/2016
                    	</div>
                    	<h3>情深深雨濛濛，非同寻“常”山城记</h3>
                
					</a>

					<p class="show-info">
						
						<font color="#FF9900"><a href="/travel-scenic-spot/mafengwo/10802.html" target="_blank">解放碑，</a></font>它自然矜守着一番西南特有的清婉卓越！
					</p>

				</li>

				<li>
					<a class="show-pic" href="">
						<img src="images/pic2.png">
					</a>

					<a class="show-title dark" href="">
						<div class="date">
                        	<span class="day">火锅</span>/美食
                    	</div>
                    	<h3>重庆情怀，热辣过瘾山城火锅</h3>
                    </a>

					<p class="show-info">
						<font color="#FF9900"><a href="/travel-scenic-spot/mafengwo/10802.html" target="_blank">重庆美食，</a></font>八一路美食街尝当地小吃！
					</p>

				</li>

				<li>
					<a class="show-pic" href="">
						<img src="images/pic3.png">
					</a>

					<a class="show-title dark" href="">
						<div class="date">
                        	<span class="day">磁器口</span>/古镇
                    	</div>
                    	<h3>明清风格的街巷，感受老重庆的风土人情</h3>
					</a>

					<p class="show-info">
						<font color="#FF9900"><a href="/travel-scenic-spot/mafengwo/10802.html" target="_blank">重庆古镇，</a></font>踩青石板路，品尝“美食三绝”和“陈麻花”，悠然自得！
					</p>

				</li>

				<li>
					<a class="show-pic" href="">
						<img src="images/pic4.png">
					</a>

					<a class="show-title dark" href="">
						<div class="date">
                        	<span class="day">夜景</span>/重庆
                    	</div>
                    	<h3>起伏地势，依山而上的重重楼房</h3>
					</a>

					<p class="show-info">
						<font color="#FF9900"><a href="/travel-scenic-spot/mafengwo/10802.html" target="_blank">夜色美景，</a></font>两江环抱，双桥相邻，万家灯火高低辉映！
					</p>

				</li>

				<li>
					<a class="show-pic" href="">
						<img src="images/pic5.png">
					</a>

					<a class="show-title dark" href="">
						<div class="date">
                        	<span class="day">步行街</span>/商圈
                    	</div>
                    	<h3>观音桥，繁华商业圈，特色步行街</h3>
					</a>

					<p class="show-info">
						<font color="#FF9900"><a href="/travel-scenic-spot/mafengwo/10802.html" target="_blank">步行街，</a></font>购物以及美食的天堂！
					</p>

				</li>


			</ul>
			
			<ul class="show-nav">
				<li class="active"><a href="javascript:"><img src="images/pic1-1.png" height="62" width="110"></a><span></span></li>
				<li class=""><a href="javascript:"><img src="images/pic2-1.png" height="62" width="110"></a><span></span></li>
				<li class=""><a href="javascript:"><img src="images/pic3-1.png" height="62" width="110"></a><span></span></li>
				<li class=""><a href="javascript:"><img src="images/pic4-1.png" height="62" width="110"></a><span></span></li>
				<li class=""><a href="javascript:"><img src="images/pic5-1.png" height="62" width="110"></a><span></span></li>

			</ul>

			<a class="show-more" target="_blank" href="">历历在目</a>


		</div>

		<div id="search" class="search-container">
			<div class="search-group">
				
				<div class="searchbar" id="">
                	<div class="search-wrapper">
                    	<div class="search-input">
                        	<input name="q" placeholder="搜目的地/攻略/酒店/用户" id="searchkey" autocomplete="off" type="text">
                        	<input type="hidden" id="last" />
                    	</div>
                	</div>
                	<div class="search-button" id="">
                    	<a role="button" href="javascript:"><i class="icon-search"></i></a>
                	</div>
            	</div>

			</div>

		</div>

	</div>

	<div class="icontainer">
		<div class="wrap">
			
			<div class="mfw-travelnotes" id="_j_tn">
	            <div class="navbar clearfix">
	                <ul class="tn-nav" id="_j_tn_nav">
	                    <li id="hotnote" class="active"><a href="javascript:" title="热门旅行游记" rel="nofollow" >热门游记</a></li>
	                    <li id="newnote"><a href="javascript:" title="最新旅游攻略" rel="nofollow">最新发表</a></li>
	                    <!-- <li><a href="javascript:" title="精品游记列表" rel="nofollow" data-type="4">精品游记</a></li> -->

	                </ul>
	                <div class="tn-write"><a class="btn-add" href="travel/writenote.jsp" target="_blank" rel="nofollow"><i></i>写游记</a></div>
	            </div>
			
            	<div class="tn-list" id="_j_tn_content">
            	
            		<ul id="hot">
            			<li id="page1">
            				
            		<% for(Note note:hotnotes){ 
            				String content=note.getContent();
            				String shorten=content.length()>150?(content.substring(0, 150)+"..."):content;
            				UserInfo noteUi=UserInfo.getInfoById(note.getAuthor());
            		%>	
            			
            		<div class="tn-item clearfix">
				        <div class="tn-image">
				            <a href="travel/travelnote.jsp?noteid=<%=note.getId() %>" target="_blank">
				                <img src="<%=note.getHeadpicture() %>" height="150" width="220">
				                <i class="icon-baozang"></i>
				                
				            </a>
				        </div>
				        <div class="tn-wrapper">
				            <dl>
				                <dt>
				                    
				                    <a href="travel/travelnote.jsp?noteid=<%=note.getId() %>" target="_blank"><%=note.getTitle() %></a>
				                </dt>
				                <dd>
				                    <a href="travel/travelnote.jsp?noteid=<%=note.getId() %>" target="_blank"><%=shorten %></a>
				                </dd>
				            </dl>
				            <div class="tn-extra">
				                <span class="tn-ding">
				                    <a class="btn-ding" href="javascript:;" data-value="<%=note.getId() %>" rel="nofollow"></a>
				                    <em class="opt<%=note.getId() %>"><%=note.getOpt() %></em>
				                </span>
				                <span class="tn-place"><i></i><a href="/travel-scenic-spot/mafengwo/10168.html" target="_blank" rel="nofollow"><%=note.getLocation() %></a>，by</span>
				                <span class="tn-user">
				                    <a href="/u/5037827.html" target="_blank" rel="nofollow">
				                        <img alt="<%=noteUi.getNickname() %>" width="16" height="16" src="<%=noteUi.getHeadpicture() %>"><%=noteUi.getNickname() %>
				                    </a>
				                </span>
				                <span class="tn-nums"><i></i><%=note.getReadtime() %>/<%=note.getReply() %></span>
				            </div>
				        </div>
    				</div>
            		<% } %>
            			</li>
            		
            		</ul>
            		
            		<ul id="new" style="display:none;">
            			<li id="npage1">
            				
            		<% for(Note note:newnotes){ 
            				String content=note.getContent();
            				String shorten=content.length()>150?(content.substring(0, 150)+"..."):content;
            				UserInfo noteUi=UserInfo.getInfoById(note.getAuthor());
            		%>	
            			
            		<div class="tn-item clearfix">
				        <div class="tn-image">
				            <a href="travel/travelnote.jsp?noteid=<%=note.getId() %>" target="_blank">
				                <img src="<%=note.getHeadpicture() %>" height="150" width="220">
				                <i class="icon-baozang"></i>
				                
				            </a>
				        </div>
				        <div class="tn-wrapper">
				            <dl>
				                <dt>
				                    
				                    <a href="travel/travelnote.jsp?noteid=<%=note.getId() %>" target="_blank"><%=note.getTitle() %></a>
				                </dt>
				                <dd>
				                    <a href="travel/travelnote.jsp?noteid=<%=note.getId() %>" target="_blank"><%=shorten %></a>
				                </dd>
				            </dl>
				            <div class="tn-extra">
				                <span class="tn-ding">
				                    <a class="btn-ding" href="javascript:;" data-value="<%=note.getId() %>" rel="nofollow"></a>
				                    <em class="opt<%=note.getId() %>"><%=note.getOpt() %></em>
				                </span>
				                <span class="tn-place"><i></i><a href="/travel-scenic-spot/mafengwo/10168.html" target="_blank" rel="nofollow"><%=note.getLocation() %></a>，by</span>
				                <span class="tn-user">
				                    <a href="/u/5037827.html" target="_blank" rel="nofollow">
				                        <img alt="<%=noteUi.getNickname() %>" width="16" height="16" src="<%=noteUi.getHeadpicture() %>"><%=noteUi.getNickname() %>
				                    </a>
				                </span>
				                <span class="tn-nums"><i></i><%=note.getReadtime() %>/<%=note.getReply() %></span>
				            </div>
				        </div>
    				</div>
            		<% } %>
            			</li>
            			
            		</ul>
                 
            	</div>

            	<div class="m-pagination" id="_j_tn_pagination" align="right">
	            	<span class="count">共<%=notelength/10+1 %>页 / <%=notelength %>条</span>
	            	<a class="pg-prev _j_pageitem" style="display:none;" href="javascript:;" rel="nofollow">&lt;&lt;上一页</a>
	            	<a class="pi _j_pageitem pg-current" href="javascript:;"rel="nofollow">1</a>
	            	<% 
	            		int pages=notelength/10+1;
	            		for(int i=2;i<=pages;i++){
	            		 	
	            	%>
	            	<a class="pi _j_pageitem" href="javascript:;"rel="nofollow"><%=i %></a>
	            	<% } %>  
	            	<input type="hidden" id="currentpage" value="1"/>                                                                  
	            	<a class="pg-next _j_pageitem" href="javascript:;" rel="nofollow">下一页 &gt;&gt;</a>
            	</div>
            
        	</div>

		</div>

	</div>

	<div id="footer">
		
		<div class="wrap">
			

			<p>生活不止眼前的苟且，还有诗和远方的田野</p>

		</div>

	</div>
	
	<div style="left: 415.5px; top: 442px; display: none;" class="m-search-suggest m-search-suggest-index hide">
		<ul style="display: block;" class="mss-list">
		
			
			
		<!--  
		<li class="mss-item _j_listitem"><div class="mss-title"><span class="mss-fr">重庆问答</span><span class="mss-cn">去<span class="mss-key">重庆</span>旅行的9346个问题</span></div></li>
		<li class="mss-item _j_listitem"><div class="mss-title"><span class="mss-fr">重庆景点</span><span class="mss-cn" style="color:#999;"><span class="mss-key">重庆</span>南开中学</span></div></li>
		<li class="mss-item _j_listitem"><div class="mss-title"><span class="mss-fr">重庆酒店</span><span class="mss-cn" style="color:#999;"><span class="mss-key">重庆</span>国际青年旅舍</span></div></li>
		<li class="mss-item _j_listitem"><div class="mss-title"><span class="mss-fr">武隆景点</span><span class="mss-cn" style="color:#999;"><span class="mss-key">重庆</span>黑山</span></div></li>
		-->
	</ul>
</div>


</body>
</html>
