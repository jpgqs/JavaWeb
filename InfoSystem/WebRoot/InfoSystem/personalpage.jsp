<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="_sessioncheck.jsp" %>
<%@ page import="com.bean.Student" %>
<%
	Student s=null;
	try{
		s=(Student)u.getProperty();
		if(s==null){
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
<title>Document</title>
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
						<li><a href="">个人信息</a></li>
						<li><a href="classpage.jsp">班级信息</a></li>
						<li><a href="lessonpage.jsp">选课信息</a></li>
						<li><a href="scorepage.jsp">考试成绩</a></li>
						<li><a href="scorelistpage.jsp">成绩总表</a></li>
						<li><a href="bookpage.jsp">教材信息</a></li>
						<li><a href="pm.jsp">我的通知</a></li>
					</ul>

				</div>
			</div>
			<%if(s!=null) { %>
			<div class="rightbox">
				<h2>个人中心 > 个人信息</h2>
				<div class="cztable">
				<form action="personalalter.jsp" method="post">
					<table width="100%" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td align="right" width="80px">姓名：</td>
								<td><%=s.getName()==null?"":s.getName() %>&nbsp;</td>
								<td align="right" width="90px">身份证号码：</td>
								<td><%=s.getIdcard()==null?"":s.getIdcard() %>&nbsp;</td>
								<td rowspan="9">
									<div align="center">
										<img id="pic_face" src="../images/photo.jpg"
											style="padding:2px 2px 5px; border:1px #ddd solid;"
											height="160" width="120">
									</div>&nbsp;
								</td>
							</tr>
							<tr>
								<td align="right">性别：</td>
								<td><%=s.getGender()==1?"男":"女" %>&nbsp;</td>
								<td align="right">学号：</td>
								<td name="id"><%=u.getId()==null?"":u.getId() %>&nbsp;</td>
							</tr>
							<tr>
								<td align="right">出生日期：</td>
								<td><%=s.getBirth()==null?"":s.getBirth() %>&nbsp;</td>
								<td align="right">学院：</td>
								<td><%=s.getAcademy()==null?"":s.getAcademy() %>&nbsp;</td>
							</tr>
							<tr>
								<td align="right">专业：</td>
								<td><%=s.getMajor()==null?"":s.getMajor() %>&nbsp;</td>
								<td align="right">第二专业：</td>
								<td><%=s.getSubmajor()==null?"":s.getSubmajor() %>&nbsp;</td>
							</tr>
							<tr>
								<td align="right">班级：</td>
								<td><%=s.getClasses()==null?"":s.getClasses() %>&nbsp;</td>
								<td align="right">第二专业班级：</td>
								<td><%=s.getSubclass()==null?"":s.getSubclass() %>&nbsp;</td>
							</tr>
							<tr>
								<td align="right">注册批次：</td>
								<td>2013&nbsp;</td>
								<td align="right">状态：</td>
								<td>在读&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:left;">联系方式（如联系方式有变动请及时修改，以便能及时联系到你。谢谢！）</td>
							</tr>
							<tr>
								<td align="right">手机号码：</td>
								<td><input type="text" name="phone" value="<%=s.getPhone()==null?"":s.getPhone() %>" /></td>
								<td align="right">紧急联系号码：</td>
								<td><input type="text" name="emphone" value="<%=s.getEmphone()==null?"":s.getEmphone() %>" /></td>
							</tr>
							<tr>
								<td align="right">QQ:</td>
								<td><input type="text" name="qq" value="<%=s.getQq()==null?"":s.getQq() %>" /></td>
								<td align="right">电子邮箱：</td>
								<td><input type="text" name="email" value="<%=s.getEmail()==null?"":s.getEmail() %>" /></td>
								<!-- <td width="120px"><span class="input-file">选择图片...<input type="file" name="file"></span></td> -->
							</tr>
							<tr>
								<td align="right">联系地址：</td>
								<td colspan="3"><input style="width:100%;" type="text" name="address" value="<%=s.getAddress()==null?"":s.getAddress() %>"/></td>
								<td width="120px"><input type="submit" value="提交修改"/></td>
							</tr>

						</tbody>
					</table>
				</form>
				</div>
			</div>
			<%} %>
		</div>

	</div>

	<div id="footer">
		<span>联系管理员 | 重庆邮电大学 | 重庆市南岸区崇文路2号 | 400065</span>
	</div>


</body>
</html>
