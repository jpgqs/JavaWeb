package com.dao;

import java.util.ArrayList;

import net.sf.json.JSONObject;

import com.bean.Question;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class QuestionBPO {
	private Sql sql=new Sql();

	public ArrayList<Question> searchQuestionList(JSONObject params) throws Exception {
		return null;
	}

	public void deleteQuestionById(String id) throws Exception {
		
	}

	public ArrayList<Question> getHotQuestionList() throws Exception {
		sql.setSql("SELECT * FROM s_question ORDER BY readtime*0.1+accept*0.6+reply*0.3 DESC LIMIT 5");
		DataStore ds=sql.executeQuery();
		ArrayList<Question> qs=new ArrayList<Question>();
		for(int i=0;i<ds.rowCount();i++){
			Question q=new Question();
			q.setId(ds.getString(i, "id"));
			q.setTitle(ds.getString(i, "title"));
			q.setLocation(ds.getString(i, "location"));
			q.setCategory(ds.getInt(i, "category"));
			q.setContent(ds.getString(i, "content"));
			q.setHtml(ds.getString(i, "html"));
			q.setQkey(ds.getString(i, "qkey"));
			q.setReadtime(ds.getInt(i, "readtime"));
			q.setAccept(ds.getInt(i, "accept"));
			q.setReply(ds.getInt(i, "reply"));
			q.setQtime(Tools.dateToString(ds.getDate(i, "qtime"), "yyyy-MM-dd HH:mm:ss"));
			q.setAuthor(ds.getString(i, "author"));
			
			qs.add(q);
		}
		return qs;
	}

	public ArrayList<Question> getSuggestQuestionList() throws Exception {
		return null;
	}

	public ArrayList<Question> getAllQuestionList(int index, int length) throws Exception {
		sql.setSql("SELECT * FROM s_question ORDER BY readtime*0.1+accept*0.6+reply*0.3,qtime DESC LIMIT ?,? ");
		sql.setInt(1, index);
		sql.setInt(2, length);
		DataStore ds=sql.executeQuery();
		ArrayList<Question> qs=new ArrayList<Question>();
		for(int i=0;i<ds.rowCount();i++){
			Question q=new Question();
			q.setId(ds.getString(i, "id"));
			q.setTitle(ds.getString(i, "title"));
			q.setLocation(ds.getString(i, "location"));
			q.setCategory(ds.getInt(i, "category"));
			q.setContent(ds.getString(i, "content"));
			q.setHtml(ds.getString(i, "html"));
			q.setQkey(ds.getString(i, "qkey"));
			q.setReadtime(ds.getInt(i, "readtime"));
			q.setAccept(ds.getInt(i, "accept"));
			q.setReply(ds.getInt(i, "reply"));
			q.setQtime(Tools.dateToString(ds.getDate(i, "qtime"), "yyyy-MM-dd HH:mm:ss"));
			q.setAuthor(ds.getString(i, "author"));
			
			qs.add(q);
		}
		return qs;
	}

	public Question getQuestionById(String id) throws Exception {
		
		Question q=new Question();
		
		sql.setSql("select * from s_question where id = ? ");
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0){
			throw new Exception("404不存在");
		}
		
		q.setId(ds.getString(0, "id"));
		q.setTitle(ds.getString(0, "title"));
		q.setLocation(ds.getString(0, "location"));
		q.setCategory(ds.getInt(0, "category"));
		q.setContent(ds.getString(0, "content"));
		q.setHtml(ds.getString(0, "html"));
		q.setQkey(ds.getString(0, "qkey"));
		q.setReadtime(ds.getInt(0, "readtime"));
		q.setAccept(ds.getInt(0, "accept"));
		q.setReply(ds.getInt(0, "reply"));
		q.setQtime(Tools.dateToString(ds.getDate(0, "qtime"), "yyyy-MM-dd HH:mm:ss"));
		q.setAuthor(ds.getString(0, "author"));
		
		return q;
	}

	public ArrayList<Question> getBestQuestionList(int index, int length) throws Exception {
		return null;
	}

	public ArrayList<Question> getNewQuestionList(int index, int length) throws Exception {
		return null;
	}

	public ArrayList<Question> getNoAnswerQuestionList(int index, int length) throws Exception {
		return null;
	}

	public ArrayList<Question> getQuestionByLocation(String location, int index, int length) throws Exception {
		return null;
	}

	public void createQuestion(JSONObject params) throws Exception {
		
	}

	public void addAnswer(String id) throws Exception {
		
	}

	public int addOpt(String id, String userid) throws Exception {
		return 0;
	}

	public String addQuestion(JSONObject params) throws Exception {
		
		String title=params.getString("title");
		if(title.length()==0){
			throw new Exception("标题不能为空");
		}
		String location=params.getString("location");
		String qtype=params.getString("qtype");
		String content=params.getString("content").trim();
		if(content.length()==0){
			throw new Exception("内容不能为空");
		}
		String html=params.getString("html");
		String keys=params.getString("keys");
		String author=params.getString("author");
		
		String id=Tools.genId();
		
		while(true){
			sql.setSql("select * from s_question where id = ? ");
			sql.setString(1, id);
			DataStore ds=sql.executeQuery();
			if(ds.rowCount()==0){
				break;
			}
			id=Tools.genId();
		}
		
		sql.setSql("insert into s_question(id,title,location,category,content,html,qkey,qtime,author) "
				+ "values(?,?,?,?,?,?,?,now(),?) ");
		sql.setString(1, id);
		sql.setString(2, title);
		sql.setString(3, location);
		sql.setString(4, qtype);
		sql.setString(5, content);
		sql.setString(6, html);
		sql.setString(7, keys);
		sql.setString(8, author);
		sql.executeUpdate();
		
		return id;
		
	}
	

}
