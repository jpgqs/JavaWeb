package com.dao;

import java.util.ArrayList;

import com.bean.Book;
import com.bean.Student;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class BookBPO {

	private static Sql sql=new Sql();
	
	public static ArrayList<Book> getBooksList(String id) throws Exception {
		
		StringBuffer sb=new StringBuffer("");
		sb.append("SELECT b.*,rb.isbooks ");
		sb.append("FROM ");
		sb.append("  s_user_info s,");
		sb.append("  r_stu_subject_rela r,");
		sb.append("  d_subject d,");
		sb.append("  d_book b, ");
		sb.append("  r_stu_book_rela rb ");
		sb.append("WHERE s.`id` = r.`student_id` ");
		sb.append("  AND s.`semester` = r.`student_sem` ");
		sb.append("  AND r.`subject_id`=d.`id`");
		sb.append("  AND d.`book_id`=b.`id`");
		sb.append("  AND s.`semester`=rb.`student_sem`");
		sb.append("  AND s.`id`=rb.`student_id`");
		sb.append("  AND d.`book_id`=rb.`book_id`");
		sb.append("  AND s.`id`= ? ");
		
		sql.setSql(sb.toString());
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0){
			throw new Exception("未获取到教材信息");
		}
		
		ArrayList<Book> bl=new ArrayList<Book>();
		for(int i=0;i<ds.rowCount();i++){
			Book b=new Book();
			b.setId(ds.getString(i, "id"));
			b.setName(ds.getString(i, "name"));
			b.setPublisher(ds.getString(i, "publisher"));
			b.setAuthor(ds.getString(i, "author"));
			b.setPrice(ds.getDouble(i, "price"));
			b.setIsbooks(ds.getInt(i, "isbooks"));
			bl.add(b);
		}
		
		
		return bl;
	}

	public static void updateBookFlag(String studentId, String bookId) throws Exception {
		
		sql.setSql("update r_stu_book_rela set isbooks = 1 where student_id = ? and book_id = ?");
		sql.setString(1, studentId);
		sql.setString(2, bookId);
		sql.executeUpdate();
	}

	public static void add(Book book) throws Exception {
		if(book==null){
			throw new Exception("提交对象为null");
		}
		
		String id=book.getId();
		
		sql.setSql("select * from d_book where id = ?");
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()!=0){
			throw new Exception("增加教材失败：编号["+id+"]在数据库中已存在");
		}
		
		String name=book.getName();
		if(Tools.isNull(name)){
			throw new Exception("教材名称不能为空");
		}
		String publisher=book.getPublisher();
		String author=book.getAuthor();
		double price=book.getPrice();
		
		sql.setSql("insert into d_book values(?,?,?,?,?) ");
		sql.setString(1, book.getId());
		sql.setString(2, name);
		sql.setString(3, publisher);
		sql.setString(4, author);
		sql.setDouble(5, price);
		sql.executeUpdate();
	}

	public static void addAll(DataStore ds) throws Exception {
		int num=ds.rowCount();
		System.out.println("需要更新的行数"+(num-1));
		for(int i=1;i<num;i++){
			Book b=new Book();
			
			b.setId(ds.getString(i, "id"));
			b.setName(ds.getString(i, "name"));
			b.setPublisher(ds.getString(1, "publisher"));
			b.setAuthor(ds.getString(i, "author"));
			b.setPrice(Double.parseDouble(ds.getString(i, "price")));
			
			add(b);
		}
	}

	public static Book extSearch(String condition) throws Exception {
		
		sql.setSql("select * from d_book where id = ? or name = ? or author = ? limit 1");
		sql.setString(1, condition);
		sql.setString(2, condition);
		sql.setString(3, condition);
		
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0)
			throw new Exception("未找到与["+condition+"]相关的教材信息");
		
		Book b=new Book();
		b.setId(ds.getString(0, "id"));
		b.setName(ds.getString(0, "name"));
		b.setPublisher(ds.getString(0, "publisher"));
		b.setAuthor(ds.getString(0, "author"));
		b.setPrice(ds.getDouble(0, "price"));
		
		return b;
	}

	public static void alter(Book book) throws Exception {
		if(book==null){
			throw new Exception("提交对象为null");
		}
		ArrayList<String> params=new ArrayList<String>();
		
		String id=book.getId();
		sql.setSql("select * from d_book where id = ?");
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0){
			throw new Exception("修改错误：编号["+id+"]在数据库中不存在");
		}
		
		StringBuffer sb=new StringBuffer("");
		
		String name=book.getName();
		if(name!=null&&!name.equals(ds.getString(0, "name"))){
			if(Tools.isNull(name)){
				throw new Exception("教材名称不能为空");
			}
			params.add(name);
			sb.append(" name = ?, ");
		}
		
		String publisher=book.getPublisher();
		if(publisher!=null&&!publisher.equals(ds.getString(0, "publisher"))){
			params.add(publisher);
			sb.append(" publisher = ?, ");
		}
		
		String author=book.getAuthor();
		if(author!=null&&!author.equals(ds.getString(0, "author"))){
			params.add(author);
			sb.append(" author = ?, ");
		}
		
		double price=book.getPrice();
		String condition=sb.toString();
		if(!"".equals(condition))
			condition=(","+condition).substring(0,condition.lastIndexOf(','));
		
		sql.setSql("UPDATE d_book SET price = ? "+condition+" WHERE id = ?");
		sql.setDouble(1, price);
		for(int i=0;i<params.size();i++){
			sql.setString(i+2, params.get(i));
		}
		sql.setString(2+params.size(), id);
		
		sql.executeUpdate();
		
	}
	
	public static void main(String[] args) throws Exception {
		Book b=new Book();
		b.setId("04030401");
		b.setName("JSP实用教程(第三版)");
		b.setPublisher("机械工业出版社");
		b.setAuthor("耿祥义");
		b.setPrice(0.0);
		BookBPO.alter(b);;
	}

	public static ArrayList<Book> search(String condition) throws Exception {
		
		sql.setSql("select * from d_book where id like ? or name like ? or publisher like ? or author like ? limit 8");
		sql.setString(1, "%"+condition+"%");
		sql.setString(2, "%"+condition+"%");
		sql.setString(3, "%"+condition+"%");
		sql.setString(4, "%"+condition+"%");
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0)
			throw new Exception("未找到与["+condition+"]相关的教材信息");
		
		ArrayList<Book> sl=new ArrayList<Book>();
		for(int i=0;i<ds.rowCount();i++){
			Book b=new Book();
			
			b.setId(ds.getString(i, "id"));
			b.setName(ds.getString(i, "name"));
			b.setPublisher(ds.getString(i, "publisher"));
			b.setAuthor(ds.getString(i, "author"));
			b.setPrice(ds.getDouble(i, "price"));
			
			sl.add(b);
		}
		
		
		return sl;
	}

	public static void delete(String id) throws Exception {
		if(Tools.isNull(id))
			throw new Exception("id为空！");
		
		sql.setSql("select * from d_book where id = ?");
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0){
			throw new Exception("删除教材信息失败：编号["+id+"]在数据库中不存在");
		}
		
		sql.setSql("delete from d_book where id = ? ");
		sql.setString(1, id);
		sql.executeUpdate();
	}
}
