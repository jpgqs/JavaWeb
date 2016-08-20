package com.bean;

import java.util.ArrayList;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.dao.HotelBPO;
import com.util.hibernate.DataStore;

public class Hotel {
	
	private String id;
	private String location;
	private String name;
	private String address;
	private String description;
	private String checkin;
	private String tips;
	private String comment;
	private float price;
	private String roomtype;
	private int opt;
	private String view;
	
	private String headpicture;
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
	 * @return the view
	 */
	public String getView() {
		return view;
	}
	/**
	 * @param view the view to set
	 */
	public void setView(String view) {
		this.view = view;
	}
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
	 * @return the tips
	 */
	public String getTips() {
		return tips;
	}
	/**
	 * @param tips the tips to set
	 */
	public void setTips(String tips) {
		this.tips = tips;
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
	 * @return the roomtype
	 */
	public String getRoomtype() {
		return roomtype;
	}
	/**
	 * @param roomtype the roomtype to set
	 */
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
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
	
	public static ArrayList<Hotel> getThreeHotels() throws Exception{
		return HotelBPO.getThreeHotels();
	}
	
	public static Hotel getHotelById(String id) throws Exception {
		return HotelBPO.getHotelById(id);
	}
	
	public static Hotel getSuggestHotel(String key) throws Exception {
		return HotelBPO.getSuggestHotel(key);
	}
	
	public static Map<String,String> getRoomTypes() throws Exception {
		return HotelBPO.getRoomTypes();
	}
	
	public static ArrayList<Hotel> searchHotelList(JSONObject data) throws Exception {
		return HotelBPO.searchHotelList(data);
	}
	
	public static void deleteHotelById(String hotelid) throws Exception {
		HotelBPO.deleteHotelById(hotelid);
	}
	public static void alterHotel(JSONObject hotel) throws Exception {
		HotelBPO.alterHotel(hotel);
	}
	public static void insertHotel(JSONArray hotels) throws Exception {
		HotelBPO.insertHotel(hotels);
	}
	public static void addAll(DataStore ds) throws Exception {
		HotelBPO.addAll(ds);
	}
}
