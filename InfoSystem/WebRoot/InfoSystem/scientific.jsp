<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%
	User u=(User)session.getAttribute("user");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>科研机构</title>
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
					<a href="">科学研究</a>
					<ul class="menu-inner">
                		
                		<li><a href="">科研机构</a></li>
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
						<strong>科学研究</strong>
					</div>
					<ul class="cdlist">
						<li><a href="">科研机构</a></li>
                		<li><a href="achievements.jsp">科研成果</a></li>
                		<li><a href="http://journal.cqupt.edu.cn/jcuptnse/index.aspx" target="_blank">学术刊物</a></li>
                		<li><a href="http://cxy.cqupt.edu.cn/portal.php" target="_blank">产学研</a></li>
                		<li><a href="http://skc.cqupt.edu.cn/" target="_blank">社科在线</a></li>
                		<li><a href="http://202.202.32.194/" target="_blank">科技在线</a></li>
					</ul>
					
				</div>
			</div>

			<div class="rightbox">
				<h2>科学研究 > 科学研究</h2>
				<div class="detail">
					<div class="scientific">
						
						<div class="info1">
                    		<h3>科研平台与机构</h3>
                    		<p>重庆邮电大学在移动通信、光通信及光互联网、计算机科学与技术、汽车电子和工业自动控制、管理及社会科学方面取得了丰硕的成果，并形成了自主创新的知识产权特色。近五年，学校承担了包括国家科技重大专项、973前期专项、863计划、国家自然科学基金重点项目在内的国家及省部级科研项目500余项；荣获国家及省部级科研成果奖80余项，其中，连续5年荣获国家科学技术奖7项，连续5年获重庆市科学技术一等奖7项。科研投入和成果主要科技工作指标进入全国高校百强之列。</p>
                		</div>


                		<div class="info2">
                			
                    		<h1>自然科学</h1>
                    		<h2> 科研平台</h2>
                    		<ul>
                       			<li><a href="javascript:void">无线移动通信研发平台</a></li>
                        		<li><a href="javascript:void">宽带通信网研发平台</a></li>
                        		<li><a href="javascript:void">信号与信息处理研发平台</a></li>
                        		<li><a href="javascript:void">电磁场与电工新技术研发平台</a></li>
                        		<li><a href="javascript:void">计算机系统与网络研发平台</a></li>
                        		<li><a href="javascript:void">智能信息处理研发平台</a></li>
                        		<li><a href="javascript:void">空间信息与数据库研发平台</a></li>
                        		<li><a href="javascript:void">图形图像与多媒体研发平台</a></li>
                        		<li><a href="javascript:void">信息安全研发平台</a></li>
                        		<li><a href="javascript:void">网络化控制理论与技术平台</a></li>
                        		<li><a href="javascript:void">机电系统控制与检测研发平台</a></li>
                        		<li><a href="javascript:void">模式识别与智能系统研发平台</a></li>
                        		<li><a href="javascript:void">光电系统与新材料研发平台</a></li>
                        		<li><a href="javascript:void">微电子研发平台</a></li>
                        		<li><a href="javascript:void">电路与系统研发平台</a></li>
                        		<li><a href="javascript:void">生物医学工程研发平台</a></li>
                        		<li><a href="javascript:void">生物信息与制药工程研发平台</a></li>
                        		<li><a href="javascript:void">量子物理研究平台</a></li>
                        		<li><a href="javascript:void">系统科学研究平台</a></li>
                        		<li><a href="javascript:void">通信运营与管理工程研究平台</a></li>
                        		<li><a href="javascript:void">信息产业与网络经济研究平台</a></li>
                        		<li><a href="javascript:void">软件工程研发平台 </a></li>
                        		<li><a href="javascript:void">泛在网/物联网技术研发平台</a></li>
                        		<li><a href="javascript:void">信息无障碍工程研发平台</a></li>
                    		</ul>
                    		<div class="clear"></div>
                    		<h2>省部级以上科研机构</h2>
                    		<ul class="big">
                        		<li><a href="javascript:void">移动通信终端与网络控制国家地方联合工程中心</a></li>
                        		<li><a href="javascript:void">国家3G军民结合终端设备动员中心</a></li>
                        		<li><a href="javascript:void">移动通信教育部工程研究中心</a></li>
                        		<li><a href="javascript:void">工业物联网与网络化控制教育部重点实验室</a></li>
                        		<li><a href="javascript:void">移动通信技术重庆市重点实验室</a></li>
                        		<li><a href="javascript:void">信号与信息处理重庆市重点实验室</a></li>
                        		<li><a href="javascript:void">重庆高校市级移动通信技术重点实验室</a></li>
                        		<li><a href="javascript:void">重庆高校市级计算机网络与通信技术重点实验室</a></li>
                        		<li><a href="javascript:void">重庆高校市级光纤通信技术重点实验室</a></li>
                        		<li><a href="javascript:void">重庆高校市级微电子工程重点实验室</a></li>
                        		<li><a href="javascript:void">重庆高校市级网络控制技术与智能仪器仪表实验室</a></li>
                        		<li><a href="javascript:void">重庆高校市级电子商务与现代物流重点实验室</a></li>
                        		<li><a href="javascript:void">移动通信技术信产部重点实验室</a></li>
                        		<li><a href="javascript:void">计算机网络通信技术信产部重点实验室</a></li>
                    		</ul>
                
                		</div>
                		<div class="clear"></div>

                		<div class="info2">
                    		<h1>人文社会科学</h1>
                    		<h2>社会科学科研平台</h2>
                    		<ul class="big">
                        		<li><a href="javascript:void">马克思主义理论与网络社会发展研究平台  </a></li>
                        		<li><a href="javascript:void">信息法学研究平台</a></li>
                        		<li><a href="javascript:void">影视传媒研究平台    </a></li>
                        		<li><a href="javascript:void">外国语文与信息传播研究平台</a></li>
                        		<li><a href="javascript:void">社会体育科学研究基地   </a></li>
                        		<li><a href="javascript:void">大学生发展与职业生涯规划研究平台</a></li>
                   			</ul>
                		</div>
                		<div class="clear"></div>

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
