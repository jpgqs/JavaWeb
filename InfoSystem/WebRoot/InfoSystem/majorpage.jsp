<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User"%>
<%
	User u = (User) session.getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>学校机构</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
				<span><a href="<%=u==null?"login.jsp":"loginout.jsp" %>"><%=u==null?"登录":"注销" %></a></span>
			</div>
			<div>
				<img id="logo" src="../images/logo.png"> <img id="motto"
					src="../images/motto.png">
			</div>
		</div>

	</div>

	<div class="menu" id="nav">
		<div class="wrap">
			<ul>
				<li><a href="../index.jsp">首页</a>
					<ul class="menu-inner"></ul></li>
				<% if(u!=null) { %>
					<li><a href="personalpage.jsp">个人中心</a></li>
				<% } %>
				<li><a href="schoolinfo.jsp">学校概况</a>
					<ul class="menu-inner">

						<li><a href="schoolinfo.jsp">学校简介</a></li>
						<li><a href="academypage.jsp">学院导航</a></li>
						<li><a href="">学校机构</a></li>
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
						<strong>学校概况</strong>
					</div>
					<ul class="cdlist">
						<li><a href="schoolinfo.jsp">学校简介</a></li>
						<li><a href="academypage.jsp">学院导航</a></li>
						<li><a href="">学校机构</a></li>
						<li><a href="http://xylyh.cqupt.edu.cn/index.html" target="_blank">重邮校友</a></li>
						<li><a href="http://202.202.43.154/">虚拟校园</a></li>
					</ul>

				</div>
			</div>

			<div class="rightbox">
				<h2>学校概况 > 学校机构</h2>
				<div class="detail">
					<div class="major">
						<div>
							<h2>党群部门</h2>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td><a target="_blank" href="http://office.cqupt.edu.cn/">[党办]</a></td>
										<td><a target="_blank" href="http://dwzzb.cqupt.edu.cn/">[组织部/统战部]</a></td>
										<td><a target="_blank" href="http://xcb.cqupt.edu.cn/">[宣传部]</a></td>
									</tr>
									<tr>
										<td><a target="_blank"
											href="http://xsc.cqupt.edu.cn/xsc/">[学工部/学工处]</a></td>
										<td><a target="_blank" href="http://jiwei.cqupt.edu.cn/">[纪检办]</a></td>
										<td><a target="_blank" href="http://gh.cqupt.edu.cn/">[教工会邮电委员会]</a></td>
									</tr>
									<tr>
										<td><a target="_blank" href="http://202.202.43.42/gqt/">[中共青年团邮电委员会]</a></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div>
							<h2>行政部门</h2>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td><a target="_blank" href="http://office.cqupt.edu.cn/">[校办]</a></td>
										<td><a target="_blank" href="http://jwc.cqupt.edu.cn">[教务处]</a></td>
										<td><a target="_blank" href="http://gs.cqupt.edu.cn/">[研究生院]</a></td>
									</tr>
									<tr>
										<td><a target="_blank"
											href="http://xsc.cqupt.edu.cn/xsc/">[学生处]</a></td>
										<td><a target="_blank" href="http://zjc.cqupt.edu.cn/">[招就处]</a></td>
										<td><a target="_blank" href="http://202.202.32.194/">[科技处]</a></td>
									</tr>
									<tr>
										<td><a target="_blank" href="http://skc.cqupt.edu.cn/">[社科处]</a></td>
										<td><a target="_blank"
											href="http://cxy.cqupt.edu.cn/portal.php">[产学研办]</a></td>
										<td><a target="_blank" href="http://gjc.cqupt.edu.cn/">[国际处/港澳台办]</a></td>
									</tr>
									<tr>
										<td><a target="_blank" href="http://rsc.cqupt.edu.cn/">[人事处]</a></td>
										<td><a target="_blank"
											href="http://cwzx.cqupt.edu.cn:8080/">[财务处]</a></td>
										<td><a target="_blank" href="http://zcc.cqupt.edu.cn/">[资产管理处]</a></td>
									</tr>
									<tr>
										<td><a target="_blank" href="http://jjc.cqupt.edu.cn/">[基建后勤处]</a></td>
										<td><a target="_blank" href="http://bwc.cqupt.edu.cn/">[保卫处]</a></td>
										<td><a target="_blank" href="http://jiwei.cqupt.edu.cn/">[监察处]</a></td>
									</tr>
									<tr>
										<td><a target="_blank" href="http://sjc.cqupt.edu.cn/">[审计处]</a></td>
										<td><a target="_blank" href="http://ltxc.cqupt.edu.cn/">[离退休工作处]</a></td>
										<td><a target="_blank"
											href="http://jyfzyjy.cqupt.edu.cn/">[发展研究中心]</a></td>
									</tr>

								</tbody>
							</table>
						</div>

						<div>
							<h2>教学单位</h2>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td><a target="_blank" href="http://202.202.43.151/scie/">[通信与信息工程学院]</a></td>
										<td><a target="_blank" href="http://cs.cqupt.edu.cn/">[计算机科学与技术学院]</a></td>
										<td><a target="_blank" href="http://ac.cqupt.edu.cn/">[自动化学院]</a></td>
									</tr>

									<tr>
										<td><a target="_blank" href="http://same.cqupt.edu.cn/">[先进制造工程学院]</a></td>
										<td><a target="_blank" href="http://ee.cqupt.edu.cn/">[光电学院/国际半导体学院]</a></td>
										<td><a target="_blank"
											href="http://software.cqupt.edu.cn/">[软件学院]</a></td>
									</tr>

									<tr>
										<td><a target="_blank" href="http://202.202.43.56/">[生物信息学院]</a></td>
										<td><a target="_blank" href="http://slxy.cqupt.edu.cn/">[理学院]</a></td>
										<td><a target="_blank" href="http://jgxy.cqupt.edu.cn/">[经济管理学院]</a></td>
									</tr>

									<tr>
										<td><a target="_blank" href="http://cmys.cqupt.edu.cn/">[传媒艺术学院]</a></td>
										<td><a target="_blank"
											href="http://cfl.cqupt.edu.cn/cfl/index.html">[外国语学院]</a></td>
										<td><a target="_blank"
											href="http://international.cqupt.edu.cn/">[国际学院]</a></td>
									</tr>

									<tr>
										<td><a target="_blank" href="http://law.cqupt.edu.cn/">[法学院]</a></td>
										<td><a target="_blank" href="http://marx.cqupt.edu.cn">[马克思主义学院]</a></td>
										<td><a target="_blank" href="http://tyxy.cqupt.edu.cn/">[体育学院]</a></td>
									</tr>
									<tr>
										<td><a target="_blank" href="http://222.177.140.116/">[继续教育学院]</a></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div>
							<h2>直属单位</h2>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td><a target="_blank" href="http://xxb.cqupt.edu.cn/">[信息管理中心/信息化办公室]</a></td>
										<td><a target="_blank" href="http://tsg.cqupt.edu.cn/">[图书馆]</a></td>
										<td><a target="_blank"
											href="http://journal.cqupt.edu.cn/jcuptnse/index.aspx">[期刊社]</a></td>
									</tr>

									<tr>
										<td><a target="_blank" href="http://dag.cqupt.edu.cn/">[档案馆]</a></td>
										<td><a target="_blank"
											href="http://xylyh.cqupt.edu.cn/index.html">[校友联谊会]</a></td>
									</tr>

								</tbody>
							</table>
						</div>

					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>

	</div>

	<div id="footer">
		<span>联系管理员 | 重庆邮电大学 | 重庆市南岸区崇文路2号 | 400065</span>
	</div>
</body>
</html>
