<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.Book" %>
<%@ page import="com.bean.User" %>
<%
	User u=(User)session.getAttribute("user");
	String id=request.getParameter("bookid");
	if(id==null){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('未获取到id');");
		out.println("</script>");
		out.flush();
	}
	Book.updateBookFlag(u.getId(), id);
	out.println("<script  type=\"text/javascript\"> ");
	out.println(" window.location.replace(\"bookpage.jsp\");");
	out.println("</script> ");
	
 %>