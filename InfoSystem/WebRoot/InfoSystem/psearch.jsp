<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%
	User u=(User)session.getAttribute("user");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>招生信息</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<script type="text/javascript" src="../js/page.js"></script>
	<script type="text/javascript">
		window.onload=function(){
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
				<span><a href="resetpwd.html">找回密码</a></span>
				<span>  |  </span>
				<span><a href="login.html">登录</a></span>
			</div>
			<div>
				<img id="logo" src="../images/logo.png">
				<img id="motto" src="../images/motto.png">
			</div>
		</div>
		
	</div>

	<div class="menu" id="nav">
		<div class="wrap">
			<ul>
				<li><a href="../index.jsp">首页</a>
					<ul class="menu-inner"></ul>
				</li>
				<% if(u!=null) { %>
					<li><a href="InfoSystem/personalpage.jsp">个人中心</a></li>
				<% } %>
				<li>
					<a href="InfoSystem/schoolinfo.jsp">学校概况</a>
					<ul class="menu-inner">
                		
                		<li><a href="InfoSystem/schoolinfo.jsp">学校简介</a></li>
                		<li><a href="InfoSystem/academypage.jsp">学院导航</a></li>
                		<li><a href="InfoSystem/majorpage.jsp">学校机构</a></li>
	                	<li><a href="http://xylyh.cqupt.edu.cn/index.html" target="_blank">重邮校友</a></li>
	                	<li><a href="http://202.202.43.154/">虚拟校园</a></li>
           			</ul>
				</li>
				<li>
					<a href="">师资队伍</a>
					<ul class="menu-inner">
                		
                		<li><a href="">师资概况</a></li>
                		<li><a href="teacherlist.jsp">部分师资</a></li>
           			</ul>
				</li>
				<li>
					<a href="InfoSystem/subjectinfo.jsp">学科建设</a>
					<ul class="menu-inner">
                		
                		<li><a href="InfoSystem/subjectinfo.jsp">简介</a></li>
                		<li><a href="InfoSystem/degreeinfo.jsp">硕士/博士学位授权学科</a></li>
                		<li><a href="InfoSystem/impsubject.jsp">省部级重点学科</a></li>
           			</ul>
				</li>
				<li>
					<a href="">科学研究</a>
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
					<a href="">人才培养</a>
					<ul class="menu-inner">
                		
                		<li><a href="http://jwzx.cqupt.edu.cn/" target="_blank">本科教育</a></li>
                		<li><a href="http://gs.cqupt.edu.cn/" target="_blank">研究生教育</a></li>
                		<li><a href="http://gjc.cqupt.edu.cn/" target="_blank">留学生教育</a></li>
                		<li><a href="http://cjy.cqupt.edu.cn/" target="_blank">继续教育</a></li>
                		<li><a href="http://vlab.cqupt.edu.cn/" target="_blank">示范中心</a></li>
           			</ul>
				</li>
				<li>
					<a href="">招生就业</a>
					<ul class="menu-inner">
                		
                		<li><a href="">招生信息</a></li>
                		<li><a href="http://job.cqupt.edu.cn/" target="_blank">就业信息</a></li>
           			</ul>
				</li>
				<li>
					<a href="">校园文化</a>
					<ul class="menu-inner">
                		
                		<li><a href="http://202.202.43.36:8080" target="_blank">大学生文化素..</a></li>
                		<li><a href="InfoSystem/campusview.jsp">校园风光</a></li>
                		<li><a href="https://redrock.cqupt.edu.cn/jsns/" target="_blank">学生活动</a></li>
           			</ul>
				</li>
				<li>
					<a href="">公共服务</a>
					<ul class="menu-inner">
                		
                		<li><a href="InfoSystem/calendar.jsp">重邮校历</a></li>
                		<li><a href="InfoSystem/campusmap.jsp">校园地图</a></li>
                		<li><a href="http://dag.cqupt.edu.cn/" target="_blank">档案查询</a></li>
                		<li><a href="InfoSystem/psearch.jsp">个人查询</a></li>
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
						<strong>招生就业</strong>
					</div>
					<ul class="cdlist">
						<li><a href="">招生信息</a></li>
                		<li><a href="http://job.cqupt.edu.cn/" target="_blank">就业信息</a></li>
					</ul>
					
				</div>
			</div>

			<div class="rightbox">
				<h2>招生就业 > 招生信息</h2>
				<div class="detail">
					<!--内容区-->
                	<ul id="enroll">
                        <li><a target="_blank" href="http://zs.cqupt.edu.cn/">本科招生信息</a></li>
                        <li><a target="_blank" href="http://gs.cqupt.edu.cn/class-10-18.aspx">全日制硕士研究生招生信息</a></li>
                        <li><a target="_blank" href="http://gs.cqupt.edu.cn/class-10-1024.aspx">全日制博士研究生招生信息</a></li>
                        <li><a target="_blank" href="http://gs.cqupt.edu.cn/html/gcss/default.aspx">工程硕士研究生招生信息</a></li>
                        <li><a target="_blank" href="http://international.cqupt.edu.cn/">留学生招生信息</a></li>
                    </ul>
				</div>
			</div>
		</div>
		
	</div>

	<div id="footer">
		<span>联系管理员 | 重庆邮电大学 | 重庆市南岸区崇文路2号 | 400065</span>
	</div>

  </body>
</html>
