package com.dao;

import java.util.ArrayList;
import java.util.Date;

import com.bean.Order;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class OrderBPO {
	private static Sql sql=new Sql();

	public static void addHotelOrder(String hotelid, String userid,int datecount,String beginday,String endday) throws Exception {
		Date date=new Date(System.currentTimeMillis());
		String id=Tools.dateToString(date, "yyyyMMddHHmmss");
		
		sql.setSql("select max(id) id from s_order where id like ? ");
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
		
		sql.setSql("select * from s_hotel where id = ?");
		sql.setString(1, hotelid);
		ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，酒店信息不存在");
		}
		double price=ds.getDouble(0, "price");
		String hotelname=ds.getString(0, "name");
		String hoteladdress=ds.getString(0, "address");
		
		sql.setSql("insert into s_order "
				+ "values(?,1,?,?,?,now(),?,?,?,?)");
		sql.setString(1, id);
		sql.setString(2, hotelid);
		sql.setString(3, hotelname);
		sql.setString(4, hoteladdress);
		sql.setDouble(5, price*datecount);
		sql.setString(6, userid);
		sql.setDate(7, Tools.stringToDate(beginday, "yyyy-MM-dd"));
		sql.setDate(8, Tools.stringToDate(endday, "yyyy-MM-dd"));
		sql.executeUpdate();
	}

	public static ArrayList<Order> getOrdersByUser(String user) throws Exception {
		
		sql.setSql("select * from s_order where userid = ? order by ordertime desc ");
		sql.setString(1, user);
		DataStore ds=sql.executeQuery();
		ArrayList<Order> orders=new ArrayList<Order>();
		for(int i=0;i<ds.rowCount();i++){
			Order order =new Order();
			order.setId(ds.getString(i, "id"));
			order.setObjtype(ds.getInt(i, "objtype"));
			order.setObjid(ds.getString(i, "objid"));
			order.setObjname(ds.getString(i, "objname"));
			order.setObjext(ds.getString(i, "objext"));
			order.setOrdertime(Tools.dateToString(ds.getDate(i, "ordertime"),"yyyy/MM/dd HH:mm:ss"));
			order.setPrice(ds.getDouble(i, "price"));
			order.setUserid(ds.getString(i, "userid"));
			order.setBeginday(Tools.dateToString(ds.getDate(i, "begintime"), "yyyy-MM-dd"));
			order.setEndday(Tools.dateToString(ds.getDate(i, "endtime"), "yyyy-MM-dd"));
			
			orders.add(order);
		}
		return orders;
	}
	
}
