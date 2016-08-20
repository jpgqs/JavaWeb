<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%
	User u=(User)session.getAttribute("user");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>师资概况</title>
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
				<span><a href="<%=u==null?"resetpwd.jsp":"alterpwd.jsp" %>"><%=u==null?"找回密码":"修改密码" %></a></span>
				<span>  |  </span>
				<span><a href="<%=u==null?"login.jsp":"loginout.jsp" %>"><%=u==null?"登录":"注销" %></a></span>
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
					<li><a href="personalpage.jsp">个人中心</a></li>
				<% } %>
				<li>
					<a href="schoolinfo.jsp">学校概况</a>
					<ul class="menu-inner">
                		
                		<li><a href="schoolinfo.jsp">学校简介</a></li>
                		<li><a href="academypage.jsp">学院导航</a></li>
                		<li><a href="majorpage.jsp">学校机构</a></li>
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
						<strong>师资队伍</strong>
					</div>
					<ul class="cdlist">
						<li><a href="">师资概况</a></li>
						
						<li><a href="teacherlist.jsp">部分师资</a></li>
					</ul>
					
				</div>
			</div>

			<div class="rightbox">
				<h2>师资队伍 > 师资概况</h2>
				<div class="detail">
					<p>学校高度重视师资队伍建设，按照“培养骨干、吸纳尖子、优化结构、提高素质”的工作方针，坚持培养和引进并重，建立健全人才队伍评价激励机制，深化人事制度改革，使学校教师数量、职称结构、学历结构、年龄结构、学缘结构等日趋得到改善。</p>
					<p>学校在职教职工 1600 余人，具有正高级职称160 余人、副高级职称近400人；具有博士学位200余人、硕士学位620余人；博士生导师24人、硕士生导师400余人。同时学校还聘请了中国科学院、中国工程院和英国、加拿大、美国、波兰、印度等国20 余名院士及100余位知名专家为我校兼职教授或名誉教授，我校校友、中国工程院原副院长邬贺铨院士为我校名誉校长、第一届校董事会主席。</p>
					<p>教师队伍中有 “新世纪百千万人才工程”国家级人选1人；教育部“新世纪优秀人才支持计划” 人选6人；教育部“动漫（游戏）原创技术团队扶持计划”人选2人；获得“全国优秀教师”、“全国模范教师”、“全国师德先进个人”等国家级荣誉称号8人；重庆市学术技术带头人及后备人选30人；重庆市有突出贡献的中青年专家2人；重庆市322重点人才工程第二层次人选8人；重庆市高校中青年骨干教师33人；获得“重庆市杰出青年科学基金”资助2人；受聘“重庆市高校巴渝学者特聘教授” 4人；入选“重庆市优秀人才支持计划”4人；获得国务院政府特殊津贴21人；获得“重庆市名师奖”、“重庆市优秀教师”等部市级荣誉称号20余人；</p>
					<p>学校建成“计算机软件教学部”国家级教学团队1个，建成“通信与网络技术教学部”、“测控技术与仪器教学部”、“软件教学部”、“通信与信息教学团队”、“大学物理”、“计算机控制课程群教学团队”、“通信原理课程教学团队”、“数学建模与数学实验教学团队”、“移动通信教学团队”、“测控技术实验中心”等重庆市教学团队10个。建成“移动通信技术的研究与应用”、“网络化控制系统理论，技术及其应用”、“汽车电子与嵌入式系统理论、技术及应用”、“智能信息处理”、“理论物理”等重庆市高校科技创新团队5个。“计算机科学与技术研究所”、 “通信网与测试技术实验室”、“ 网络控制技术青年群体”分别当选2002年、2006年、2010年“重庆市十大杰出青年群体”。</p>
					<p>学校将继续实施“以人为本、人才强校”的师资队伍建设战略，加强领导，完善措施，解放思想，创新机制，营造环境，造就一支结构合理、素质优良、队伍稳定、适应高水平教学研究型大学要求和富于创新能力的师资队伍。 </p>
					
				</div>
			</div>
		</div>
		
	</div>

	<div id="footer">
		<span>联系管理员 | 重庆邮电大学 | 重庆市南岸区崇文路2号 | 400065</span>
	</div>

  </body>
</html>
