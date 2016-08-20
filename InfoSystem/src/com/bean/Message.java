package com.bean;

import java.util.ArrayList;

import com.dao.MessageBPO;

public class Message {

	private String id;
	private String content;
	private String date;
	private String senderId;
	private String recevierId;
	private int readflag;
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
	/**
	 * @return the senderId
	 */
	public String getSenderId() {
		return senderId;
	}
	/**
	 * @param senderId the senderId to set
	 */
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	/**
	 * @return the resevierId
	 */
	public String getRecevierId() {
		return recevierId;
	}
	/**
	 * @param resevierId the resevierId to set
	 */
	public void setRecevierId(String recevierId) {
		this.recevierId = recevierId;
	}
	/**
	 * @return the readflag
	 */
	public int getReadflag() {
		return readflag;
	}
	/**
	 * @param readflag the readflag to set
	 */
	public void setReadflag(int readflag) {
		this.readflag = readflag;
	}
	
	public static ArrayList<Message> getMessageList() throws Exception{
		
		return MessageBPO.getMessageList();
	}
	
	public static void updateMessageFlag(String id) throws Exception {
		MessageBPO.updateMessageFlag(id);
	}
	
	public static void add(String sender,String recevier,String content) throws Exception {
		MessageBPO.add(sender,recevier,content);
	}
}
