package com.bean;

import java.util.Date;

import com.dao.UserBPO;

public class User {
	
	private String id;//±àºÅ
	private String password;//µÇÂ¼ÃÜÂë
	private Date regdate;//×¢²áÊ±¼ä
	
	private UserInfo property;
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @return the regdate
	 */
	public Date getRegdate() {
		return regdate;
	}
	/**
	 * @param regdate the regdate to set
	 */
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	/**
	 * @return the property
	 */
	public UserInfo getProperty() {
		return property;
	}
	/**
	 * @param property the property to set
	 */
	public void setProperty(UserInfo property) {
		this.property = property;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	public static User login(String user,String pwd) throws Exception{
		User u=UserBPO.loginCheck(user,pwd);
		return u;
	}
	
	public static User login(User user) throws Exception{
		User u=UserBPO.loginCheck(user.getId(),user.getPassword());
		return u;
	}
	
	public static User reset(String user,String id) throws Exception {
		User u=UserBPO.resetCheck(user, id);
		return u;
	}
	
	public User alterpwd(String oldpwd,String newpwd) throws Exception {
		User u=UserBPO.alterPwd(id,oldpwd,newpwd);
		return u;
	}
	
	public static void main(String[] args) throws Exception {
		User u=User.login("2012211685", "111111");
	}
	
}
