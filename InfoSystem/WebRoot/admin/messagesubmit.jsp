<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.Message" %>
<%@ include file="_adminsessioncheck.jsp" %>
<%
	String sender=request.getParameter("operator");
	String recevier=request.getParameter("id");
	String content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"utf-8");
	
	
	try{
		Message.add(sender, recevier, content);
		out.println("<script type=\"text/javascript\">");
		out.println("alert('消息发布成功');");
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
	out.println(" window.location.replace(\"sendmessage.jsp\");");
	out.println("</script> ");
 %>
