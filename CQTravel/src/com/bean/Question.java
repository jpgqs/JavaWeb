package com.bean;

import java.util.ArrayList;

import net.sf.json.JSONObject;

import com.dao.QuestionBPO;

public class Question {

	private static QuestionBPO questionBPO=new QuestionBPO();
	
	private String id;
	private String title;
	private String location;
	private int category;
	private String content;
	private String html;
	private String qkey;
	private int readtime;
	private int accept;
	private int reply;
	private String qtime;
	private String author;
	private int flag;
	
	private ArrayList<Answer> answers;
	/**
	 * @return the answers
	 */
	public ArrayList<Answer> getAnswers() {
		return answers;
	}
	/**
	 * @param answers the answers to set
	 */
	public void setAnswers(ArrayList<Answer> answers) {
		this.answers = answers;
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
	 * @return the category
	 */
	public int getCategory() {
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(int category) {
		this.category = category;
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
	 * @return the accept
	 */
	public int getAccept() {
		return accept;
	}
	/**
	 * @param accept the accept to set
	 */
	public void setAccept(int accept) {
		this.accept = accept;
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
	 * @return the qkey
	 */
	public String getQkey() {
		return qkey;
	}
	/**
	 * @param qkey the qkey to set
	 */
	public void setQkey(String qkey) {
		this.qkey = qkey;
	}
	/**
	 * @return the qtime
	 */
	public String getQtime() {
		return qtime;
	}
	/**
	 * @param qtime the qtime to set
	 */
	public void setQtime(String qtime) {
		this.qtime = qtime;
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
	
	public static Question getQuestionById(String id) throws Exception {
		return questionBPO.getQuestionById(id);
	}
	
	public static ArrayList<Question> searchQuestionList(JSONObject params) throws Exception {
		return questionBPO.searchQuestionList(params);
	}
	public static void deleteQuestionById(String id) throws Exception {
		questionBPO.deleteQuestionById(id);
	}
	
	/**
	 * 获取热门问题列表
	 * @return
	 * @throws Exception
	 */
	public static ArrayList<Question> getHotQuestionList() throws Exception {
		return questionBPO.getHotQuestionList();
	}
	
	/**
	 * 获取问题提示列表
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static ArrayList<Question> getSuggestQuestionList(String key) throws Exception {
		return questionBPO.getSuggestQuestionList();
	}
	
	/**
	 * 分页查询所有问题
	 * @param index
	 * @param length
	 * @return
	 * @throws Exception
	 */
	public static ArrayList<Question> getAllQuestionList(int index,int length) throws Exception {
		return questionBPO.getAllQuestionList(index,length);
	}
	
	/**
	 * 分页查询金牌回答问题
	 * @param index
	 * @param length
	 * @return
	 * @throws Exception
	 */
	public static ArrayList<Question> getBestQuestionList(int index,int length) throws Exception {
		return questionBPO.getBestQuestionList(index,length);
	}
	
	/**
	 * 分页查询最新问题列表
	 * @param index
	 * @param length
	 * @return
	 * @throws Exception
	 */
	public static ArrayList<Question> getNewQuestionList(int index,int length) throws Exception {
		return questionBPO.getNewQuestionList(index,length);
	}
	
	/**
	 * 分页查询待回答问题列表
	 * @param index
	 * @param length
	 * @return
	 * @throws Exception
	 */
	public static ArrayList<Question> getNoAnswerQuestionList(int index,int length) throws Exception {
		return questionBPO.getNoAnswerQuestionList(index,length);
	}
	
	/**
	 * 按关联地分页查询问题
	 * @param location
	 * @return
	 * @throws Exception
	 */
	public static ArrayList<Question> getQuestionByLocation(String location,int index,int length) throws Exception {
		return questionBPO.getQuestionByLocation(location,index,length);
	}
	
	public static void createQuestion(JSONObject params) throws Exception {
		questionBPO.createQuestion(params);
	}
	
	public static void addAnswer(String id) throws Exception {
		questionBPO.addAnswer(id);
	}
	
	public static int addOpt(String id,String userid) throws Exception {
		return questionBPO.addOpt(id,userid);
	}
	public static String addQuestion(JSONObject params) throws Exception {
		return questionBPO.addQuestion(params);
	}
	
}
