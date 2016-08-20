<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.Book" %>
<%@ include file="_adminsessioncheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	
	String publisher=request.getParameter("publisher");
	String author=request.getParameter("author");
	double price=Double.parseDouble(request.getParameter("price"));
	
	Book b=new Book();
	b.setId(id);
	b.setName(name);
	b.setPublisher(publisher);
	b.setAuthor(author);
	b.setPrice(price);
	
	try{
		b.add();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('教材信息录入成功');");
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
		out.println(" window.location.replace(\"bookadd.jsp\");");
		out.println("</script> ");
%>

