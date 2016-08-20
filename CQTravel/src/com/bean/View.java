package com.bean;

import java.util.ArrayList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.dao.ViewBPO;

public class View {

	private String id;
	private String location;
	private String name;
	private String address;
	private String description;
	private String checkin;
	private String comment;
	private float price;
	private int opt;
	
	private String headpicture;
	private String extra;
	
	private static ViewBPO viewBPO=new ViewBPO();
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
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}
	/**
	 * @param location the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
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
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the checkin
	 */
	public String getCheckin() {
		return checkin;
	}
	/**
	 * @param checkin the checkin to set
	 */
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}
	/**
	 * @param comment the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
	/**
	 * @return the price
	 */
	public float getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(float price) {
		this.price = price;
	}
	/**
	 * @return the opt
	 */
	public int getOpt() {
		return opt;
	}
	/**
	 * @param opt the opt to set
	 */
	public void setOpt(int opt) {
		this.opt = opt;
	}
	/**
	 * @return the headpicture
	 */
	public String getHeadpicture() {
		return headpicture;
	}
	/**
	 * @param headpicture the headpicture to set
	 */
	public void setHeadpicture(String headpicture) {
		this.headpicture = headpicture;
	}
	/**
	 * @return the extra
	 */
	public String getExtra() {
		return extra;
	}
	/**
	 * @param extra the extra to set
	 */
	public void setExtra(String extra) {
		this.extra = extra;
	}
	
	public static View getViewById(String id) throws Exception {
		return viewBPO.getViewById(id);
	}
	
	public static ArrayList<View> searchViewList(JSONObject data) throws Exception {
		return viewBPO.searchViewList(data);
	}
	public static void deleteViewById(String id) throws Exception {
		viewBPO.deleteViewById(id);
	}
	public static void alterView(JSONObject params) throws Exception {
		viewBPO.alterView(params);
	}
	public static void insertView(JSONArray objs) throws Exception {
		viewBPO.insertView(objs);
	}
	
}
