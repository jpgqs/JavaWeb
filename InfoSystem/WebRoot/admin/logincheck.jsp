<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.lang.Exception" %>
<%@ page import="com.bean.Teacher" %>
<%@ page import="com.bean.Administrator" %>
<%
	String type=request.getParameter("type");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	try{
		if("teacher".equals(type)){
			Teacher t=Teacher.login(username, password);
			
		}
		if("administrator".equals(type)){
			Administrator admin=Administrator.login(username, password);
			if(admin!=null){
				session.setAttribute("admin", admin);
				session.setMaxInactiveInterval(1800);
				response.sendRedirect("index.jsp");
			}
			
		}else{
		out.println("<script type=\"text/javascript\">");
		out.println("alert('登录类型错误');");
		out.println("</script>");
		response.sendRedirect("login.jsp");
		}
	}catch(Exception e){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('"+e.getMessage()+"');");
		out.println("history.back();");
		out.println("</script>");
		
	}
 %>

