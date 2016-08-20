package com.dao;

import java.util.ArrayList;
import java.util.Date;

import com.bean.Message;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class MessageBPO {

	private static Sql sql=new Sql();
	
	public static ArrayList<Message> getMessageList() throws Exception {
		
		sql.setSql("select * from d_pm order by date desc limit 10");
		DataStore ds=sql.executeQuery();
		
		ArrayList<Message> ml=new ArrayList<Message>();
		for(int i=0;i<ds.rowCount();i++){
			Message m=new Message();
			m.setId(ds.getString(i, "id"));
			m.setContent(ds.getString(i, "content"));
			m.setDate(Tools.dateToString(ds.getDate(i, "date"), "yyyy-mm-dd"));
			m.setSenderId(ds.getString(i, "sender_id"));
			m.setRecevierId(ds.getString(i, "recevier_id"));
			m.setReadflag(ds.getInt(i, "read_flag"));
			
			ml.add(m);
		}
		
		return ml;
	}
	
	public static void updateMessageFlag(String id) throws Exception {
		
		sql.setSql("update d_pm set read_flag = 1 where id = ?");
		sql.setString(1, id);
		sql.executeUpdate();
		
	}

	public static void add(String sender, String recevier, String content) throws Exception {
		
		if(content==null||"".equals(content))
			throw new Exception("短消息内容不能为空");
		
		Date date=new Date();
		String dates=Tools.dateToString(date, "yyyyMMddHHmmss")+"1";
		
		sql.setSql("insert into d_pm values(?,?,?,?,?,?)");
		sql.setString(1, dates);
		sql.setString(2, content);
		sql.setDateTime(3, date);
		sql.setString(4, sender);
		sql.setString(5, recevier);
		sql.setInt(6, 0);
		sql.executeUpdate();
	}
	
}
