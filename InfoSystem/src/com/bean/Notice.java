package com.bean;

import java.util.ArrayList;
import java.util.Date;

import com.dao.NewsBPO;
import com.dao.NoticeBPO;

public class Notice {

	private String id;
	private String title;
	private String content;
	private String date;
	private int readtimes;
	/**
	 * @return the readtimes
	 */
	public int getReadtimes() {
		return readtimes;
	}
	/**
	 * @param readtimes the readtimes to set
	 */
	public void setReadtimes(int readtimes) {
		this.readtimes = readtimes;
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
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}
	
	public static ArrayList<Notice> getNoticeList() throws Exception{
		
		
		return NoticeBPO.getNoticeList();
	}
	
	public static Notice getNoticeById(String id) throws Exception {
		return NoticeBPO.getNoticeById(id);
	}
	
	public static void add(String title,String content) throws Exception {
		NoticeBPO.add(title,content);
	}
}
