<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="_sessioncheck.jsp" %>
<%
	
	String passport=null;
	if(admin!=null){
		passport=admin.getPassport();
	}
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>旅游信息后台管理系统</title>
	<link type="text/css" rel="stylesheet" href="../css/admin.css" />
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="../js/adminjs.js"></script>
  	<script type="text/javascript">
    	window.onload=function(){
      		menuclick();
      		loginout();
    	}
  	</script>
  </head>
  
  <body>
    <div id="header">
		<a href="index.jsp"><div class="logo">旅游信息系统后台管理</div></a>
		<div class="navigation">
			<ul>
		 		<li>欢迎您！</li>
				<li><a href=""><%=passport %></a></li>
				<li><a href="">修改密码</a></li>
				<li><a href="">设置</a></li>
				<li><a id="loginout" href="javascript:void(0);">退出</a></li>
			</ul>
		</div>
	</div>

	<div id="content">
		
		<div class="left-menu">
			
			<ul id="nav_dot">
				<li>
					<h4 class="M1"><span></span>用户信息</h4>
          			<div class="list-item">
            			<a href="userSearch.jsp">用户信息查询</a>
          			</div>
				</li>
				<li>
          			<h4 class="M2"><span></span>酒店信息</h4>
          			<div class="list-item">
            			<a href="hotelInsert.jsp">酒店信息录入</a>
            			<a href="hotelSearch.jsp">酒店信息查询</a>
           			</div>
        		</li>
        		<li>
          			<h4 class="M2"><span></span>景点信息</h4>
          			<div class="list-item">
            			<a href="viewInsert.jsp">景点信息录入</a>
            			<a href="viewSearch.jsp">景点信息查询</a>
           			</div>
        		</li>
        		<li>
          			<h4 class="M2"><span></span>游记攻略管理</h4>
          			<div class="list-item">
            			<a href="noteSearch.jsp">游记攻略查询</a>
           			</div>
        		</li>
        		<li>
          			<h4 class="M2"><span></span>论坛管理</h4>
          			<div class="list-item">
            			<a href="qaSearch.jsp">论坛信息查询</a>
           			</div>
        		</li>
        		<li>
          			<h4 class="M3"><span></span>公告发布</h4>
          			<div class="list-item">
            			<a href="strategyRelease.jsp">攻略发布</a>
            			<a href="noticerelease.jsp">公告发布</a>
          			</div>
        		</li>
				<li>
          			<h4 class="M4"><span></span>通知下发</h4>
          			<div class="list-item">
            			<a href="systemMessage.jsp">系统消息</a>
          			</div>
        		</li>
				
				
			</ul>

		</div>

		<div class="m-right">
			
			<div class="right-nav">
				
				<ul>
							<li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="#">首页</a></li>
						</ul>

			</div>

			<div class="main"></div>

		</div>


	</div>

	
	<div id="footer"><p>Copyright &copy;  2016 版权所有   </p></div>
  </body>
</html>
