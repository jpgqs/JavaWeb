<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%
	User u=(User)session.getAttribute("user");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>硕士/博士学位授权学科</title>
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
                		<li><a href="">硕士/博士学位授权学科</a></li>
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
						<strong>学科建设</strong>
					</div>
					<ul class="cdlist">
						<li><a href="subjectinfo.jsp">简介</a></li>
                		<li><a href="">硕博学位授权学科</a></li>
                		<li><a href="impsubject.jsp">省部级重点学科</a></li>
					</ul>
					
				</div>
			</div>

			<div class="rightbox">
				<h2>学科建设 > 硕博学位授权学科</h2>
				<div class="detail">
					<div class="subject">
						<p class="w650">我校在工学门类有2个博士学位授权一级学科；硕士学位授权学科覆盖法学、理学、工学和管理学四个门类，有12个一级学科（覆盖35个二级学科）、3个二级学科；3个硕士专业学位类别，其中工程硕士有8个招生领域。</p>
						<center>
							<p>博士学位授权学科</p>

                        <table style="width: 441.0pt" align="center" border="1" cellpadding="0" cellspacing="0" width="1176">
                            <tbody><tr align="center">
                                <td>学科门类</td>
                                <td>一级学科代码</td>
                                <td>一级学科名称</td>
                            </tr>
                            <tr align="center">
                                <td rowspan="2" width="22%">工学 </td>
                                <td>0810</td>
                                <td width="45%">信息与通信工程</td>
                            </tr>
                            <tr align="center">
                                <td>0812</td>
                                <td>计算机科学与技术 </td>
                            </tr>
                        </tbody></table>
                        <p>学术型硕士学位授权学科简表 </p>
                        <table style="width: 441.0pt" border="1" cellpadding="0" cellspacing="0" width="1176">
                            <tbody><tr>
                                <td width="168">学科门类 </td>
                                <td width="144">一级学科代码 </td>
                                <td width="312">一级学科名称 </td>
                                <td width="144">二级学科代码 </td>
                                <td width="408">二级学科名称 </td>
                            </tr>
                            <tr>
                                <td rowspan="6">03法学</td>
                                <td>0301</td>
                                <td>法学 </td>
                                <td>030106</td>
                                <td>诉讼法学 </td>
                            </tr>
                            <tr>
                                <td rowspan="5">0305*</td>
                                <td rowspan="5">马克思主义理论 </td>
                                <td>030501</td>
                                <td>马克思主义基本原理 </td>
                            </tr>
                            <tr>
                                <td>030502</td>
                                <td>马克思主义发展史 </td>
                            </tr>
                            <tr>
                                <td>030503</td>
                                <td>马克思主义中国化研究 </td>
                            </tr>
                            <tr>
                                <td>030504</td>
                                <td>国外马克思主义研究 </td>
                            </tr>
                            <tr>
                                <td>030505</td>
                                <td>思想政治教育 </td>
                            </tr>
                            <tr>
                                <td rowspan="10" width="168">07理学</td>
                                <td rowspan="8">0702*</td>
                                <td rowspan="8">物理学 </td>
                                <td>070201</td>
                                <td>理论物理 </td>
                            </tr>
                            <tr>
                                <td>070202</td>
                                <td>粒子物理与原子核物理 </td>
                            </tr>
                            <tr>
                                <td>070203</td>
                                <td>原子与分子物理 </td>
                            </tr>
                            <tr>
                                <td>070204</td>
                                <td>等离子体物理 </td>
                            </tr>
                            <tr>
                                <td>070205</td>
                                <td>凝聚态物理 </td>
                            </tr>
                            <tr>
                                <td>070206</td>
                                <td>声学 </td>
                            </tr>
                            <tr>
                                <td>070207</td>
                                <td>光学 </td>
                            </tr>
                            <tr>
                                <td>070208</td>
                                <td>无线电物理 </td>
                            </tr>
                            <tr>
                                <td rowspan="2">0711*</td>
                                <td rowspan="2">系统科学 </td>
                                <td>071101</td>
                                <td>系统理论 </td>
                            </tr>
                            <tr>
                                <td>071102</td>
                                <td>系统分析与集成 </td>
                            </tr>
                            <tr>
                                <td rowspan="20">08工学</td>
                                <td>0802</td>
                                <td>机械工程 </td>
                                <td>080202</td>
                                <td>机械电子工程 </td>
                            </tr>
                            <tr>
                                <td>0803*</td>
                                <td>光学工程 </td>
                                <td>080300</td>
                                <td>光学工程 </td>
                            </tr>
                            <tr>
                                <td rowspan="2">0804*</td>
                                <td rowspan="2">仪器科学与技术 </td>
                                <td>080401</td>
                                <td>精密仪器及机械 </td>
                            </tr>
                            <tr>
                                <td>080402</td>
                                <td>测试计量技术及仪器 </td>
                            </tr>
                            <tr>
                                <td>0808</td>
                                <td>电气工程 </td>
                                <td>080805</td>
                                <td>电工理论与新技术 </td>
                            </tr>
                            <tr>
                                <td rowspan="4">0809*</td>
                                <td rowspan="4">电子科学与技术 </td>
                                <td>080901</td>
                                <td>物理电子学 </td>
                            </tr>
                            <tr>
                                <td>080902</td>
                                <td>电路与系统 </td>
                            </tr>
                            <tr>
                                <td>080903</td>
                                <td>微电子学与固体电子学 </td>
                            </tr>
                            <tr>
                                <td>080904</td>
                                <td>电磁场与微波技术 </td>
                            </tr>
                            <tr>
                                <td rowspan="2">0810*</td>
                                <td rowspan="2">信息与通信工程 </td>
                                <td>081001</td>
                                <td>通信与信息系统 </td>
                            </tr>
                            <tr>
                                <td>081002</td>
                                <td>信号与信息处理 </td>
                            </tr>
                            <tr>
                                <td rowspan="5">0811*</td>
                                <td rowspan="5">控制科学与工程 </td>
                                <td>0811001</td>
                                <td>控制理论与控制工程 </td>
                            </tr>
                            <tr>
                                <td>081102</td>
                                <td>检测技术与自动化装置 </td>
                            </tr>
                            <tr>
                                <td>081103</td>
                                <td>系统工程 </td>
                            </tr>
                            <tr>
                                <td>081104</td>
                                <td>模式识别与智能系统 </td>
                            </tr>
                            <tr>
                                <td>081105</td>
                                <td>导航、制导与控制 </td>
                            </tr>
                            <tr>
                                <td rowspan="3">0812*</td>
                                <td rowspan="3">计算机科学与技术 </td>
                                <td>081201</td>
                                <td>计算机系统结构 </td>
                            </tr>
                            <tr>
                                <td>081202</td>
                                <td>计算机软件与理论 </td>
                            </tr>
                            <tr>
                                <td>081203</td>
                                <td>计算机应用技术 </td>
                            </tr>
                            <tr>
                                <td>0831*</td>
                                <td>生物医学工程 </td>
                                <td>083100</td>
                                <td>生物医学工程 </td>
                            </tr>
                            <tr>
                                <td> </td>
                                <td>0835*</td>
                                <td>软件工程 </td>
                                <td>083500</td>
                                <td>软件工程 </td>
                            </tr>
                            <tr>
                                <td width="168">12管理学</td>
                                <td>1201*</td>
                                <td>管理科学与工程 </td>
                                <td>120100</td>
                                <td>管理科学与工程 </td>
                            </tr>
                            <tr>
                                <td colspan="5">（注：代码带“*”的一级学科为硕士学位一级学科授权点。）</td>
                            </tr>
                        </tbody></table>
                                                
                        <p>硕士专业学位类别及领域</p>
                         <table style="width: 441.0pt" align="center" border="1" cellpadding="0" cellspacing="0" width="1176">
                            <tbody><tr align="center">
                                <td width="33%">类别</td>
                                <td width="33%">领域代码</td>
                                <td width="33%">领域名称</td>
                            </tr>
                            <tr align="center">
                                <td rowspan="8">工程硕士</td>
                                <td>085208</td>
                                <td>电子与通信工程</td>
                            </tr>
                            <tr align="center">
                                <td>085209</td>
                                <td>集成电路工程</td>
                            </tr>
                            <tr align="center">
                                <td>085210</td>
                                <td>控制工程</td>
                            </tr>
                            <tr align="center">
                                <td>085211</td>
                                <td>计算机技术</td>
                            </tr>
                            <tr align="center">
                                <td>085212</td>
                                <td>软件工程</td>
                            </tr>
                            <tr align="center">
                                <td>085236</td>
                                <td>工业工程</td>
                            </tr>
                            <tr align="center">
                                <td>085239</td>
                                <td>项目管理</td>
                            </tr>
                            <tr align="center">
                                <td>085240</td>
                                <td>物流工程</td>
                            </tr>
                            <tr align="center">
                                <td>艺术硕士</td>
                                <td>135100</td>
                                <td>　</td>
                            </tr>
                            <tr align="center">
                                <td>翻译硕士</td>
                                <td>055100</td>
                                <td>　</td>
                            </tr>
                        </tbody></table>
                    
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
