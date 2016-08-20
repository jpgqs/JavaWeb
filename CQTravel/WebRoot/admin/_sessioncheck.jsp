<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.Admin" %>
<%
	Admin admin=(Admin)session.getAttribute("admin");
	if(admin==null){
		out.println("<script  type=\"text/javascript\"> ");
		out.println(" alert('您还未登录或登录已超时');");
		out.println(" window.location.replace(\"/CQTravel/admin\");");
		out.println("</script> ");
		out.flush();
	}
 %>