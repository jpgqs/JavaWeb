package com.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.bean.Hotel;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class HotelBPO {
	
	private static Sql sql=new Sql();

	public static ArrayList<Hotel> getThreeHotels() throws Exception{
		sql.setSql("SELECT * FROM s_hotel ORDER BY opt DESC LIMIT 3");
		DataStore ds=sql.executeQuery();
		ArrayList<Hotel> hotels=new ArrayList<Hotel>();
		for(int i=0;i<ds.rowCount();i++){
			Hotel hotel=new Hotel();
			hotel.setId(ds.getString(i, "id"));
			hotel.setLocation(ds.getString(i, "location"));
			hotel.setName(ds.getString(i, "name"));
			hotel.setAddress(ds.getString(i, "address"));
			hotel.setDescription(ds.getString(i, "description"));
			hotel.setCheckin(ds.getString(i, "checkin"));
			hotel.setTips(ds.getString(i, "tips"));
			hotel.setComment(ds.getString(i, "comment"));
			hotel.setPrice((float)ds.getDouble(i, "price"));
			hotel.setRoomtype(ds.getInt(i, "roomtype")+"");
			hotel.setOpt(ds.getInt(i, "opt"));
			hotel.setView(ds.getString(i, "view"));
			hotel.setHeadpicture(ds.getString(i, "headpicture"));
			
			hotels.add(hotel);
		}
		return hotels;
	}

	public static Hotel getHotelById(String id) throws Exception {
		if(Tools.isNull(id))
			return null;
		
		sql.setSql("select * from s_hotel where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，酒店信息不存在");
		}
		
		Hotel hotel=new Hotel();
		hotel.setId(ds.getString(0, "id"));
		hotel.setLocation(ds.getString(0, "location"));
		hotel.setName(ds.getString(0, "name"));
		hotel.setAddress(ds.getString(0, "address"));
		hotel.setDescription(ds.getString(0, "description"));
		hotel.setCheckin(ds.getString(0, "checkin"));
		hotel.setTips(ds.getString(0, "tips"));
		hotel.setComment(ds.getString(0, "comment"));
		hotel.setPrice((float)ds.getDouble(0, "price"));
		hotel.setRoomtype(ds.getInt(0, "roomtype")+"");
		hotel.setOpt(ds.getInt(0, "opt"));
		hotel.setView(ds.getString(0, "view"));
		hotel.setHeadpicture(ds.getString(0, "headpicture"));
		
		return hotel;
	}

	public static Hotel getSuggestHotel(String key) throws Exception {
		
		sql.setSql("SELECT * FROM s_hotel WHERE location LIKE ? "
				+ " OR NAME LIKE ? OR address LIKE ? "
				+ " OR VIEW LIKE ? ORDER BY opt DESC LIMIT 1");
		sql.setString(1, "%"+key+"%");
		sql.setString(2, "%"+key+"%");
		sql.setString(3, "%"+key+"%");
		sql.setString(4, "%"+key+"%");
		DataStore ds=sql.executeQuery();
		
		Hotel hotel=null;
		if(ds.rowCount()>0){
			hotel=new Hotel();
			hotel.setId(ds.getString(0, "id"));
			hotel.setLocation(ds.getString(0, "location"));
			hotel.setName(ds.getString(0, "name"));
			hotel.setAddress(ds.getString(0, "address"));
			hotel.setDescription(ds.getString(0, "description"));
			hotel.setCheckin(ds.getString(0, "checkin"));
			hotel.setTips(ds.getString(0, "tips"));
			hotel.setComment(ds.getString(0, "comment"));
			hotel.setPrice((float)ds.getDouble(0, "price"));
			hotel.setRoomtype(ds.getInt(0, "roomtype")+"");
			hotel.setOpt(ds.getInt(0, "opt"));
			hotel.setView(ds.getString(0, "view"));
			hotel.setHeadpicture(ds.getString(0, "headpicture"));
		}
		
		return hotel;
	}

	public static Map<String,String> getRoomTypes() throws Exception {
		Map<String,String> types=new HashMap<String,String>();
		
		sql.setSql("select * from global_code where code0 = 'roomtype' and code4 = 1 ");
		DataStore ds=sql.executeQuery();
		
		for(int i=0;i<ds.rowCount();i++){
			String typecode=ds.getString(i, "code2");
			String typevalue=ds.getString(i, "code3");
			types.put(typecode, typevalue);
		}
		
		return types;
	}

	public static ArrayList<Hotel> searchHotelList(JSONObject data) throws Exception {
		String hotelid=data.getString("id");
		String location=data.getString("location");
		String hotelname=data.getString("name");
		String hoteladdress=data.getString("address");
		String roomtype=data.getString("roomtype");
		String hotelview=data.getString("view");
		
		StringBuffer sb=new StringBuffer();
		if(hotelid!=null&&!"".equals(hotelid)){
			sb.append(" and id like '"+hotelid+"' "); 
		}
		if(location!=null&&!"".equals(location)){
			sb.append(" and location like '"+location+"' "); 
		}
		if(hotelname!=null&&!"".equals(hotelname)){
			sb.append(" and name like '"+hotelname+"' ");
		}
		if(hoteladdress!=null&&!"".equals(hoteladdress)){
			sb.append(" and address like '"+hoteladdress+"' "); 
		}
		if(roomtype!=null&&!"0".equals(roomtype)){
			int type=Integer.parseInt(roomtype);
			sb.append(" and roomtype = '"+type+"' "); 
		}
		if(hotelview!=null&&!"".equals(hotelview)){
			sb.append(" and view like '"+hotelview+"' "); 
		}
		
		sql.setSql("select * from s_hotel where 1=1 "+sb.toString());
		//System.out.println(sql.getSql());
		DataStore ds=sql.executeQuery();
		
		ArrayList<Hotel> hotelList=new ArrayList<Hotel>();
		for(int i=0;i<ds.rowCount();i++){
			Hotel h=new Hotel();
			
			h.setId(ds.getString(i, "id"));
			h.setLocation(ds.getString(i, "location"));
			h.setName(ds.getString(i, "name"));
			h.setAddress(ds.getString(i, "address"));
			h.setDescription(ds.getString(i, "description"));
			h.setCheckin(ds.getString(i, "checkin"));
			h.setTips(ds.getString(i, "tips"));
			h.setComment(ds.getString(i, "comment"));
			h.setPrice((float)ds.getDouble(i, "price"));
			int type=ds.getInt(i, "roomtype");
			String types="";
			if(type==1){
				types="标准间";
			}else if(type==2){
				types="商务间";
			}else if(type==3){
				types="家庭间";
			}
			h.setRoomtype(types);
			h.setOpt(ds.getInt(i, "opt"));
			h.setView(ds.getString(i, "view"));
			h.setHeadpicture(ds.getString(i, "headpicture"));
			
			
			hotelList.add(h);
		}
		
		return hotelList;
	}

	public static void deleteHotelById(String id) throws Exception {
		sql.setSql("select * from s_hotel where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，酒店信息不存在");
		}
		
		sql.setSql("delete from s_hotel where id = ?");
		sql.setString(1, id);
		sql.executeUpdate();
	}

	public static void alterHotel(JSONObject hotel) throws Exception {
		String id=hotel.getString("id");
		String location=hotel.getString("location");
		String name=hotel.getString("name");
		String address=hotel.getString("address");
		String description=hotel.getString("description");
		String checkin=hotel.getString("checkin");
		String tips=hotel.getString("tips");
		String comment=hotel.getString("comment");
		String price=hotel.getString("price");
		String roomtype=hotel.getString("roomtype");
		String view=hotel.getString("view");
		
		if(Tools.isNull(id))
			throw new Exception("系统错误，酒店编号为空");
		
		sql.setSql("select * from s_hotel where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，酒店信息不存在");
		}
		StringBuffer sb=new StringBuffer();
		sb.append("update s_hotel set location = ? , ");
		sb.append("		name = ? , ");
		sb.append("		address = ? , ");
		sb.append("		description = ? , ");
		sb.append("		checkin = ? , ");
		sb.append("		tips = ? , ");
		sb.append("		comment = ? , ");
		sb.append("		price = ? , ");
		sb.append("		roomtype = ? , ");
		sb.append("		view = ? ");
		sb.append(" where id = ? ");
		
		sql.setSql(sb.toString());
		sql.setString(1, location);
		sql.setString(2, name);
		sql.setString(3, address);
		sql.setString(4, description);
		sql.setString(5, checkin);
		sql.setString(6, tips);
		sql.setString(7, comment);
		sql.setDouble(8, Double.parseDouble(price));
		sql.setInt(9, Integer.parseInt(roomtype));
		sql.setString(10, view);
		sql.setString(11, id);
		
		sql.executeUpdate();
	}

	public static void insertHotel(JSONArray hotels) throws Exception {
		for(int i=0;i<hotels.size();i++){
			JSONObject hotel=hotels.getJSONObject(i);
			
			String id=hotel.getString("id");
			String location=hotel.getString("location");
			String name=hotel.getString("name");
			String address=hotel.getString("address");
			String description=hotel.getString("description");
			String checkin=hotel.getString("checkin");
			String tips=hotel.getString("tips");
			String comment=hotel.getString("comment");
			String price=hotel.getString("price");
			if("".equals(price)){
				price="0";
			}
			String roomtype=hotel.getString("roomtype");
			String view=hotel.getString("view");
			
			if("".equals(id)||"".equals(name)){
				throw new Exception("第"+(i+1)+"行,酒店编号和名称不能为空！");
			}
			//System.out.println(id+":"+location+":"+name+":"+address+":"+description+":"+checkin+":"+tips+":"+comment+":"+price+":"+roomtype+":"+view);
			sql.setSql("insert into s_hotel(id,location,name,address,description,checkin,tips,comment,price,roomtype,view) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?) ");
			sql.setString(1, id);
			sql.setString(2, location);
			sql.setString(3, name);
			sql.setString(4, address);
			sql.setString(5, description);
			sql.setString(6, checkin);
			sql.setString(7, tips);
			sql.setString(8, comment);
			sql.setDouble(9, Double.parseDouble(price));
			sql.setInt(10, Integer.parseInt(roomtype));
			sql.setString(11, view);
			
			sql.executeUpdate();
		}
	}
	
	public static void add(Hotel hotel) throws Exception {
		if(hotel==null){
			throw new Exception("提交对象为null");
		}
		String id=hotel.getId();
		String name=hotel.getName();
		if(Tools.isNull(id)||Tools.isNull(name)){
			throw new Exception("酒店编号和酒店名称不能为空");
		}
		
		sql.setSql("select * from s_hotel where id = ?");
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()!=0){
			throw new Exception("增加酒店信息失败：酒店编号["+id+"]在数据库中已存在");
		}
		
		String location=hotel.getLocation();
		String address=hotel.getAddress();
		String description=hotel.getDescription();
		String checkin=hotel.getCheckin();
		String tips=hotel.getTips();
		String comment=hotel.getComment();
		double price=hotel.getPrice();
		String roomtype=hotel.getRoomtype();
		String view=hotel.getView();
		String headpicture=hotel.getHeadpicture();
		
		
		sql.setSql("insert into s_hotel(id,location,name,address,description,checkin,tips,comment,price,roomtype,view,headpicture) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?)");
		sql.setString(1, id);
		sql.setString(2, location);
		sql.setString(3, name);
		sql.setString(4, address);
		sql.setString(5, description);
		sql.setString(6, checkin);
		sql.setString(7, tips);
		sql.setString(8, comment);
		sql.setDouble(9, price);
		sql.setInt(10, Integer.parseInt(roomtype));
		sql.setString(11, view);
		sql.setString(12, headpicture);
		
		sql.executeUpdate();
		
		
	}

	public static void addAll(DataStore ds) throws Exception {
		int num=ds.rowCount();
		System.out.println("需要更新的行数"+(num-1));
		for(int i=1;i<num;i++){
			Hotel h=new Hotel();
			
			h.setId(ds.getString(i, "id"));
			h.setLocation(ds.getString(i, "location"));
			h.setName(ds.getString(i, "name"));
			h.setAddress(ds.getString(i, "address"));
			h.setDescription(ds.getString(i, "description"));
			h.setCheckin(ds.getString(i, "checkin"));
			h.setTips(ds.getString(i, "tips"));
			h.setComment(ds.getString(i, "comment"));
			h.setPrice((float)ds.getDouble(i, "price"));
			h.setRoomtype(ds.getInt(i, "roomtype")+"");
			h.setView(ds.getString(i, "view"));
			h.setHeadpicture(ds.getString(i, "headpicture"));
			
			add(h);
		}
	}
}
