<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="_adminsessioncheck.jsp" %>
<%@ page import="com.bean.Administrator" %>
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
          			<div class="list-item" style="display:block;">
            			<a href="stuinfoadd.jsp">学生信息录入</a>
            			<a href="stuinfoadds.jsp">学生信息批量导入</a>
            			<a href="stuinfoalter.jsp">学生信息修改</a>
            			<a href="stuinfosearch.jsp">学生信息查询</a>
            			<a href="stuinfodelete.jsp">学生信息删除</a>
          			</div>
				</li>
				<li>
          			<h4 class="M2"><span></span>教材信息</h4>
          			<div class="list-item">
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
								<li><a href="#">学生信息</a></li>
								<li>></li>
								<li><a href="#">学生信息录入</a></li>
						</ul>

			</div>

			<div class="main">
			
				<form action="stuaddsubmit.jsp" method="post" onsubmit="return nullcheck();">
					
					<table class="info">
						<tr>
							<td>学号：</td>
							<td><input name="id" id="id" type="text"></td>
							<td>姓名：</td>
							<td><input name="name" id="name" type="text"></td>
						</tr>
						<tr>
							<td>身份证号码:</td>
							<td><input name="idcard" id="idcard" type="text"></td>
							<td>性别：</td>
							<td>
								<input name="sex" type="radio" value="1" checked="checked"/>男
								<input name="sex" type="radio" value="0" />女
							</td>
						</tr>
						<tr>
							<td>联系电话:</td>
							<td><input name="phone" type="text"></td>
							<td>QQ:</td>
							<td><input name="qq" type="text"></td>
						</tr>
						<tr>
							<td>电子邮箱:</td>
							<td><input name="email" type="text"></td>
							<td>学院:</td>
							<td>
								<select name="academy" id="academy" onchange="getMajor(this)">
								<%	if(ac!=null&&ac.size()>0){
										for(int i=0;i<ac.size();i++){
											Academy a=ac.get(i);
								 %>
									<option value="<%=a.getId() %>"><%=a.getName() %></option>
								<%
										}
									}
								 %>
								</select>
							</td>
						</tr>
						<tr>
							<td>专业:</td>
							<td>
								<select name="major" id="major" >
									<option value="080703">通信工程</option>
									<option value="080701">电子信息工程</option>
									<option value="080706">信息工程</option>
									<option value="080707T">广播电视工程</option>
								</select>
							</td>
							<td>班级:</td>
							<td><input name="classes" id="classes" type="text"></td>
						</tr>
						<tr>
							<td>第二专业:</td>
							<td>
								<select name="academy" id="academy" onchange="getMajor(this)">
									<option value=""></option>
								<%	if(ac!=null&&ac.size()>0){
										for(int i=0;i<ac.size();i++){
											Academy a=ac.get(i);
								 %>
									<option value="<%=a.getId() %>"><%=a.getName() %></option>
								<%
										}
									}
								 %>
								</select>
							</td>
							<td>第二专业班级:</td>
							<td><input name="subclass" type="text"></td>
						</tr>
						<tr>
							<td>紧急联系人:</td>
							<td><input name="emcontact" type="text"></td>
							<td>紧急联系方式:</td>
							<td><input name="emphone" type="text"></td>
						</tr>
						<tr>
							<td>家庭住址:</td>
							<td colspan="3"><input style="width:100%;" name="address" type="text"></td>
							
						</tr>
						<tr>
							<td colspan="4" style="text-align:center;"><input type="submit" value="提交"/></td>
						</tr>
					</table>
					
				</form>
			
			
			</div>

		</div>


	</div>

	
	<div id="footer"><p>Copyright &copy;  2016 版权所有   </p></div>
  </body>
</html>
