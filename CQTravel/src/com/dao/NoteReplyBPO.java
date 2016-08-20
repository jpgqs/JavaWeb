package com.dao;

import java.util.ArrayList;
import java.util.Date;

import com.bean.NoteReply;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class NoteReplyBPO {
	private static Sql sql=new Sql();

	public static ArrayList<NoteReply> getRepliesByNote(String noteId) throws Exception {
		if(Tools.isNull(noteId))
			return null;
		
		sql.setSql("select * from s_note_reply where noteid= ? order by replyorder");
		sql.setString(1, noteId);
		
		DataStore ds=sql.executeQuery();
		
		ArrayList<NoteReply> nrs=new ArrayList<NoteReply>();
		for(int i=0;i<ds.rowCount();i++){
			NoteReply nr=new NoteReply();
			nr.setId(ds.getString(0, "id"));
			nr.setNoteid(ds.getString(i, "noteid"));
			nr.setAuthor(ds.getString(i, "author"));
			nr.setRepliedid(ds.getString(i, "repliedid"));
			nr.setReplytime(Tools.dateToString(ds.getDate(i, "replytime"), "yyyy/MM/dd HH:mm:ss"));
			nr.setContent(ds.getString(i, "content"));
			nr.setHtml(ds.getString(i, "html"));
			nr.setReplyorder(ds.getInt(i, "replyorder"));
			nr.setFlag(ds.getInt(i, "flag"));
			
			nrs.add(nr);
		}
		
		return nrs;
	}

	public static String add(String noteId, String author, String replided,
			String content, String html) throws Exception {
		Date date=new Date(System.currentTimeMillis());
		String id=Tools.dateToString(date, "yyyyMMddHHmmss");
		
		sql.setSql("select max(id) id from s_note_reply where id like ? ");
		sql.setString(1, "'"+id+"%'");
		DataStore ds=sql.executeQuery();
//		System.out.println(ds.rowCount());
		String ids=ds.getString(0, "id");
		if(ids==null)
			id+="0";
		else{
			int count=Integer.parseInt(ids.substring(14));
			id+=(count+1);
		}
		int order=0;
		sql.setSql("SELECT MAX(replyorder) orders FROM s_note_reply WHERE noteid = ?");
		sql.setString(1, noteId);
		ds=sql.executeQuery();
		int orders=ds.getInt(0, "orders");
		if(orders==0){
			order=1;
		}else{
			order=orders+1;
		}
		
		sql.setSql("insert into s_note_reply "
				+ "values(?,?,?,?,now(),?,?,?,1)");
		sql.setString(1, id);
		sql.setString(2, noteId);
		sql.setString(3, author);
		sql.setString(4, replided);
		sql.setString(5, content);
		sql.setString(6, html);
		sql.setInt(7, order);
		sql.executeUpdate();
		
		return noteId;
	}
}
