package com.bean;

import java.util.ArrayList;

import com.dao.OrderBPO;

public class Order {
	private String id;
	private int objtype;
	private String objid;
	private String objname;
	private String objext;
	/**
	 * @return the objname
	 */
	public String getObjname() {
		return objname;
	}
	/**
	 * @param objname the objname to set
	 */
	public void setObjname(String objname) {
		this.objname = objname;
	}
	/**
	 * @return the objext
	 */
	public String getObjext() {
		return objext;
	}
	/**
	 * @param objext the objext to set
	 */
	public void setObjext(String objext) {
		this.objext = objext;
	}

	private String ordertime;
	private double price;
	private String userid;
	private String beginday;
	private String endday;
	/**
	 * @return the beginday
	 */
	public String getBeginday() {
		return beginday;
	}
	/**
	 * @param beginday the beginday to set
	 */
	public void setBeginday(String beginday) {
		this.beginday = beginday;
	}
	/**
	 * @return the endday
	 */
	public String getEndday() {
		return endday;
	}
	/**
	 * @param endday the endday to set
	 */
	public void setEndday(String endday) {
		this.endday = endday;
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
	 * @return the objtype
	 */
	public int getObjtype() {
		return objtype;
	}
	/**
	 * @param objtype the objtype to set
	 */
	public void setObjtype(int objtype) {
		this.objtype = objtype;
	}
	/**
	 * @return the objid
	 */
	public String getObjid() {
		return objid;
	}
	/**
	 * @param objid the objid to set
	 */
	public void setObjid(String objid) {
		this.objid = objid;
	}
	/**
	 * @return the ordertime
	 */
	public String getOrdertime() {
		return ordertime;
	}
	/**
	 * @param ordertime the ordertime to set
	 */
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}
	/**
	 * @return the userid
	 */
	public String getUserid() {
		return userid;
	}
	/**
	 * @param userid the userid to set
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public static void addHotelOrder(String hotelid,String userid, int count,String beginday,String endday) throws Exception {
		OrderBPO.addHotelOrder(hotelid,userid,count,beginday,endday);
	}
	
	public static ArrayList<Order> getOrdersByUser(String user) throws Exception {
		return OrderBPO.getOrdersByUser(user);
	}
}
