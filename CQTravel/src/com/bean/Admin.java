package com.bean;

import com.dao.AdminBPO;

public class Admin {

	private String passport;
	private String password;
	private int valid;
	
	private static AdminBPO adminBPO=new AdminBPO();
	
	/**
	 * @return the passport
	 */
	public String getPassport() {
		return passport;
	}
	/**
	 * @param passport the passport to set
	 */
	public void setPassport(String passport) {
		this.passport = passport;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the valid
	 */
	public int getValid() {
		return valid;
	}
	/**
	 * @param valid the valid to set
	 */
	public void setValid(int valid) {
		this.valid = valid;
	}
	
	public static Admin login(String passport,String password) throws Exception{
		return adminBPO.login(passport,password);
	}
}
