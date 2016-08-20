<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%
	User u=(User)session.getAttribute("user");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>科研成果</title>
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
                		<li><a href="degreeinfo.jsp">硕士/博士学位授权学科</a></li>
                		<li><a href="impsubject.jsp">省部级重点学科</a></li>
           			</ul>
				</li>
				<li>
					<a href="scientific.jsp">科学研究</a>
					<ul class="menu-inner">
                		
                		<li><a href="scientific.jsp">科研机构</a></li>
                		<li><a href="">科研成果</a></li>
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
						<strong>科学研究</strong>
					</div>
					<ul class="cdlist">
						<li><a href="scientific.jsp">科研机构</a></li>
                		<li><a href="">科研成果</a></li>
                		<li><a href="http://journal.cqupt.edu.cn/jcuptnse/index.aspx" target="_blank">学术刊物</a></li>
                		<li><a href="http://cxy.cqupt.edu.cn/portal.php" target="_blank">产学研</a></li>
                		<li><a href="http://skc.cqupt.edu.cn/" target="_blank">社科在线</a></li>
                		<li><a href="http://202.202.32.194/" target="_blank">科技在线</a></li>
					</ul>
					
				</div>
			</div>

			<div class="rightbox">
				<h2>科学研究 > 科研成果</h2>
				<div class="detail">
					<div class="achievements">
						
						<div class="info1">
                            <h3>科研平台与机构</h3>
                            <p>重庆邮电大学在移动通信、光通信及光互联网、计算机科学与技术、汽车电子和工业自动控制、管理及社会科学方面取得了丰硕的成果，并形成了自主创新的知识产权特色。近五年，学校承担了包括国家科技重大专项、973前期专项、863计划、国家自然科学基金重点项目在内的国家及省部级科研项目500余项；荣获国家及省部级科研成果奖80余项，其中，连续5年荣获国家科学技术奖7项，连续5年获重庆市科学技术一等奖7项。科研投入和成果主要科技工作指标进入全国高校百强之列。 </p>
                
                		</div>


                		<div class="info2">
                            <h1 class="xinxibg">国家科学技术奖</h1>
                            <ul>
                                <li>1978年全国科学大会奖</li>
                                <li>1993年国家科学技术进步二等奖</li>
                                <li>2003年国家科学技术进步二等奖</li>
                                <li>2005年中国高等学校十大科技进展奖</li>
                                <li>2007年国家科学技术进步二等奖</li>
                                <li>2008年国家技术发明二等奖</li>
                                <li>2009年国家技术发明二等奖</li>
                                <li>2009年国家科学技术进步二等奖</li>
                                <li>2010年国家科学技术进步二等奖</li>
                                <li>2011年两项国家科技进步二等奖</li>
                            </ul>
                		</div>

                		<div class="info2">
                    		
                            <h1 class="xinxibg">自然科学省部级科学技术奖</h1>
                            <ul>
                                <li>自然科学省部级科学技术奖</li>
                                <li>重庆市自然科学奖</li>
                                <li>重庆市技术发明奖</li>
                                <li>重庆市科技进步奖</li>
                            </ul>
                
                		</div>
                		

                        <div class="info2 ">
                            <h1 class="xinxibg">教育部高等学校社会科学研究优秀成果奖</h1>
                            <ul>
                                <li>2009年社会科学成果获奖</li>
                            </ul>
                        </div>

                        <div class="info2 ">
                            <h1 class="xinxibg">社会科学省部级优秀成果奖</h1>
                            <ul>
                                <li>社会科学省部级优秀成果奖</li>
                                <li>2011年社会科学成果获奖</li>
                                <li>2010年社会科学成果获奖</li>
                            </ul>
                        </div>    

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
