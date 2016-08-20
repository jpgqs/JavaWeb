<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User"%>
<%
	User u = (User) session.getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>学院导航</title>
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
						<li><a href="">学院导航</a></li>
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
						<strong>学校概况</strong>
					</div>
					<ul class="cdlist">
						<li><a href="schoolinfo.jsp">学校简介</a></li>
						<li><a href="">学院导航</a></li>
						<li><a href="majorpage.jsp">学校机构</a></li>
						<li><a href="http://xylyh.cqupt.edu.cn/index.html" target="_blank">重邮校友</a></li>
						<li><a href="http://202.202.43.154/">虚拟校园</a></li>
					</ul>

				</div>
			</div>

			<div class="rightbox">
				<h2>学校概况 > 学院导航</h2>
				<div class="detail">
					<div class="academy">
						<div class="xy">
							<h3>
								<a target="_blank" href="http://scie.cqupt.edu.cn/">通信与信息工程学院</a>
							</h3>
							<a>[通信工程]</a> <a>[电子信息工程]</a> <a>[电子信息科学与技术]</a> <a>[信息工程]</a>

						</div>

						<div class="xy">
							<h3>
								<a target="_blank" href="http://cs.cqupt.edu.cn/">计算机科学与技术学院</a>
							</h3>
							<a>[计算机科学与技术]</a> <a>[智能科学与技术]</a> <a>[地理信息系统]</a> <a>[信息安全]</a>
							<a>[网络工程]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link" href="http://ac.cqupt.edu.cn/">自动化学院</a>
							</h3>
							<a>[自动化]</a> <a>[测控技术与仪器]</a> <a>[电气工程与自动化]</a> <a>[物联网工程]</a> <a>[智能电网信息工程]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link" href="http://same.cqupt.edu.cn/">先进制造工程学院</a>
							</h3>
							<a>[机械设计制造及其自动化]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link" href="http://ee.cqupt.edu.cn/">光电工程学院/重庆国际半导体学院</a>
							</h3>
							<a>[光信息科学与技术]</a> <a>[微电子学]</a> <a>[电子科学与技术]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link"
									href="http://software.cqupt.edu.cn/">软件工程学院</a>
							</h3>
							<a>[软件工程]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link" href="http://swxy.cqupt.edu.cn/">生物信息学院</a>
							</h3>
							<a>[生物医学工程]</a> <a>[生物技术]</a> <a>[中药学]</a> <a>[制药工程]</a> <a>[生物信息学]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link" href="http://slxy.cqupt.edu.cn/">理学院</a>
							</h3>
							<a>[信息与计算科学]</a> <a>[数学与应用数学]</a> <a>[应用物理学]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link" href="http://jgxy.cqupt.edu.cn/">经济管理学院</a>
							</h3>
							<a>[电子商务]</a> <a>[信息管理与信息系统]</a> <a>[工商管理]</a> <a>[会计学]</a> <a>[市场营销]</a>
							<a>[经济学]</a> <a>[旅游管理]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link" href="http://cmys.cqupt.edu.cn/">传媒艺术学院</a>
							</h3>
							<a>[广播电视编导]</a> <a>[动画]</a> <a>[艺术设计]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link" href="http://cfl.cqupt.edu.cn/">外国语学院</a>
							</h3>
							<a>[英语]</a> <a>[翻译]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link"
									href="http://international.cqupt.edu.cn/">国际学院</a>
							</h3>
							<a href="">[英语(中加)]</a> <a href="">[电子信息工程(中美)]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link" href="http://law.cqupt.edu.cn/">法学院</a>
							</h3>
							<a>[法学]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link" href="http://marx.cqupt.edu.cn/">马克思主义学院</a>
							</h3>
							<a>[法学]</a>
						</div>

						<div class="xy">
							<h3>
								<a target="_blank" class="link" href="http://tyxy.cqupt.edu.cn/">体育学院</a>
							</h3>
							<a>[社会体育]</a>
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
