package com.bean;


import java.util.ArrayList;
import java.util.Date;

import com.dao.StudentBPO;
import com.util.hibernate.DataStore;

public class Student extends UserInfo{

	private String id;
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

	private String name;
	private int gender;
	private String birth;
	private String idcard;
	private String phone;
	private String qq;
	private String email;
	private String academy;
	private String major;
	private String classes;
	private String submajor;
	private String subclass;
	private String emcontact;
	private String emphone;
	private String address;
	private int semester;
	private Date enrollmentDate;
	/**
	 * @return the enrollmentDate
	 */
	public Date getEnrollmentDate() {
		return enrollmentDate;
	}
	/**
	 * @param enrollmentDate the enrollmentDate to set
	 */
	public void setEnrollmentDate(Date enrollmentDate) {
		this.enrollmentDate = enrollmentDate;
	}
	/**
	 * @return the semester
	 */
	public int getSemester() {
		return semester;
	}
	/**
	 * @param semester the semester to set
	 */
	public void setSemester(int semester) {
		this.semester = semester;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the gender
	 */
	public int getGender() {
		return gender;
	}
	/**
	 * @param gender the gender to set
	 */
	public void setGender(int gender) {
		this.gender = gender;
	}
	/**
	 * @return the birth
	 */
	public String getBirth() {
		return birth;
	}
	/**
	 * @param birth the birth to set
	 */
	public void setBirth(String birth) {
		this.birth = birth;
	}
	/**
	 * @return the idcard
	 */
	public String getIdcard() {
		return idcard;
	}
	/**
	 * @param idcard the idcard to set
	 */
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the qq
	 */
	public String getQq() {
		return qq;
	}
	/**
	 * @param qq the qq to set
	 */
	public void setQq(String qq) {
		this.qq = qq;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
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
	/**
	 * @return the classes
	 */
	public String getClasses() {
		return classes;
	}
	/**
	 * @param classes the classes to set
	 */
	public void setClasses(String classes) {
		this.classes = classes;
	}
	/**
	 * @return the submajor
	 */
	public String getSubmajor() {
		return submajor;
	}
	/**
	 * @param submajor the submajor to set
	 */
	public void setSubmajor(String submajor) {
		this.submajor = submajor;
	}
	/**
	 * @return the subclass
	 */
	public String getSubclass() {
		return subclass;
	}
	/**
	 * @param subclass the subclass to set
	 */
	public void setSubclass(String subclass) {
		this.subclass = subclass;
	}
	/**
	 * @return the emcontact
	 */
	public String getEmcontact() {
		return emcontact;
	}
	/**
	 * @param emcontact the emcontact to set
	 */
	public void setEmcontact(String emcontact) {
		this.emcontact = emcontact;
	}
	/**
	 * @return the emphone
	 */
	public String getEmphone() {
		return emphone;
	}
	/**
	 * @param emphone the emphone to set
	 */
	public void setEmphone(String emphone) {
		this.emphone = emphone;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	
	public UserInfo getInfoById(String id) throws Exception{
		UserInfo u=StudentBPO.getInfo(id);
		
		return u;
	}
	
	public void add() throws Exception {
		StudentBPO.add(this);
	}
	public static void addAll(DataStore ds) throws Exception{
		StudentBPO.addAll(ds);
	}
	
	public static ArrayList<Student> search(String condition) throws Exception {
		return StudentBPO.search(condition);
	}
	
	public static Student extSearch(String condition) throws Exception {
		return StudentBPO.extSearch(condition);
	}
	public void alter() throws Exception {
		StudentBPO.alter(this);
	}
	public static void delete(String id) throws Exception {
		StudentBPO.delete(id);
	}
	
	public static void alterContact(String id,String phone,String emphone,String qq,String email,String address) throws Exception {
		StudentBPO.alterContact(id,phone,emphone,qq,email,address);
	}
}
