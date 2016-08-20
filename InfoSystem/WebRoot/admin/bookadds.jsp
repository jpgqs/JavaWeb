<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="_adminsessioncheck.jsp" %>
<%@ page import="com.bean.Administrator" %>
<%@ page import="com.bean.Teacher" %>
<%@ page import="com.bean.Academy" %>
<%@ page import="java.lang.Exception" %>
<%
	Administrator admin=(Administrator)o;
	
	ArrayList<Academy> ac=null;
	
	try{
		ac=Academy.getAcademies();
	}catch(Exception e){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('"+e.getMessage()+"');");
		out.println("</script>");
	}
	
	
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>学生信息录入</title>
	<link type="text/css" rel="stylesheet" href="../css/admin.css" />
	<script type="text/javascript" src="../js/adminjs.js"></script>
  	<script type="text/javascript">
    	window.onload=function(){
      		menuclick();
    	}
  	</script>
  </head>
  
  <body>
    <div id="header">
		<a href="index.jsp"><div class="logo">学生信息后台管理</div></a>
		<div class="navigation">
			<ul>
		 		<li>欢迎您！</li>
				<li><a href=""><%=admin.getId() %></a></li>
				<li><a href="">修改密码</a></li>
				<li><a href="">设置</a></li>
				<li><a href="logout.jsp">退出</a></li>
			</ul>
		</div>
	</div>

	<div id="content">
		
		<div class="left-menu">
			
			<ul id="nav_dot">
				<li>
					<h4 class="M1"><span></span>学生信息</h4>
          			<div class="list-item">
            			<a href="stuinfoadd.jsp">学生信息录入</a>
            			<a href="stuinfoadds.jsp">学生信息批量导入</a>
            			<a href="stuinfoalter.jsp">学生信息修改</a>
            			<a href="stuinfosearch.jsp">学生信息查询</a>
            			<a href="stuinfodelete.jsp">学生信息删除</a>
          			</div>
				</li>
				<li>
          			<h4 class="M2"><span></span>教材信息</h4>
          			<div class="list-item" style="display:block;">
            			<a href="bookadd.jsp">教材信息录入</a>
            			<a href="bookadds.jsp">教材信息批量导入</a>
            			<a href="bookalter.jsp">教材信息修改</a>
            			<a href="booksearch.jsp">教材信息查询</a>
            			<a href="bookdelete.jsp">教材信息删除</a>         
           			</div>
        		</li>
        		<li>
          			<h4 class="M3"><span></span>新闻公告</h4>
          			<div class="list-item">
            			<a href="newsrelease.jsp">新闻发布</a>
            			<a href="noticerelease.jsp">公告发布</a>
          			</div>
        		</li>
				<li>
          			<h4 class="M4"><span></span>通知下发</h4>
          			<div class="list-item">
            			<a href="sendmessage.jsp">短消息</a>
          			</div>
        		</li>
				
			</ul>

		</div>

		<div class="m-right">
			
			<div class="right-nav">
				
				<ul>
							<li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="#">教材信息</a></li>
								<li>></li>
								<li><a href="#">教材信息批量导入</a></li>
						</ul>

			</div>

			<div class="main">
				<div class="import">
				
					<span class="tips">批量导入教材信息，请先<span><a class="download" href="../bookinfo.xlsx" target="_blank">下载模板</a></span>，并将Excel设置为文本格式</span>
					
					
					<div class="submit">
					<form action="upload.jsp" enctype="multipart/form-data" method="post">
						<span class="input-file">选择文件...<input type="file" name="file"></span>
						<input type="submit" value="提交"/>
					</form>
					</div>
				
				</div>
			
			
			
			</div>

		</div>


	</div>

	
	<div id="footer"><p>Copyright &copy;  2015 版权所有   </p></div>
  </body>
</html>
