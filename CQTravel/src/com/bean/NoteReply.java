package com.bean;

import java.util.ArrayList;

import com.dao.NoteReplyBPO;

public class NoteReply {
	private String id;
	private String noteid;
	private String author;
	private String repliedid;
	private String replytime;
	private String content;
	private String html;
	private int replyorder;
	private int flag;
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
	 * @return the noteid
	 */
	public String getNoteid() {
		return noteid;
	}
	/**
	 * @param noteid the noteid to set
	 */
	public void setNoteid(String noteid) {
		this.noteid = noteid;
	}
	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}
	/**
	 * @return the repliedid
	 */
	public String getRepliedid() {
		return repliedid;
	}
	/**
	 * @param repliedid the repliedid to set
	 */
	public void setRepliedid(String repliedid) {
		this.repliedid = repliedid;
	}
	/**
	 * @return the replytime
	 */
	public String getReplytime() {
		return replytime;
	}
	/**
	 * @param replytime the replytime to set
	 */
	public void setReplytime(String replytime) {
		this.replytime = replytime;
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
	 * @return the html
	 */
	public String getHtml() {
		return html;
	}
	/**
	 * @param html the html to set
	 */
	public void setHtml(String html) {
		this.html = html;
	}
	/**
	 * @return the replyorder
	 */
	public int getReplyorder() {
		return replyorder;
	}
	/**
	 * @param replyorder the replyorder to set
	 */
	public void setReplyorder(int replyorder) {
		this.replyorder = replyorder;
	}
	/**
	 * @return the flag
	 */
	public int getFlag() {
		return flag;
	}
	/**
	 * @param flag the flag to set
	 */
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	public static ArrayList<NoteReply> getRepliesByNote(String noteId) throws Exception {
		return NoteReplyBPO.getRepliesByNote(noteId);
	}
	
	public static String add(String noteId,String author,String replided,String content,String html) throws Exception {
		return NoteReplyBPO.add(noteId,author,replided,content,html);
	}
}
