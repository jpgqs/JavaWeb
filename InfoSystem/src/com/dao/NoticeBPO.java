package com.dao;

import java.util.ArrayList;
import java.util.Date;

import com.bean.Notice;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class NoticeBPO {

	private static Sql sql=new Sql();

	public static ArrayList<Notice> getNoticeList() throws Exception{
		
		sql.setSql("select * from s_notice order by date desc limit 11");
		DataStore ds=sql.executeQuery();
		
		ArrayList<Notice> nl=new ArrayList<Notice>();
		for(int i=0;i<ds.rowCount();i++){
			Notice n=new Notice();
			n.setId(ds.getString(i, "id"));
			String title=ds.getString(i, "title");
			title=Tools.formatTitle(title,14);
			n.setTitle(title);
			n.setContent(ds.getString(i, "content"));
			Date date=ds.getDate(i, "date");
			n.setDate(Tools.dateToString(date, "yyyy-mm-dd"));
			nl.add(n);
		}
		
		return nl;
		
	}
	
	public static Notice getNoticeById(String id) throws Exception{
		
		sql.setSql("select * from s_notice where id = ? ");
		sql.setString(1,id);
		DataStore ds=sql.executeQuery();
		
		Notice n=new Notice();
		n.setId(ds.getString(0, "id"));
		n.setTitle(ds.getString(0, "title"));
		n.setContent(ds.getString(0, "content"));
		Date date=ds.getDate(0, "date");
		n.setDate(Tools.dateToString(date, "yyyy-mm-dd"));
		int readtimes=ds.getInt(0, "readtimes");
		n.setReadtimes(++readtimes);
		
		sql.setSql("update s_notice set readtimes = ? where id = ? ");
		sql.setInt(1, readtimes);
		sql.setString(2, id);
		sql.executeUpdate();
		
		
		
		return n;
	}

	public static void add(String title, String content) throws Exception{
		if(Tools.isNull(title)){
			throw new Exception("标题不能为空");
		}
		if(Tools.isNull(content)){
			throw new Exception("公告内容不能为空");
		}
		Date date=new Date();
		String id="02"+Tools.dateToString(date, "yyyyMMddHHmmss");
		sql.setSql("insert into s_notice values(?,?,?,?,?)");
		sql.setString(1, id);
		sql.setString(2, title);
		sql.setString(3, content);
		sql.setDate(4, date);
		sql.setInt(5, 0);
		sql.executeUpdate();
}
	
}
