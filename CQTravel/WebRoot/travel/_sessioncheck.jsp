<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%
	User u=(User)session.getAttribute("user");
	if(u==null){
		out.println("<script  type=\"text/javascript\"> ");
		out.println(" alert('您还未登录或登录已超时');");
		//out.println(" history.go(-1);");
		out.println(" if(location.href.indexOf('q')!=-1) {");
		out.println(" window.history.back();}else{");
		out.println(" window.opener=null;window.close();}");
		//out.println(" window.location.replace(\"../index.jsp\");");
		out.println("</script> ");
		out.flush();
	}
 %>