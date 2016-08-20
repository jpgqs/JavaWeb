package com.bean;

import java.util.ArrayList;

import com.dao.AcademyBPO;

public class Academy {

	private String id;
	private String name;
	private Major[] majors;
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
	 * @return the major
	 */
	public Major[] getMajor() {
		return majors;
	}
	/**
	 * @param major the major to set
	 */
	public void setMajor(Major[] major) {
		this.majors = major;
	}
	
	public static ArrayList<Academy> getAcademies() throws Exception{
		
		return AcademyBPO.getAcademies();
	}
	
	public String[] getMajorIds() throws Exception{
		
		Major[] majors=getMajor();
		String[] ids=new String[majors.length];
		for(int i=0;i<majors.length;i++){
			ids[i]=majors[i].getId();
		}
		
		return ids;
	}
	public String[] getMajorNames() throws Exception{
		Major[] majors=getMajor();
		String[] ids=new String[majors.length];
		for(int i=0;i<majors.length;i++){
			ids[i]=majors[i].getName();
		}
		
		return ids;
	}
	
	public static String[] getAllMajorIds() throws Exception {
		return AcademyBPO.getAllMajorIds();
	}
	
	public static String[] getAllMajorNames() throws Exception {
		return AcademyBPO.getAllMajorNames();
	}
}
