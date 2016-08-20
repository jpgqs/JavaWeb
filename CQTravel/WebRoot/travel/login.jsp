<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.User" %>
<%
	String username=request.getParameter("lpassport");
	String password=request.getParameter("lpassword");
	if(username==null||password==null){
		username=request.getParameter("passport");
		password=request.getParameter("password");
	}

	User u=null;
	try{
		u=User.login(username, password);
	}catch(Exception e){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('"+e.getMessage()+"');");
		out.println("</script>");
	}
	if(u!=null){
		session.setAttribute("user", u);
		//session.setMaxInactiveInterval(1800);
		response.sendRedirect("../index.jsp");
	}
 %>

