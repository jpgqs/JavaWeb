package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class dbConn {

	private static dbConn dbconn; 
	static {
		dbconn=new dbConn();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private dbConn(){}
	
	public static void main(String[] args) {
		Connection connection=dbConn.getConnection();
		String sql="select * from user";
		PreparedStatement pstat=dbConn.getPreparedStatement(connection, sql);
		ResultSet rs=null;
		try {
			rs=pstat.executeQuery();
			rs.next();
			String name=rs.getString("user");
			String password=rs.getString("password");
			System.out.println("user:"+name+", password:"+password);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstat.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}
	public static Connection getConnection(){
		Connection conn=null;
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?user=root&password=root123");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void closeConnection(Connection conn){
			try {
				if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
	}
	
	public static Statement getStatement(Connection conn){
		Statement stmt=null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}
	
	public static void closeStatement(Statement stmt){//因为PreparedStatement是Statement的子类，所以该函数也可以关闭获取到的PreparedStatement
		try {
			if(stmt!=null)
				stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static PreparedStatement getPreparedStatement(Connection conn,String sql){
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	
	public static PreparedStatement getPreparedStatement(Connection conn,String sql,boolean generatedKey){
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	
	public static ResultSet excuteQuery(Statement stmt,String sql){
		ResultSet rs=null;
		try {
			rs=stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static void closeQuery(ResultSet rs){
		try {
			if(rs!=null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
