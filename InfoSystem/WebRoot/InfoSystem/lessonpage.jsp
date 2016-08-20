<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="_sessioncheck.jsp" %>
<%@ page import="com.bean.Subject" %>
<%
	String id=u.getId();
	Map<String,String> lessonmap=null;
	try{
		lessonmap=Subject.getLessonList(id);
		if(lessonmap==null){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('未获取到个人信息');");
			out.println("</script>");
		}
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
<title>选课信息</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script type="text/javascript" src="../js/page.js"></script>
<script type="text/javascript">
	window.onload = function() {
		menufocus();
	}
</script>
</head>
<body>
	<div id="header">
		<div class="wrap">
			<div id="top"></div>
			<div class="bg"></div>
			<div class="login">
				<span><a href="<%=u==null?"resetpwd.jsp":"alterpwd.jsp" %>"><%=u==null?"找回密码":"修改密码" %></a></span>
				<span>  |  </span>
				<span><a href="<%=u==null?"InfoSystem/login.jsp":"loginout.jsp" %>"><%=u==null?"登录":"注销" %></a></span>
			</div>
			<div>
				<img id="logo" src="../images/logo.png" />
				<img id="motto" src="../images/motto.png" />
			</div>
		</div>

	</div>

	<div class="menu" id="nav">
		<div class="wrap">
			<ul>
				<li><a href="../index.jsp">首页</a>
					<ul class="menu-inner"></ul></li>
				<li><a href="">个人中心</a></li>
				<li><a href="schoolinfo.jsp">学校概况</a>
					<ul class="menu-inner">

						<li><a href="schoolinfo.jsp">学校简介</a></li>
						<li><a href="academypage.jsp">学院导航</a></li>
						<li><a href="majorpage.jsp">学校机构</a></li>
						<li><a href="http://xylyh.cqupt.edu.cn/index.html"
							target="_blank">重邮校友</a></li>
						<li><a href="http://202.202.43.154/">虚拟校园</a></li>
					</ul></li>
				<li>
					<a href="teacherinfo.jsp">师资队伍</a>
					<ul class="menu-inner">
                		
                		<li><a href="teacherinfo.jsp">师资概况</a></li>
                		<li><a href="teacherlist.jsp">部分师资</a></li>
           			</ul>
				</li>
				<li>
					<a href="subjectinfo.jsp">学科建设</a>
					<ul class="menu-inner">
                		
                		<li><a href="subjectinfo.jsp">简介</a></li>
                		<li><a href="degreeinfo.jsp">硕士/博士学位授权学科</a></li>
                		<li><a href="impsubject.jsp">省部级重点学科</a></li>
           			</ul>
				</li>
				<li>
					<a href="scientific.jsp">科学研究</a>
					<ul class="menu-inner">
                		
                		<li><a href="scientific.jsp">科研机构</a></li>
                		<li><a href="achievements.jsp">科研成果</a></li>
                		<li><a href="http://journal.cqupt.edu.cn/jcuptnse/index.aspx" target="_blank">学术刊物</a></li>
                		<li><a href="http://cxy.cqupt.edu.cn/portal.php" target="_blank">产学研</a></li>
                		<li><a href="http://skc.cqupt.edu.cn/" target="_blank">社科在线</a></li>
                		<li><a href="http://202.202.32.194/" target="_blank">科技在线</a></li>
           			</ul>
				</li>
				<li>
					<a href="http://jwzx.cqupt.edu.cn/" target="_blank">人才培养</a>
					<ul class="menu-inner">
                		
                		<li><a href="http://jwzx.cqupt.edu.cn/" target="_blank">本科教育</a></li>
                		<li><a href="http://gs.cqupt.edu.cn/" target="_blank">研究生教育</a></li>
                		<li><a href="http://gjc.cqupt.edu.cn/" target="_blank">留学生教育</a></li>
                		<li><a href="http://cjy.cqupt.edu.cn/" target="_blank">继续教育</a></li>
                		<li><a href="http://vlab.cqupt.edu.cn/" target="_blank">示范中心</a></li>
           			</ul>
				</li>
				<li>
					<a href="enroll.jsp">招生就业</a>
					<ul class="menu-inner">
                		
                		<li><a href="enroll.jsp">招生信息</a></li>
                		<li><a href="http://job.cqupt.edu.cn/" target="_blank">就业信息</a></li>
           			</ul>
				</li>
				<li>
					<a href="campusview.jsp">校园文化</a>
					<ul class="menu-inner">
                		
                		<li><a href="http://202.202.43.36:8080" target="_blank">大学生文化素..</a></li>
                		<li><a href="campusview.jsp">校园风光</a></li>
                		<li><a href="https://redrock.cqupt.edu.cn/jsns/" target="_blank">学生活动</a></li>
           			</ul>
				</li>
				<li>
					<a href="calendar.jsp">公共服务</a>
					<ul class="menu-inner">
                		
                		<li><a href="calendar.jsp">重邮校历</a></li>
                		<li><a href="campusmap.jsp">校园地图</a></li>
                		<li><a href="http://dag.cqupt.edu.cn/" target="_blank">档案查询</a></li>
                		<li><a href="psearch.jsp">个人查询</a></li>
           			</ul>
				</li>
				
			</ul>
		</div>
	</div>

	<div id="content">
		<div class="personal wrap">
			<div class="leftbox">
				<div class="lab">
					<div class="tal">
						<strong>个人中心</strong>
					</div>
					<ul class="cdlist">
						<li><a href="personalpage.jsp">个人信息</a></li>
						<li><a href="classpage.jsp">班级信息</a></li>
						<li><a href="">选课信息</a></li>
						<li><a href="scorepage.jsp">考试成绩</a></li>
						<li><a href="scorelistpage.jsp">成绩总表</a></li>
						<li><a href="bookpage.jsp">教材信息</a></li>
						<li><a href="pm.jsp">我的通知</a></li>
					</ul>

				</div>
			</div>
			<div class="rightbox">
				<h2>个人中心 > 选课信息</h2>
				<div class="cztable">
					<div class="lesson">
					
						<% if(lessonmap!=null) {
					 %>
					<table width="100%" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<th width="9%"></th>
							<th width="13%">星期一</th>
							<th width="13%">星期二</th>
							<th width="13%">星期三</th>
							<th width="13%">星期四</th>
							<th width="13%">星期五</th>
							<th width="13%">星期六</th>
							<th width="13%">星期日</th>
						</tr>
						<tr>
            				<th>第一二节</th>
            				<td><%=lessonmap.get("11")==null?"":lessonmap.get("11") %></td>
            				<td><%=lessonmap.get("21")==null?"":lessonmap.get("21") %></td>
            				<td><%=lessonmap.get("31")==null?"":lessonmap.get("31") %></td>
            				<td><%=lessonmap.get("41")==null?"":lessonmap.get("41") %></td>
            				<td><%=lessonmap.get("51")==null?"":lessonmap.get("51") %></td>
            				<td><%=lessonmap.get("61")==null?"":lessonmap.get("61") %></td>
            				<td><%=lessonmap.get("71")==null?"":lessonmap.get("71") %></td>
        				</tr>
        				<tr>
            				<th>第三四节</th>
            				<td><%=lessonmap.get("12")==null?"":lessonmap.get("12") %></td>
            				<td><%=lessonmap.get("22")==null?"":lessonmap.get("22") %></td>
            				<td><%=lessonmap.get("32")==null?"":lessonmap.get("32") %></td>
            				<td><%=lessonmap.get("42")==null?"":lessonmap.get("42") %></td>
            				<td><%=lessonmap.get("52")==null?"":lessonmap.get("52") %></td>
            				<td><%=lessonmap.get("62")==null?"":lessonmap.get("62") %></td>
            				<td><%=lessonmap.get("72")==null?"":lessonmap.get("72") %></td>
        				</tr>
        				<tr>
            				<th>第五六节</th>
            				<td><%=lessonmap.get("13")==null?"":lessonmap.get("13") %></td>
            				<td><%=lessonmap.get("23")==null?"":lessonmap.get("23") %></td>
            				<td><%=lessonmap.get("33")==null?"":lessonmap.get("33") %></td>
            				<td><%=lessonmap.get("43")==null?"":lessonmap.get("43") %></td>
            				<td><%=lessonmap.get("53")==null?"":lessonmap.get("53") %></td>
            				<td><%=lessonmap.get("63")==null?"":lessonmap.get("63") %></td>
            				<td><%=lessonmap.get("73")==null?"":lessonmap.get("73") %></td>
        				</tr>
        				<tr>
            				<th>第七八节</th>
            				<td><%=lessonmap.get("14")==null?"":lessonmap.get("14") %></td>
            				<td><%=lessonmap.get("24")==null?"":lessonmap.get("24") %></td>
            				<td><%=lessonmap.get("34")==null?"":lessonmap.get("34") %></td>
            				<td><%=lessonmap.get("44")==null?"":lessonmap.get("44") %></td>
            				<td><%=lessonmap.get("54")==null?"":lessonmap.get("54") %></td>
            				<td><%=lessonmap.get("64")==null?"":lessonmap.get("64") %></td>
            				<td><%=lessonmap.get("74")==null?"":lessonmap.get("74") %></td>
        				</tr>
        				<tr>
            				<th>第九十节</th>
            				<td><%=lessonmap.get("15")==null?"":lessonmap.get("15") %></td>
            				<td><%=lessonmap.get("25")==null?"":lessonmap.get("25") %></td>
            				<td><%=lessonmap.get("35")==null?"":lessonmap.get("35") %></td>
            				<td><%=lessonmap.get("45")==null?"":lessonmap.get("45") %></td>
            				<td><%=lessonmap.get("55")==null?"":lessonmap.get("55") %></td>
            				<td><%=lessonmap.get("65")==null?"":lessonmap.get("65") %></td>
            				<td><%=lessonmap.get("75")==null?"":lessonmap.get("75") %></td>
        				</tr>
        				<tr>
            				<th>第十一十二二节</th>
            				<td><%=lessonmap.get("16")==null?"":lessonmap.get("16") %></td>
            				<td><%=lessonmap.get("26")==null?"":lessonmap.get("26") %></td>
            				<td><%=lessonmap.get("36")==null?"":lessonmap.get("36") %></td>
            				<td><%=lessonmap.get("46")==null?"":lessonmap.get("46") %></td>
            				<td><%=lessonmap.get("56")==null?"":lessonmap.get("56") %></td>
            				<td><%=lessonmap.get("66")==null?"":lessonmap.get("66") %></td>
            				<td><%=lessonmap.get("76")==null?"":lessonmap.get("76") %></td>
        				</tr>
        				

					</tbody>
				</table>
				<% } %>
					
					</div>
					
				</div>
			</div>
		</div>

	</div>

	<div id="footer">
		<span>联系管理员 | 重庆邮电大学 | 重庆市南岸区崇文路2号 | 400065</span>
	</div>


</body>
</html>
