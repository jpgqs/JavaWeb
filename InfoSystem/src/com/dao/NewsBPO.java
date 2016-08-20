package com.dao;

import java.util.ArrayList;
import java.util.Date;

import com.bean.News;
import com.bean.Notice;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class NewsBPO {

	private static Sql sql=new Sql();
	
	public static News getFirstNews() throws Exception {
		
		sql.setSql("SELECT * FROM s_news  ORDER BY DATE DESC LIMIT 1");
		DataStore ds=sql.executeQuery();
		
		String id=ds.getString(0, "id");
		String title=ds.getString(0, "title");
		String content=ds.getString(0, "content");
		Date date=ds.getDate(0, "date");
		int readtimes=ds.getInt(0, "readtimes");
		
		int tag=content.indexOf("</p>");
		String s=Tools.innerHtml(content);
		//String s=content.substring(3, tag);
		//System.out.println(s);
		if(s.length()>=100){
			content="<p>"+s.substring(0, 100)+"...</p>";
		}else{
			content="<p>"+s+"...</p>";
		}
		
		News n=new News();
		n.setId(id);
		n.setTitle(title);
		n.setContent(content);
		n.setDate(Tools.dateToString(date, "yyyy-mm-dd"));
		n.setReadtimes(readtimes);
		return n;
	}
	
	public static ArrayList<News> getNewsList(int count) throws Exception {
		
		sql.setSql("select * from s_news order by date desc limit 1, ?");
		sql.setInt(1, count);
		DataStore ds=sql.executeQuery();
		
		ArrayList<News> nl=new ArrayList<News>();
		for(int i=0;i<ds.rowCount();i++){
			News n=new News();
			n.setId(ds.getString(i, "id"));
			String title=ds.getString(i, "title");
			title=Tools.formatTitle(title, 14);
			n.setTitle(title);
			n.setContent(ds.getString(i, "content"));
			n.setDate(Tools.dateToString(ds.getDate(i, "date"), "yyyy-mm-dd"));
			n.setReadtimes(ds.getInt(i, "readtimes"));
			
			nl.add(n);
		}
		
		
		return nl;
	}
	
	public static News getNewsById(String id) throws Exception {
		
		sql.setSql("select * from s_news where id = ? ");
		sql.setString(1,id);
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0)
			throw new Exception("新闻不存在！");
		
		News n=new News();
		n.setId(ds.getString(0, "id"));
		n.setTitle(ds.getString(0, "title"));
		n.setContent(ds.getString(0, "content"));
		Date date=ds.getDate(0, "date");
		n.setDate(Tools.dateToString(date, "yyyy-mm-dd"));
		int readtimes=ds.getInt(0, "readtimes");
		n.setReadtimes(++readtimes);
		
		sql.setSql("update s_news set readtimes = ? where id = ? ");
		sql.setInt(1, readtimes);
		sql.setString(2, id);
		sql.executeUpdate();
		
		
		
		
		return n;
	}
	
	public static void main(String[] args) throws Exception {
		Date date=new Date();
		String id="01"+Tools.dateToString(date, "yyyyMMddHHmmss");
		System.out.println(id);
	}

	public static void add(String title, String content) throws Exception{
			if(Tools.isNull(title)){
				throw new Exception("标题不能为空");
			}
			if(Tools.isNull(content)){
				throw new Exception("新闻内容不能为空");
			}
			Date date=new Date();
			String id="01"+Tools.dateToString(date, "yyyyMMddHHmmss");
			sql.setSql("insert into s_news values(?,?,?,?,?)");
			sql.setString(1, id);
			sql.setString(2, title);
			sql.setString(3, content);
			sql.setDate(4, date);
			sql.setInt(5, 0);
			sql.executeUpdate();
	}
	
}
