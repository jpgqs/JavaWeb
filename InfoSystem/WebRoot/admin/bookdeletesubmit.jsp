<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.Book" %>
<%@ include file="_adminsessioncheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	
	try{
		Book.delete(id);
		out.println("<script type=\"text/javascript\">");
		out.println("alert('教材信息删除成功');");
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
		out.println(" window.location.replace(\"bookdelete.jsp\");");
		out.println("</script> ");
%>

