package com.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bean.User;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	private String idcard;
	private HttpServletRequest request;

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getIdcard() {
		return idcard;
	}
	
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	
	@Override
	public String execute() throws Exception {
		User u=null;
		try {
			u=User.login(this.username,this.password);
		} catch (Exception e) {
			String errorMsg=e.getMessage();
			this.request.setAttribute("error", errorMsg);
			return ERROR;
		}
		
		if(u!=null){
			HttpSession session=this.request.getSession();
			session.setAttribute("user", u);
			session.setMaxInactiveInterval(1800);
		}
		
		return SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
	
	public String reset() throws Exception {
		User u=null;
		String msg;
		try{
			u=User.reset(username, idcard);
			if(u!=null){
				msg="登录密码已重置为身份证后六位";
				idcard=username="";
			}else{
				msg="请不要输入空格";
			}
		}catch(Exception e){
			msg=e.getMessage();
		}
		request.setAttribute("msg", msg);
		return SUCCESS;
	}
	 

}
