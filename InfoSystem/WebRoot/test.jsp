<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'test.jsp' starting page</title>
    
  </head>
  
  <body>
    <%! int r=1;
    	int getDiameter(int r){
    		return r*2;
    	}
    	double getPerimeter(int r){
			return 2*r*3.14;    	
    	}
    	double getArea(int r){
    		return r*r*3.14;
    	}
      %>
            �뾶��<%=r %><br>
 	 ֱ����<%=getDiameter(r) %><br>
  	�ܳ���<%=getPerimeter(r) %><br>
  	�����<%=getArea(r) %><br>
  	<h1>SessionId</h1>
  	<%=session.getId() %>    
  </body>
</html>
