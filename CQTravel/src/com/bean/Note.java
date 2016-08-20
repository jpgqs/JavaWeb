package com.bean;

import java.util.ArrayList;

import net.sf.json.JSONObject;

import com.dao.NoteBPO;

public class Note {
	private String id;
	private String title;
	private String author;
	private String uploadtime;
	private int readtime;
	private int opt;
	private int reply;
	private int collect;
	private String location;
	private int flag;
	private String headpicture;
	private String content;
	private String htmlcode;
	
	private ArrayList<NoteReply> replies;

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
	 * @return the uploadtime
	 */
	public String getUploadtime() {
		return uploadtime;
	}

	/**
	 * @param uploadtime the uploadtime to set
	 */
	public void setUploadtime(String uploadtime) {
		this.uploadtime = uploadtime;
	}

	/**
	 * @return the readtime
	 */
	public int getReadtime() {
		return readtime;
	}

	/**
	 * @param readtime the readtime to set
	 */
	public void setReadtime(int readtime) {
		this.readtime = readtime;
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
	 * @return the reply
	 */
	public int getReply() {
		return reply;
	}

	/**
	 * @param reply the reply to set
	 */
	public void setReply(int reply) {
		this.reply = reply;
	}

	/**
	 * @return the collect
	 */
	public int getCollect() {
		return collect;
	}

	/**
	 * @param collect the collect to set
	 */
	public void setCollect(int collect) {
		this.collect = collect;
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
	 * @return the htmlcode
	 */
	public String getHtmlcode() {
		return htmlcode;
	}

	/**
	 * @param htmlcode the htmlcode to set
	 */
	public void setHtmlcode(String htmlcode) {
		this.htmlcode = htmlcode;
	}

	/**
	 * @return the replies
	 */
	public ArrayList<NoteReply> getReplies() {
		return replies;
	}

	/**
	 * @param replies the replies to set
	 */
	public void setReplies(ArrayList<NoteReply> replies) {
		this.replies = replies;
	}
	
	public static String add(String title, String path, String author,String content,String html) throws Exception {
		return NoteBPO.add(title,path,author,content,html);
	}
	
	public static String add(String title, String author,String content,String html) throws Exception {
		return NoteBPO.add(title, author, content, html);
	}
	
	public static Note getNoteById(String id) throws Exception {
		return NoteBPO.getNoteById(id);
	}
	
	public static ArrayList<Note> getHotNotes(int begin,int length) throws Exception {
		return NoteBPO.getHotNotes(begin,length);
	}
	
	public static ArrayList<Note> getNewNotes(int begin,int length) throws Exception {
		return NoteBPO.getNewNotes(begin,length);
	}
	
	public static int getNotesNum() throws Exception {
		return NoteBPO.getNotesNum();
	}
	
	public static void addReply(String id) throws Exception {
		NoteBPO.addReply(id);
	}
	
	public static Note getSuggestNote(String key) throws Exception {
		return NoteBPO.getSuggestNote(key);
	}
	
	public static int addOpt(String userId,String noteId) throws Exception {
		return NoteBPO.addOpt(userId,noteId);
	}

	public static ArrayList<Note> searchNoteList(JSONObject params) throws Exception {
		return NoteBPO.searchNoteList(params);
	}

	public static void deleteNoteById(String objid) throws Exception {
		NoteBPO.deleteNoteById(objid);
	}

}
