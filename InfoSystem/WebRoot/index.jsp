<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%@ page import="com.bean.Notice" %>
<%@ page import="com.bean.News" %>
<%@ page import="java.lang.Exception" %>
<%
	ArrayList<News> newsl=null;
	ArrayList<Notice> nl=null;
	User u=(User)session.getAttribute("user");
	News firstnews=null;
	try{
		newsl=News.getNewsList(6);
		nl=Notice.getNoticeList();
		firstnews=News.getFirstNews();
	}catch(Exception e){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('"+e.getMessage()+"');");
		out.println("</script>");
	}
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>学生在线信息系统</title>
    

	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript" src="js/page.js"></script>
	<script type="text/javascript">
		window.onload=function(){
			menufocus();
			chg();
		}
	</script>

  </head>
  
  <body>
	<div id="header">
		<div class="wrap">
			<div id="top"></div>
			<div class="bg"></div>
			<div class="login">
				
				<span><a href="InfoSystem/<%=u==null?"resetpwd.jsp":"alterpwd.jsp" %>"><%=u==null?"找回密码":"修改密码" %></a></span>
				<span>  |  </span>
				<span><a href="InfoSystem/<%=u==null?"login.jsp":"loginout.jsp" %>"><%=u==null?"登录":"注销" %></a></span>
				
			</div>
			<div>
				<img id="logo" src="images/logo.png">
				<img id="motto" src="images/motto.png">
			</div>
		</div>
		
	</div>

	<div class="menu" id="nav">
		<div class="wrap">
			<ul>
				<li><a href="">首页</a>
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
					<a href="InfoSystem/teacherinfo.jsp">师资队伍</a>
					<ul class="menu-inner">
                		
                		<li><a href="InfoSystem/teacherinfo.jsp">师资概况</a></li>
                		<li><a href="InfoSystem/teacherlist.jsp">部分师资</a></li>
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
					<a href="InfoSystem/scientific.jsp">科学研究</a>
					<ul class="menu-inner">
                		
                		<li><a href="InfoSystem/scientific.jsp">科研机构</a></li>
                		<li><a href="InfoSystem/achievements.jsp">科研成果</a></li>
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
					<a href="InfoSystem/enroll.jsp">招生就业</a>
					<ul class="menu-inner">
                		
                		<li><a href="InfoSystem/enroll.jsp">招生信息</a></li>
                		<li><a href="http://job.cqupt.edu.cn/" target="_blank">就业信息</a></li>
           			</ul>
				</li>
				<li>
					<a href="InfoSystem/campusview.jsp">校园文化</a>
					<ul class="menu-inner">
                		
                		<li><a href="http://202.202.43.36:8080" target="_blank">大学生文化素..</a></li>
                		<li><a href="InfoSystem/campusview.jsp">校园风光</a></li>
                		<li><a href="https://redrock.cqupt.edu.cn/jsns/" target="_blank">学生活动</a></li>
           			</ul>
				</li>
				<li>
					<a href="InfoSystem/calendar.jsp">公共服务</a>
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

	<div id="pic">
		<div class="wrap">
			<img style="opacity:1;" class="pic-bg" src="images/pic1.jpg">
			<img class="pic-bg" src="images/pic2.jpg">
			<img class="pic-bg" src="images/pic3.jpg">
			<img class="pic-bg" src="images/pic4.jpg">
			<img class="pic-bg" src="images/pic5.jpg">
			<img class="pic-bg" src="images/pic6.jpg">
			<img class="pic-bg" src="images/pic7.jpg">
			<img class="pic-bg" src="images/pic8.jpg">
		</div>
	</div>
	<div id="content">
		<div class="wrap">

			<div class="left">

				<div class="news">
					<div class="title">
						<h2>重邮新闻</h2>
						<a class="more" href="">more</a>
					</div>

					<div class="detail">
						<a href="InfoSystem/news.jsp?id=<%=firstnews.getId() %>"><%=firstnews.getTitle() %></a>
						<%=firstnews.getContent() %>
					</div>

					<div class="news_list">
						<ul>
							<% if(newsl!=null&&newsl.size()>0) { 
									for(int i=0;i<newsl.size();i++){
										News news=newsl.get(i);
							%>
							<li>
								<a href="InfoSystem/news.jsp?id=<%=news.getId() %>"><span><%=news.getTitle() %></span><span class="time"><%=news.getDate().substring(5) %></span></a>
								
							</li>
							<%		}
								}else { 
							%>
								<li>
								<a href=""><span>暂无新闻</span><span class="time"></span></a>
								</li>
							<% 	} %>
						</ul>
					</div>
					
					
				</div>
				
				<div class="clear"></div>
				
				<div class="links">
					<div class="title">
						<h2>友情链接</h2>
						
					</div>
					
					<div class="detail">
						<a href="http://hongyan.cqupt.edu.cn/" target="_blank"><img alt="红岩网校" src="images/hywx.png"></a>
						<a href="http://172.22.161.11/" target="_blank"><img alt="BT Down铺" src="images/btdownpu.png"></a>
						<a href="http://bbs.cqupt.edu.cn/" target="_blank"><img alt="幽幽黄桷兰" src="images/yyhjl.png"></a>
						<a href="http://202.202.43.42/software/" target="_blank"><img alt="重邮软件中心" src="images/sf.png"></a>
						<a href="http://202.202.43.41/market/" target="_blank"><img alt="拾货" src="images/sh.png"></a>
						<a href="http://vod.cqupt.edu.cn/iptv" target="_blank"><img alt="重邮网络电视" src="images/tv.png"></a>
						<a href="http://cq.189.cn/college/newschool/index.htm" target="_blank"><img alt="宽带计费系统" src="images/net.png"></a>
						<a href="http://stu.cqupt.edu.cn" target="_blank"><img alt="学生邮箱系统" src="images/email.png"></a>
						<a href="http://weibo.com/redrockweekly" target="_blank"><img alt="红岩微博" src="images/wb.png"></a>
						<a href="http://open.163.com/" target="_blank"><img alt="网易公开课" src="images/wy.png"></a>
						<a href="http://www.cqcyit.com/" target="_blank"><img alt="重邮信科" src="images/xk.png"></a>
						<a href="http://xsc.cqupt.edu.cn/mind/" target="_blank"><img alt="心理辅导中心" src="images/xlfd.png"></a>
					</div>
				</div>
				
			</div>

			<div class="right">
				
				<div class="title">
					
						<h2>校务公告</h2>
						<a class="more" href="">more</a>
					
				</div>

				<div class="info_list">
						<ul>
							<% if(nl!=null&&nl.size()>0) { 
									for(int i=0;i<nl.size();i++){
										Notice n=nl.get(i);
							%>
							<li>
								<a href="InfoSystem/notice.jsp?id=<%=n.getId() %>"><span><%=n.getTitle() %></span><span class="time"><%=n.getDate().substring(5) %></span></a>
							</li>
							<%		}
								}else { 
							%>
								<li>
								<a href=""><span>暂无公告</span><span class="time"></span></a>
								</li>
							<% 	} %>
						</ul>
				</div>

			</div>
			
			

		</div>
		<div class="clear"></div>
	</div>


	<div id="footer">
		<span><a href="InfoSystem/contactadmin.jsp" style="color:white">联系管理员</a> | 重庆邮电大学 | 重庆市南岸区崇文路2号 | 400065 | <a href="admin/login.jsp">后台登录</a></span>
	</div>
</body>
</html>
