<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.Notice" %>
<%@ include file="_adminsessioncheck.jsp" %>
<%
	String title=new String(request.getParameter("title").getBytes("ISO-8859-1"),"utf-8");
	String content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"utf-8");
	
	System.out.println(title);
	System.out.println(content);
	System.out.println(content.length());
	if(content.length()>65536){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('公告内容长度超过最大限制');");
		out.println("history.back();");
		out.println("</script>");
		out.flush();
	}
	
	try{
		Notice.add(title, content);
		
		out.println("<script type=\"text/javascript\">");
		out.println("alert('公告发布成功');");
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
	out.println(" window.location.replace(\"noticerelease.jsp\");");
	out.println("</script> ");
	
%>

