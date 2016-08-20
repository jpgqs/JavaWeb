package com.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import net.sf.json.JSONObject;

import com.bean.Note;
import com.bean.NoteReply;
import com.bean.View;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class NoteBPO {
	private static Sql sql=new Sql();

	public static String add(String title, String path, String author, String content,
			String html) throws Exception {
		String id=Tools.genId();
		
		while(true){
			sql.setSql("select * from s_note where id = ? ");
			sql.setString(1, id);
			DataStore ds=sql.executeQuery();
			if(ds.rowCount()==0){
				break;
			}
			id=Tools.genId();
		}
//		System.out.println(ds.rowCount());
		
		path=path.replace(author, id);
		sql.setSql("insert into s_note(id,title,author,uploadtime,headpicture,content,htmlcode) "
				+ " values(?,?,?,now(),?,?,?) ");
		sql.setString(1, id);
		sql.setString(2, title);
		sql.setString(3, author);
		sql.setString(4, path);
		sql.setString(5, content.trim());
		sql.setString(6, html);
		sql.executeUpdate();
		
		return id;
	}
	
	public static void main(String[] args) throws Exception {
		NoteBPO.add("重庆 重庆","", "admin123", "test", "test");
	}

	public static Note getNoteById(String id) throws Exception {
		if(Tools.isNull(id))
			return null;
		
		sql.setSql("select * from s_note where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，该攻略不可访问");
		}
		
		sql.setSql("UPDATE s_note SET readtime=readtime+1 WHERE id=?");
		sql.setString(1, id);
		sql.executeUpdate();
		
		Note n=new Note();
		n.setId(id);
		n.setTitle(ds.getString(0, "title"));
		n.setAuthor(ds.getString(0, "author"));
		n.setUploadtime(Tools.dateToString(ds.getDate(0, "uploadtime"), "yyyy/MM/dd HH:mm:ss"));
		n.setReadtime(ds.getInt(0, "readtime")+1);
		n.setOpt(ds.getInt(0, "opt"));
		n.setReply(ds.getInt(0, "reply"));
		n.setCollect(ds.getInt(0, "collect"));
		n.setLocation(ds.getString(0, "location"));
		n.setFlag(ds.getInt(0, "flag"));
		n.setHeadpicture(ds.getString(0, "headpicture"));
		n.setContent(ds.getString(0, "content"));
		n.setHtmlcode(ds.getString(0, "htmlcode"));
		
		n.setReplies(NoteReply.getRepliesByNote(id));
		return n;
	}

	public static ArrayList<Note> getHotNotes(int begin, int length) throws Exception {
		
		sql.setSql("SELECT * FROM s_note ORDER BY readtime*0.2+opt*0.3+reply*0.4+collect*0.1 DESC LIMIT ?,?;");
		sql.setInt(1, begin);
		sql.setInt(2, length);
		DataStore ds=sql.executeQuery();
		ArrayList<Note> notes=new ArrayList<Note>();
		for(int i=0;i<ds.rowCount();i++){
			Note note=new Note();
			note.setId(ds.getString(i, "id"));
			note.setTitle(ds.getString(i, "title"));
			note.setAuthor(ds.getString(i, "author"));
			note.setUploadtime(Tools.dateToString(ds.getDate(i, "uploadtime"), "yyyy/MM/dd HH:mm:ss"));
			note.setReadtime(ds.getInt(i, "readtime"));
			note.setOpt(ds.getInt(i, "opt"));
			note.setReply(ds.getInt(i, "reply"));
			note.setCollect(ds.getInt(i, "collect"));
			note.setLocation(ds.getString(i, "location"));
			note.setFlag(ds.getInt(i, "flag"));
			note.setHeadpicture(ds.getString(i, "headpicture"));
			note.setContent(ds.getString(i, "content"));
			note.setHtmlcode(ds.getString(i, "htmlcode"));
			
			notes.add(note);
		}
		
		return notes;
	}

	public static int getNotesNum() throws Exception{
		
		sql.setSql("SELECT COUNT(1) num FROM s_note");
		DataStore ds=sql.executeQuery();
		return ds.getInt(0, "num");
	}

	public static void addReply(String id) throws Exception{
		sql.setSql("update s_note set reply=reply+1 where id = ? ");
		sql.setString(1, id);
		sql.executeUpdate();
	}

	public static ArrayList<Note> getNewNotes(int begin, int length) throws Exception {
		
		sql.setSql("SELECT * FROM s_note ORDER BY uploadtime DESC LIMIT ?,?;");
		sql.setInt(1, begin);
		sql.setInt(2, length);
		DataStore ds=sql.executeQuery();
		ArrayList<Note> notes=new ArrayList<Note>();
		for(int i=0;i<ds.rowCount();i++){
			Note note=new Note();
			note.setId(ds.getString(i, "id"));
			note.setTitle(ds.getString(i, "title"));
			note.setAuthor(ds.getString(i, "author"));
			note.setUploadtime(Tools.dateToString(ds.getDate(i, "uploadtime"), "yyyy/MM/dd HH:mm:ss"));
			note.setReadtime(ds.getInt(i, "readtime"));
			note.setOpt(ds.getInt(i, "opt"));
			note.setReply(ds.getInt(i, "reply"));
			note.setCollect(ds.getInt(i, "collect"));
			note.setLocation(ds.getString(i, "location"));
			note.setFlag(ds.getInt(i, "flag"));
			note.setHeadpicture(ds.getString(i, "headpicture"));
			note.setContent(ds.getString(i, "content"));
			note.setHtmlcode(ds.getString(i, "htmlcode"));
			
			notes.add(note);
		}
		
		return notes;
	}

	public static Note getSuggestNote(String key) throws Exception {
		
		sql.setSql("SELECT * FROM s_note WHERE location LIKE ? "
				+ " OR title LIKE ? ORDER BY readtime*0.2+opt*0.3+reply*0.4+collect*0.1 DESC LIMIT 1");
		sql.setString(1, "%"+key+"%");
		sql.setString(2, "%"+key+"%");
		
		DataStore ds=sql.executeQuery();
		
		Note n=null;
		if(ds.rowCount()>1){
			
			n=new Note();
			n.setId(ds.getString(0, "id"));
			n.setTitle(ds.getString(0, "title"));
			n.setAuthor(ds.getString(0, "author"));
			n.setUploadtime(Tools.dateToString(ds.getDate(0, "uploadtime"), "yyyy/MM/dd HH:mm:ss"));
			n.setReadtime(ds.getInt(0, "readtime")+1);
			n.setOpt(ds.getInt(0, "opt"));
			n.setReply(ds.getInt(0, "reply"));
			n.setCollect(ds.getInt(0, "collect"));
			n.setLocation(ds.getString(0, "location"));
			n.setFlag(ds.getInt(0, "flag"));
			n.setHeadpicture(ds.getString(0, "headpicture"));
			n.setContent(ds.getString(0, "content"));
			n.setHtmlcode(ds.getString(0, "htmlcode"));
		}
		
		
		return n;
	}

	public static int addOpt(String userId, String noteId) throws Exception {
		DataStore ds=null;
		String id=Tools.genId();
		
		while(true){
			sql.setSql("select * from s_user_opt_record where id = ? ");
			sql.setString(1, id);
			ds=sql.executeQuery();
			if(ds.rowCount()==0){
				break;
			}
			id=Tools.genId();
		}
		
		sql.setSql("select * from s_user_opt_record where userid = ? and type = 0 and objid = ? ");
		sql.setString(1, userId);
		sql.setString(2, noteId);
		ds=sql.executeQuery();
		
		if(ds.rowCount()>0){
			return 3;
		}
		
		sql.setSql("insert into s_user_opt_record values(?,?,?,?,now())");
		sql.setString(1, id);
		sql.setString(2, userId);
		sql.setInt(3, 0);
		sql.setString(4, noteId);
		sql.executeUpdate();
		
		return 1;
	}

	public static ArrayList<Note> searchNoteList(JSONObject params) throws Exception {
		
		String id=params.getString("id");
		String location=params.getString("location");
		String title=params.getString("title");
		String author=params.getString("author");
		String content=params.getString("content");
		
		StringBuffer sb=new StringBuffer();
		if(id!=null&&!"".equals(id)){
			sb.append(" and id like '"+id+"' "); 
		}
		if(location!=null&&!"".equals(location)){
			sb.append(" and location like '"+location+"' "); 
		}
		if(title!=null&&!"".equals(title)){
			sb.append(" and title like '"+title+"' ");
		}
		if(author!=null&&!"".equals(author)){
			sb.append(" and address like '"+author+"' "); 
		}
		if(content!=null&&!"".equals(content)){
			sb.append(" and content like '"+content+"' "); 
		}
		
		sql.setSql("select * from s_note where 1=1 "+sb.toString());
		//System.out.println(sql.getSql());
		DataStore ds=sql.executeQuery();
		
		ArrayList<Note> noteList=new ArrayList<Note>();
		for(int i=0;i<ds.rowCount();i++){
			Note n=new Note();
			
			n.setId(ds.getString(i, "id"));
			n.setTitle(ds.getString(i, "title"));
			n.setAuthor(ds.getString(i, "author"));
			n.setUploadtime(Tools.dateToString(ds.getDate(i, "uploadtime"), "yyyy/MM/dd HH:mm:ss"));
			n.setReadtime(ds.getInt(i, "readtime"));
			n.setOpt(ds.getInt(i, "opt"));
			n.setReply(ds.getInt(i, "reply"));
			n.setCollect(ds.getInt(i, "collect"));
			n.setLocation(ds.getString(i, "location"));
			n.setFlag(ds.getInt(i, "flag"));
			n.setHeadpicture(ds.getString(i, "headpicture"));
			n.setContent(ds.getString(i, "content"));
			n.setHtmlcode(ds.getString(i, "htmlcode"));
			
			noteList.add(n);
		}
		
		return noteList;
	}

	public static void deleteNoteById(String id) throws Exception {
		sql.setSql("select * from s_note where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，游记攻略不存在");
		}
		
		sql.setSql("delete from s_note where id = ?");
		sql.setString(1, id);
		sql.executeUpdate();
	}

	public static String add(String title, String author, String content,
			String html) throws Exception {
		String id=add(title, null, author, content, html);
		
		return id;
	}
	
}
