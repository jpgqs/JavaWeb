<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User"%>
<%
	User u = (User) session.getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>省部级重点学科</title>
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
				<%
					if (u != null) {
				%>
				<li><a href="personalpage.jsp">个人中心</a></li>
				<%
					}
				%>
				<li><a href="schoolinfo.jsp">学校概况</a>
					<ul class="menu-inner">

						<li><a href="schoolinfo.jsp">学校简介</a></li>
						<li><a href="academypage.jsp">学院导航</a></li>
						<li><a href="majorpage.jsp">学校机构</a></li>
						<li><a href="http://xylyh.cqupt.edu.cn/index.html"
							target="_blank">重邮校友</a></li>
						<li><a href="http://202.202.43.154/">虚拟校园</a></li>
					</ul></li>
				<li><a href="teacherinfo.jsp">师资队伍</a>
					<ul class="menu-inner">

						<li><a href="teacherinfo.jsp">师资概况</a></li>
						<li><a href="teacherlist.jsp">部分师资</a></li>
					</ul></li>
				<li><a href="subjectinfo.jsp">学科建设</a>
					<ul class="menu-inner">

						<li><a href="subjectinfo.jsp">简介</a></li>
						<li><a href="degreeinfo.jsp">硕士/博士学位授权学科</a></li>
						<li><a href="">省部级重点学科</a></li>
					</ul></li>
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
						<strong>学科建设</strong>
					</div>
					<ul class="cdlist">
						<li><a href="subjectinfo.jsp">简介</a></li>
						<li><a href="degreeinfo.jsp">硕博学位授权学科</a></li>
						<li><a href="">省部级重点学科</a></li>
					</ul>

				</div>
			</div>

			<div class="rightbox">
				<h2>学科建设 > 省部级重点学科</h2>
				<div class="detail">
					<div class="subject">
						<center>
							<p>我校先后有11个一级学科、11个二级学科被信息产业部或重庆市批准为重点学科。</p>
							<p>省部级重点学科一级学科简表</p>
							<table border="1px" cellpadding="0" cellspacing="0" width="409px">
								<tbody>
									<tr>
										<td width="52px"><p align="center">序号</p></td>
										<td width="84px"><p align="center">学科代码</p></td>
										<td width="180px">
											<p align="center">学科名称</p>
										</td>
										<td width="93px">
											<p align="center">批准部门</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">1</p>
										</td>
										<td>
											<p align="center">0301</p>
										</td>
										<td>
											<p align="center">法学</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">2</p>
										</td>
										<td>
											<p align="center">0305</p>
										</td>
										<td>
											<p align="center">马克思主义理论</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">3</p>
										</td>
										<td>
											<p align="center">0702</p>
										</td>
										<td>
											<p align="center">物理学</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">4</p>
										</td>
										<td>
											<p align="center">0802</p>
										</td>
										<td>
											<p align="center">机械工程</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">5</p>
										</td>
										<td>
											<p align="center">0804</p>
										</td>
										<td>
											<p align="center">仪器科学与技术</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">6</p>
										</td>
										<td>
											<p align="center">0809</p>
										</td>
										<td>
											<p align="center">电子科学与技术</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">7</p>
										</td>
										<td>
											<p align="center">0810</p>
										</td>
										<td>
											<p align="center">信息与通信工程</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">8</p>
										</td>
										<td>
											<p align="center">0811</p>
										</td>
										<td>
											<p align="center">控制科学与工程</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">9</p>
										</td>
										<td>
											<p align="center">0812</p>
										</td>
										<td>
											<p align="center">计算机科学与技术</p>
										</td>
										<td width="93">
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">10</p>
										</td>
										<td>
											<p align="center">0835</p>
										</td>
										<td>
											<p align="center">软件工程</p>
										</td>
										<td width="93">
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">11</p>
										</td>
										<td>
											<p align="center">1201</p>
										</td>
										<td>
											<p align="center">管理科学与工程</p>
										</td>
										<td width="93">
											<p align="center">重庆市</p>
										</td>
									</tr>
								</tbody>
							</table>
							<p class="mr15" align="center">省部级重点学科二级学科简表</p>
							<table border="1" cellpadding="0" cellspacing="0" width="508">
								<tbody>
									<tr>
										<td><p align="center">序号</p></td>
										<td>
											<p align="center">学科代码</p>
										</td>
										<td>
											<p align="center">学科名称</p>
										</td>
										<td>
											<p align="center">批准部门</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">1</p>
										</td>
										<td>
											<p align="center">081001</p>
										</td>
										<td>
											<p align="center">通信与信息系统</p>
										</td>
										<td>
											<p align="center">信息产业部/重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">2</p>
										</td>
										<td>
											<p align="center">081002</p>
										</td>
										<td>
											<p align="center">信号与信息处理</p>
										</td>
										<td>
											<p align="center">信息产业部/重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">3</p>
										</td>
										<td>
											<p align="center">081203</p>
										</td>
										<td>
											<p align="center">计算机应用技术</p>
										</td>
										<td>
											<p align="center">信息产业部/重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">4</p>
										</td>
										<td>
											<p align="center">081101</p>
										</td>
										<td>
											<p align="center">控制理论与控制工程</p>
										</td>
										<td>
											<p align="center">信息产业部/重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">5</p>
										</td>
										<td>
											<p align="center">120100</p>
										</td>
										<td>
											<p align="center">管理科学与工程</p>
										</td>
										<td>
											<p align="center">信息产业部/重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">6</p>
										</td>
										<td>
											<p align="center">081202</p>
										</td>
										<td>
											<p align="center">计算机软件与理论</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">7</p>
										</td>
										<td>
											<p align="center">081201</p>
										</td>
										<td>
											<p align="center">计算机系统结构</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">8</p>
										</td>
										<td>
											<p align="center">081102</p>
										</td>
										<td>
											<p align="center">检测技术与自动化装置</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">9</p>
										</td>
										<td>
											<p align="center">080903</p>
										</td>
										<td>
											<p align="center">微电子学与固体电子学</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">10</p>
										</td>
										<td>
											<p align="center">070201</p>
										</td>
										<td>
											<p align="center">理论物理</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
									<tr>
										<td>
											<p align="center">11</p>
										</td>
										<td>
											<p align="center">030505</p>
										</td>
										<td>
											<p align="center">思想政治教育</p>
										</td>
										<td>
											<p align="center">重庆市</p>
										</td>
									</tr>
								</tbody>
							</table>
						</center>
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
