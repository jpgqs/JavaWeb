package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.User;
import com.bean.UserInfo;

import net.sf.json.JSONObject;

public class PersonalInfoServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3L;

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JSONObject resultJson=new JSONObject();
		
		String type=request.getParameter("type");
		
		if("alterpwd".equals(type)){
			String username=request.getParameter("username");
			String oldpassword=request.getParameter("oldpassword");
			String newpassword=request.getParameter("newpassword");
			try {
				User.alterpwd(username, oldpassword, newpassword);
				resultJson.put("flag", 1);
				User u=User.getUserById(username);
				request.getSession().removeAttribute("user");
				request.getSession().setAttribute("user", u);
				
			} catch (Exception e) {
				resultJson.put("flag", 0);
				resultJson.put("errorinfo", e.getMessage());
			}
		}else if("addemail".equals(type)){
			String username=request.getParameter("username");
			String email=request.getParameter("email");
			try {
				UserInfo us=UserInfo.addEmail(username,email);
				resultJson.put("flag", 1);
				
				User u=(User)request.getSession().getAttribute("user");
				u.setProperty(us);
			} catch (Exception e) {
				resultJson.put("flag", 0);
				resultJson.put("errorinfo", e.getMessage());
			}
		}else if("addphone".equals(type)){
			String username=request.getParameter("username");
			String phone=request.getParameter("phone");
			try {
				UserInfo us=UserInfo.addPhone(username,phone);
				resultJson.put("flag", 1);
				
				User u=(User)request.getSession().getAttribute("user");
				u.setProperty(us);
			} catch (Exception e) {
				resultJson.put("flag", 0);
				resultJson.put("errorinfo", e.getMessage());
			}
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println(resultJson);
		out.flush();
		out.close();
	}
	
	

}
