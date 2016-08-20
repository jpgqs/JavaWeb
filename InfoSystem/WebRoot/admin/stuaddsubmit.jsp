<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.Student" %>
<%@ include file="_adminsessioncheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String idcard=request.getParameter("idcard");
	int gender=Integer.parseInt(request.getParameter("sex"));
	String phone=request.getParameter("phone");
	String qq=request.getParameter("qq");
	String email=request.getParameter("email");
	String academy=request.getParameter("academy");
	String major=request.getParameter("major");
	String classes=request.getParameter("classes");
	String submajor=request.getParameter("submajor");
	String subclass=request.getParameter("subclass");
	String emcontact=request.getParameter("emcontact");
	String emphone=request.getParameter("emphone");
	String address=request.getParameter("address");
	
	Student s=new Student();
	s.setId(id);
	s.setName(name);
	s.setIdcard(idcard);
	s.setGender(gender);
	s.setPhone(phone);
	s.setQq(qq);
	s.setEmail(email);
	s.setAcademy(academy);
	s.setMajor(major);
	s.setClasses(classes);
	s.setSubmajor(submajor);
	s.setSubclass(subclass);
	s.setEmcontact(emcontact);
	s.setEmphone(emphone);
	s.setAddress(address);
	try{
		s.add();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('学生信息录入成功');");
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
		out.println(" window.location.replace(\"stuinfoadd.jsp\");");
		out.println("</script> ");
%>

