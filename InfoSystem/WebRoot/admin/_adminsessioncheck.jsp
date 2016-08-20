<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
	Object o=session.getAttribute("admin");
	if(o==null){
		out.println("<script  type=\"text/javascript\"> ");
		out.println(" alert('不存在有效session');");
		out.println(" window.location.replace(\"login.jsp\");");
		out.println("</script> ");
		out.flush();
	}
 %>

