<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%
	User u=(User)session.getAttribute("user");
	if(u==null){
		out.println("<script  type=\"text/javascript\"> ");
		out.println(" alert('不存在有效session');");
		out.println(" window.location.replace(\"../index.jsp\");");
		out.println("</script> ");
		out.flush();
	}
 %>