<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.Message" %>
<%
	String id=request.getParameter("pmid");
	if(id==null){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('未获取到id');");
		out.println("</script>");
		out.flush();
	}
	Message.updateMessageFlag(id);
	out.println("<script  type=\"text/javascript\"> ");
	out.println(" window.location.replace(\"pm.jsp\");");
	out.println("</script> ");
	
 %>