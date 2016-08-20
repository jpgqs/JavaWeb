package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Admin;
import com.bean.User;

import net.sf.json.JSONObject;

public class LoginServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}


	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		JSONObject resultJson=new JSONObject();
		String type=request.getParameter("type");
		if("islogin".equals(type)){
			User u=(User)request.getSession().getAttribute("user");
			if(u!=null){
				resultJson.put("flag", 1);
			}else{
				resultJson.put("flag", 0);
			}
		}else if("admin".equals(type)){
			String username=request.getParameter("passport");
			String password=request.getParameter("password");
			try {
				Admin admin=Admin.login(username, password);
				request.getSession().setAttribute("admin", admin);
				resultJson.put("loginflag", 1);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("loginflag", 0);
				resultJson.put("errorinfo", e.getMessage());
			}
			
		}else if("adminout".equals(type)){
			
				request.getSession().removeAttribute("admin");
				resultJson.put("flag", 1);
			
		}else{
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			//System.out.println(username+"::"+password);
			
			try{
				User u=User.login(username, password);
				request.getSession().setAttribute("user", u);
				resultJson.put("loginflag", 1);
			}catch(Exception e){
				resultJson.put("loginflag", 0);
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
