package com.bean;

import java.util.ArrayList;
import java.util.Map;

import com.dao.UserInfoBPO;

public class UserInfo {

	private String id;
	private String nickname;
	private int gender;
	private String city;
	private String birth;
	private String signature;
	private String headpicture;
	
	private String idcard;
	private String phone;
	private String qq;
	private String email;
	/**
	 * @return the id
	 */
	public String getId() {
		return id==null?"":id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the nickname
	 */
	public String getNickname() {
		return nickname==null?"":nickname;
	}
	/**
	 * @param nickname the nickname to set
	 */
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	 * @return the city
	 */
	public String getCity() {
		return city==null?"":city;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return the birth
	 */
	public String getBirth() {
		return birth==null?"":birth;
	}
	/**
	 * @param birth the birth to set
	 */
	public void setBirth(String birth) {
		this.birth = birth;
	}
	/**
	 * @return the signature
	 */
	public String getSignature() {
		return signature==null?"":signature;
	}
	/**
	 * @param signature the signature to set
	 */
	public void setSignature(String signature) {
		this.signature = signature;
	}
	/**
	 * @return the headpicture
	 */
	public String getHeadpicture() {
		return headpicture==null?"images/pp120.jpg":headpicture;
	}
	/**
	 * @param headpicture the headpicture to set
	 */
	public void setHeadpicture(String headpicture) {
		this.headpicture = headpicture;
	}
	/**
	 * @return the idcard
	 */
	public String getIdcard() {
		return idcard==null?"":idcard;
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
		return phone==null?"":phone;
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
		return qq==null?"":qq;
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
		return email==null?"":email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	
	public static UserInfo getInfoById(String id) throws Exception{
		return UserInfoBPO.getInfoById(id);
	}
	public static String getPicPathById(String id) throws Exception{
		return UserInfoBPO.getPicPathById(id);
	}
	
	public static UserInfo alterBasicInfo(String id,String name,String gender,String city,String birth,String signature) throws Exception {
		return UserInfoBPO.alterBasicInfo(id,name,gender,city,birth,signature);
	}
	
	public static void addHeadPicture(String id,String path) throws Exception {
		UserInfoBPO.addHeadPicture(id,path);
	}
	public static UserInfo addEmail(String username, String email) throws Exception{
		return UserInfoBPO.addEmail(username,email);
	}
	public static UserInfo addPhone(String username, String phone) throws Exception {
		 return UserInfoBPO.addPhone(username,phone);
	}
	
	public static ArrayList<UserInfo> searchUserList(Map<String,String> data) throws Exception {
		return UserInfoBPO.searchUserList(data);
	}
}
