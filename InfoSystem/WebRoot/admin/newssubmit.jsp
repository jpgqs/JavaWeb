<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.News" %>
<%@ include file="_adminsessioncheck.jsp" %>
<%
	String title=new String(request.getParameter("title").getBytes("ISO-8859-1"),"utf-8");
	String content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"utf-8");
	
	System.out.println(title);
	System.out.println(content);
	System.out.println(content.length());
	if(content.length()>65536){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('新闻内容长度超过最大限制');");
		out.println("history.back();");
		out.println("</script>");
		out.flush();
	}
	
	try{
		News.add(title, content);
		out.println("<script type=\"text/javascript\">");
		out.println("alert('新闻发布成功');");
		out.println("</script>");
		out.flush();
		
	}catch (Exception e) {
		out.println("<script type=\"text/javascript\">");
		out.println("alert('"+e.getMessage()+"');");
		out.println("history.back();");
		out.println("</script>");
		out.flush();
		
	}
	out.println("<script  type=\"text/javascript\"> ");
	out.println(" window.location.replace(\"newsrelease.jsp\");");
	out.println("</script> ");
	
%>

