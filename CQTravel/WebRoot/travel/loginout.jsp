<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
	session.removeAttribute("user");
	response.sendRedirect("../index.jsp");
 %>
