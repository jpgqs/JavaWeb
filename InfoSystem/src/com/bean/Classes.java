package com.bean;

import com.dao.ClassesBPO;

public class Classes {

	private String id;
	private String academy;
	private String major;
	/**
	 * @return the major
	 */
	public String getMajor() {
		return major;
	}
	/**
	 * @param major the major to set
	 */
	public void setMajor(String major) {
		this.major = major;
	}

	private String counselor;
	private String slogan;
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
	 * @return the academy
	 */
	public String getAcademy() {
		return academy;
	}
	/**
	 * @param academy the academy to set
	 */
	public void setAcademy(String academy) {
		this.academy = academy;
	}
	/**
	 * @return the counselor
	 */
	public String getCounselor() {
		return counselor;
	}
	/**
	 * @param counselor the counselor to set
	 */
	public void setCounselor(String counselor) {
		this.counselor = counselor;
	}
	/**
	 * @return the slogan
	 */
	public String getSlogan() {
		return slogan;
	}
	/**
	 * @param slogan the slogan to set
	 */
	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}
	
	public static Classes getClassById(String id) throws Exception{
		Classes c=ClassesBPO.getClassById(id);
		return c;
	}
}
