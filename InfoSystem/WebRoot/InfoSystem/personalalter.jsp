<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.Student" %>
<%
	String id=request.getParameter("id");
	String phone=request.getParameter("phone");
	String emphone=request.getParameter("emphone");
	String qq=request.getParameter("qq");
	String email=request.getParameter("email");
	String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"utf-8");
	
	try{
		Student.alterContact(id, phone, emphone, qq, email, address);
		out.println("<script type=\"text/javascript\">");
		out.println("alert('联系方式修改成功');");
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
	out.println(" window.location.replace(\"personalpage.jsp\");");
	out.println("</script> ");
 %>
