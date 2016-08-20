package com.util.hibernate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Sql {
	
	private class NullValue {
		private int type;
		public NullValue(int type) {
			this.type=type;
		}
		
		public int getType(){
			return this.type;
		}
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sqlString;
	private Object[] para=null;
	
	public Sql(){
		
	}

	public void setSql(String sqlstmt) {
		this.sqlString=sqlstmt;
		int i=-1;
		int count=0;
		while(true){
			i=sqlString.indexOf("?", i+1);
			if(i==-1)
				break;
			count+=1;
		}
		para=new Object[count];
	}

	/**
	 * @return the sqlString
	 */
	public String getSql() {
		return sqlString;
	}
	
	private void checkIndex(int index) throws Exception {
		if(index<1||index>para.length)
			throw new Exception("参数索引"+index+"不合法");
	}
	
	public void setNull(int index,int type) throws Exception{
		checkIndex(index);
		para[index-1]=new NullValue(type);
	}
	
	public void setString(int index,String value) throws Exception {
		checkIndex(index);
		if(value==null){
			this.setNull(index, Types.VARCHAR);
		}else{
			para[index-1]=value;
		}
	}
	
	public void setInt(int index,int value) throws Exception {
		checkIndex(index);
		para[index-1]=new Integer(value);
	}
	
	public void setInt(int index,Integer value) throws Exception {
		checkIndex(index);
		if(value==null){
			this.setNull(index, Types.INTEGER);
		}else{
			para[index-1]=value;
		}
	}
	
	public void setDouble(int index,double value) throws Exception {
		checkIndex(index);
		para[index-1]=new Double(value);
	}
	
	public void setDouble(int index,Double value) throws Exception {
		checkIndex(index);
		if(value==null){
			this.setNull(index, Types.DOUBLE);
		}else{
			para[index-1]=value;
		}
	}
	
	public void setBoolean(int index,boolean value) throws Exception {
		checkIndex(index);
		para[index-1]=new Boolean(value);
	}
	
	/**
	 * 设置日期(精确到天)
	 * @param index
	 * @param value
	 * @throws Exception
	 */
	public void setDate(int index,java.util.Date value) throws Exception {
		checkIndex(index);
		if(value==null){
			this.setNull(index, Types.DATE);
		}else{
			para[index-1]=new java.sql.Date(value.getTime());
		}
	}
	
	/**
	 * 设置日期（精确到秒）
	 * @param index
	 * @param value
	 * @throws Exception
	 */
	public void setDateTime(int index,java.util.Date value) throws Exception {
		checkIndex(index);
		if(value==null){
			this.setNull(index, Types.DATE);
		}else{
			para[index-1]=new java.sql.Timestamp(value.getTime());
		}
	}
	
	public void setTimeStamp(int index,java.sql.Timestamp value) throws Exception {
		checkIndex(index);
		if(value==null){
			this.setNull(index, Types.TIMESTAMP);
		}else{
			para[index-1]=value;
		}
	}
	
	public DataStore executeQuery() throws Exception {
		DataStore ds=null;
		try {
			ds = new DataStore();
			Session session=null;
			
			session=HibernateSession.currentSession();
			prepare(session);
			setParas(para);
			
			rs=pstmt.executeQuery();
			ResultSetMetaData rsmd=rs.getMetaData();
			String[] column =new String[rsmd.getColumnCount()];
			String[] columnType=new String[rsmd.getColumnCount()];
			for(int i=0;i<column.length;i++){
				column[i]=rsmd.getColumnName(i+1);
				column[i]=column[i].toLowerCase();
				int type=rsmd.getColumnType(i+1);
				if(type==Types.CHAR||type==Types.VARCHAR||type==Types.LONGVARCHAR)
					columnType[i]="string";
				else if(type==Types.NUMERIC)
					columnType[i]="number";
				else if(type==Types.DATE||type==Types.TIME||type==Types.TIMESTAMP)
					columnType[i]="date";
				else if(type==Types.BOOLEAN)
					columnType[i]="boolean";
				else
					columnType[i]="long";
			}
			
			ds.setColumnTypes(columnType);
			
			while(rs.next()){
				for(int j=0;j<column.length;j++){
					if("rowid".equals(column[j].toLowerCase())){
						ds.put(rs.getRow()-1, column[j], rs.getString(j+1));
					}else{
						ds.put(rs.getRow()-1,column[j], rs.getObject(j+1));
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null){
				rs.close();
				rs=null;
			}
			if(pstmt!=null){
				pstmt.close();
				pstmt=null;
			}
			if(conn!=null){
				conn.close();
				conn=null;
			}
		}
		
		
		return ds;
	}
	
	public void executeUpdate() throws Exception {
		Session session=null;
		Transaction ts=null;
		try {
			session=HibernateSession.currentSession();
			
			ts=session.beginTransaction();
			ts.begin();
			
			prepare(session);
			setParas(para);
			pstmt.executeUpdate();
			
			ts.commit();
		} catch (Exception e) {
			ts.rollback();
			throw new Exception(e.getMessage());
		}finally{
			if(rs!=null){
				rs.close();
				rs=null;
			}
			if(pstmt!=null){
				pstmt.close();
				pstmt=null;
			}
			if(conn!=null){
				conn.close();
				conn=null;
			}
		}
	}
	
	public void prepare(Session session) throws Exception {
		conn=session.connection();
		if(conn==null){
			throw new Exception("获取数据库连接出错");
		}
		conn.setAutoCommit(false);
		pstmt=conn.prepareStatement(sqlString);
	}
	
	public void setParas(Object[] para) throws Exception{
		if(para==null)
			return;
		int i=0;
		for(Object o:para){
			if(o instanceof Integer){
				pstmt.setInt(i+1,((Integer)o).intValue());
			}else if(o instanceof Double){
				pstmt.setDouble(i+1, ((Double)o).doubleValue());
			}else if(o instanceof Boolean){
				pstmt.setBoolean(i+1, ((Boolean)o).booleanValue());
			}else if(o instanceof String){
				pstmt.setString(i+1, (String)o);
			}else if(o instanceof java.sql.Date){
				pstmt.setDate(i+1, (java.sql.Date)o);
			}else if(o instanceof java.util.Date){
				pstmt.setDate(i+1, new java.sql.Date(((java.util.Date)o).getTime()));
			}else if(o instanceof java.sql.Timestamp){
				pstmt.setTimestamp(i+1, (java.sql.Timestamp)o);
			}else if(o instanceof NullValue){
				pstmt.setNull(i+1, ((NullValue)o).getType());
			}else{
				throw new Exception("第"+i+"个参数的类型是不支持的！");
			}
			i++;
		}
		
	}
}
