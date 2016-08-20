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
	<title>论坛信息查询</title>
	<link type="text/css" rel="stylesheet" href="../css/admin.css" />
	<script type="text/javascript" src="../js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="../js/adminjs.js"></script>
  	<script type="text/javascript">
    	window.onload=function(){
      		menuclick();
      		loginout();
      		clear();
      		search("qa");
      		deletes("qa");
    	}
  	</script>
  </head>
  
  <body>
  <div class="loginbg" style="display:none;"></div>
	<div class="loginbox hotel" style="display:none;">
		<div class="title">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>删除信息</h3>
     	</div>

     	<div class="loginnav">
     		<form id="loginform" action="" method="post" >
     			
	            <div class="errer-info hide"></div>
	            <p>请确认要删除该提问</p>
	            
	            <p><label>问题编号：<span id="objid"></span></label></p>
	            <p><label>标题：<span id="title"></span></label></p>
	            <p><label>作者：<span id="author"></span></label></p>
	            <p><label>发表时间：<span id="time"></span></label></p>
	            <p><label>关联地：<span id="locate"></span></label></p>
	            
	            <div class="login-buttons">
	                <input id="deletesubmit" value="确认" type="button">
	            </div>

	     	</form>
     	</div>
	</div>
	<div class="alterbox" style="display:none;">
		<div class="title">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>修改信息</h3>
     	</div>

     	<div class="loginnav alter">
     			
	    	<div class="errer-info hide"></div>
	        
	        <table id="hotelinfo">
	        	
	        </table>
	            
	            
	        <div class="login-buttons">
	            <input id="altersubmit" value="修改" type="button">
	        </div>

     	</div>
	</div>
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
          			<div class="list-item" style="display:block;">
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
								<li><a href="#">论坛管理</a></li>
								<li>></li>
								<li><a href="#">论坛信息查询</a></li>
						</ul>

			</div>

			<div class="main">
				<div class="search-bar">
					<div class="left-side">
						<table>
							<tr>
								<td width="10%" align="right">编号:</td>
								<td width="15%"><input id="qaid" type="text"/></td>
								<td width="10%" align="right">标题:</td>
								<td width="15%"><input id="qatitle" type="text"/></td>
								<td width="20%" align="right">作者:</td>
								<td width="20%"><input id="qaauthor" type="text"/></td>
							</tr>
							<tr>
								<td align="right">关联地:</td>
								<td><input id="location" type="text"/></td>
								<td align="right">内容相关:</td>
								<td><input id="qacontent" type="text"/></td>
							</tr>
						</table>
					
					</div>
					
					
					<div class="right-side">
						<button id="_j_search">查询</button>
						<button id="_j_clear">清空</button>
					</div>
				</div>
				<div class="shadow"></div>
				
				<div class="search-list">
					<table id="list" width="100%" border="0">
							<tr class="head">
								<th width="10%">问题编号</th>
								<th width="20%">标题</th>
								<th width="15%">作者</th>
								<th width="15%">发表时间</th>
								<th width="10%">点击量</th>
								<th width="10%">点赞量</th>
								<th width="10%">回复量</th>
								<th width="10%">关联地</th>
							</tr>
						
					</table>
				</div>
				
				<div class="operation">
					<button id="_j_delete">删除</button>
				</div>
			
			</div>

		</div>


	</div>

	
	<div id="footer"><p>Copyright &copy;  2016 版权所有   </p></div>
  </body>
</html>
