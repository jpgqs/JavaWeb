<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%	
	session.removeAttribute("user");
	response.sendRedirect("../index.jsp");
 %>

