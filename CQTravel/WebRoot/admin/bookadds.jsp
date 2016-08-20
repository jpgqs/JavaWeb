<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>

<%@ page import="java.lang.Exception" %>
<%

	
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>旅游信息后台管理系统</title>
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
		<a href="index.jsp"><div class="logo">旅游信息系统后台管理</div></a>
		<div class="navigation">
			<ul>
		 		<li>欢迎您！</li>
				<li><a href=""></a></li>
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
					<h4 class="M1"><span></span>用户信息</h4>
          			<div class="list-item">
            			<a href="stuinfoalter.jsp">用户信息修改</a>
            			<a href="stuinfosearch.jsp">用户信息查询</a>
            			<a href="stuinfodelete.jsp">用户信息删除</a>
          			</div>
				</li>
				<li>
          			<h4 class="M2"><span></span>酒店信息</h4>
          			<div class="list-item">
            			<a href="bookadd.jsp">酒店信息录入</a>
            			<a href="bookadds.jsp">酒店信息批量导入</a>
            			<a href="bookalter.jsp">酒店信息修改</a>
            			<a href="booksearch.jsp">酒店信息查询</a>
            			<a href="bookdelete.jsp">酒店信息删除</a>         
           			</div>
        		</li>
        		<li>
          			<h4 class="M2"><span></span>景点信息</h4>
          			<div class="list-item">
            			<a href="bookadd.jsp">景点信息录入</a>
            			<a href="bookadds.jsp">景点信息批量导入</a>
            			<a href="bookalter.jsp">景点信息修改</a>
            			<a href="booksearch.jsp">景点信息查询</a>
            			<a href="bookdelete.jsp">景点信息删除</a>         
           			</div>
        		</li>
        		<li>
          			<h4 class="M2"><span></span>游记攻略管理</h4>
          			<div class="list-item">
            			<a href="booksearch.jsp">游记攻略查询</a>
            			<a href="bookdelete.jsp">游记攻略删除</a>         
           			</div>
        		</li>
        		<li>
          			<h4 class="M2"><span></span>论坛管理</h4>
          			<div class="list-item">
            			<a href="booksearch.jsp">论坛信息查询</a>
            			<a href="bookdelete.jsp">论坛信息删除</a>         
           			</div>
        		</li>
        		<li>
          			<h4 class="M3"><span></span>公告发布</h4>
          			<div class="list-item">
            			<a href="newsrelease.jsp">攻略发布</a>
            			<a href="noticerelease.jsp">公告发布</a>
          			</div>
        		</li>
				<li>
          			<h4 class="M4"><span></span>通知下发</h4>
          			<div class="list-item">
            			<a href="sendmessage.jsp">系统消息</a>
          			</div>
        		</li>
				
				
			</ul>

		</div>

		<div class="m-right">
			
			<div class="right-nav">
				
				<ul>
							<li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="#">酒店信息</a></li>
								<li>></li>
								<li><a href="#">酒店信息批量导入</a></li>
						</ul>

			</div>

			<div class="main">
				<div class="import">
				
					<span class="tips">批量导入酒店信息，请先<span><a class="download" href="../bookinfo.xlsx" target="_blank">下载模板</a></span>，并将Excel设置为文本格式</span>
					
					
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
