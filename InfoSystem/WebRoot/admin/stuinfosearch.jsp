<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="_adminsessioncheck.jsp" %>
<%@ page import="com.bean.Administrator" %>
<%@ page import="com.bean.Academy" %>
<%@ page import="java.lang.Exception" %>
<%@ page import="com.bean.Student" %>
<%
	request.setCharacterEncoding("utf-8");
	Administrator admin=(Administrator)o;
	
	
	
	ArrayList<Student> sl=null;
	try{
	String submit=request.getParameter("search");
	if("search".equals(submit)){
		String condition=request.getParameter("condition");
		sl=Student.search(condition);
	}
	}catch(Exception e){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('"+e.getMessage()+"');");
		out.println("history.back();");
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
      		detailChg();
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
								<li><a href="#">学生信息查询</a></li>
						</ul>

			</div>

			<div class="main">
				<div class="search">
				<form action="" method="post">
					<input type="hidden" name="search" value="search" />
					<input type="text" name="condition" placeholder="请输入查询条件：学号、姓名或身份证号码"/><input type="submit" value="查询"/>
				</form>
				</div>
				<% if(sl!=null&&sl.size()>0) { %>
				<div class="result" id="result">
					<ul>
						<%
							for(int i=0;i<sl.size();i++) {
							Student s=sl.get(i);
						 %>
						<li><%=s.getId()+" "+s.getName() %> </li>
						<% } %>
					</ul>
				</div>
				<div id="detail">
				<% for(int i=0;i<sl.size();i++) { 
						Student s=sl.get(i);
				%>
				<div class="detail" style="display:<%=i==0?"block":"none"%>">
				<table class="info">
					
						<tr>
							
							<td>学号：</td>
							<td><%=s.getId() %></td>
							<td>姓名：</td>
							<td><%=s.getName() %></td>
						</tr>
						<tr>
							<td>身份证号码:</td>
							<td><%=s.getIdcard() %></td>
							<td>性别：</td>
							<td>
								<%=s.getGender()==1?"男":"女" %>
							</td>
						</tr>
						<tr>
							<td>联系电话:</td>
							<td><%=s.getPhone()==null?"":s.getPhone() %></td>
							<td>QQ:</td>
							<td><%=s.getQq()==null?"":s.getQq() %></td>
						</tr>
						<tr>
							<td>电子邮箱:</td>
							<td><%=s.getEmail()==null?"":s.getEmail() %></td>
							<td>学院:</td>
							<td>
								<%=s.getAcademy() %>
							</td>
						</tr>
						<tr>
							<td>专业:</td>
							<td>
								<%=s.getMajor() %>
							</td>
							<td>班级:</td>
							<td><%=s.getClasses() %></td>
						</tr>
						<tr>
							<td>第二专业:</td>
							<td>
								<%=s.getSubmajor()==null?"":s.getSubmajor() %>
							</td>
							<td>第二专业班级:</td>
							<td><%=s.getSubclass()==null?"":s.getSubclass() %></td>
						</tr>
						<tr>
							<td>紧急联系人:</td>
							<td><%=s.getEmcontact()==null?"":s.getEmcontact() %></td>
							<td>紧急联系方式:</td>
							<td><%=s.getEmphone()==null?"":s.getEmphone() %></td>
						</tr>
						<tr>
							<td>家庭住址:</td>
							<td colspan="3"><%=s.getAddress()==null?"":s.getAddress() %></td>
							
						</tr>
						
				
				</table>
				
				</div>
				
				<% 		}
					}
				%>
				</div>
			</div>

		</div>


	</div>

	
	<div id="footer"><p>Copyright &copy;  2016 版权所有   </p></div>
  </body>
</html>
