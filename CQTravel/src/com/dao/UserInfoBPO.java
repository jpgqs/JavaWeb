package com.dao;

import java.util.ArrayList;
import java.util.Map;

import com.bean.UserInfo;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class UserInfoBPO {

	private static Sql sql=new Sql();
	
	public static UserInfo getInfoById(String id) throws Exception {
		
		if(Tools.isNull(id))
			return null;
		
		sql.setSql("select * from s_user_info where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，用户信息不存在");
		}
		
		UserInfo u=new UserInfo();
		u.setId(ds.getString(0, "id"));
		u.setNickname(ds.getString(0, "nickname"));
		u.setGender(ds.getInt(0, "gender"));
		u.setCity(ds.getString(0, "city"));
		u.setBirth(Tools.dateToString(ds.getDate(0, "birth"), "yyyy-mm-dd"));
		u.setSignature(ds.getString(0, "signature"));
		u.setHeadpicture(ds.getString(0, "headpicture"));
		u.setIdcard(ds.getString(0, "idcard"));
		u.setPhone(ds.getString(0, "phone"));
		u.setQq(ds.getString(0, "qq"));
		u.setEmail(ds.getString(0, "email"));
		return u;
	}

	public static UserInfo alterBasicInfo(String id, String name, String gender,
			String city, String birth, String signature) throws Exception {
		
		if(Tools.isNull(id))
			return null;
		
		sql.setSql("select * from s_user_info where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，用户信息不存在");
		}
		
		sql.setSql("update s_user_info set nickname = ?,gender = ?,city = ?,birth = ?,signature = ? where id = ?");
		sql.setString(1, name);
		sql.setInt(2, Integer.parseInt(gender));
		sql.setString(3, city);
		sql.setDate(4, Tools.stringToDate(birth, "yyyy-mm-dd"));
		sql.setString(5, signature);
		sql.setString(6, id);
		sql.executeUpdate();
		
		return getInfoById(id);
		
	}
	
	public static void main(String[] args) throws Exception {
		UserInfoBPO.alterBasicInfo("admin123", "张三", "1", "", "1994-02-12", "去旅行");
	}

	public static void addHeadPicture(String id, String path) throws Exception {
		if(Tools.isNull(id))
			return;
		
		sql.setSql("select * from s_user_info where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，用户信息不存在");
		}
		
		sql.setSql("update s_user_info set headpicture = ? where id = ?");
		sql.setString(1, path);
		sql.setString(2, id);
		sql.executeUpdate();
	}

	public static UserInfo addEmail(String id, String email) throws Exception {
		if(Tools.isNull(id))
			return null;
		
		sql.setSql("select * from s_user_info where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，用户信息不存在");
		}
		
		sql.setSql("update s_user_info set email = ? where id = ?");
		sql.setString(1, email);
		sql.setString(2, id);
		sql.executeUpdate();
		
		return getInfoById(id);
	}

	public static UserInfo addPhone(String id, String phone)  throws Exception {
		if(Tools.isNull(id))
			return null;
		
		sql.setSql("select * from s_user_info where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，用户信息不存在");
		}
		
		sql.setSql("update s_user_info set phone = ? where id = ?");
		sql.setString(1, phone);
		sql.setString(2, id);
		sql.executeUpdate();
		
		return getInfoById(id);
	}

	public static String getPicPathById(String id) throws Exception {
		if(Tools.isNull(id))
			return null;
		
		sql.setSql("select headpicture from s_user_info where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，用户信息不存在");
		}
		
		return ds.getString(0, "headpicture");
	}

	public static ArrayList<UserInfo> searchUserList(Map<String,String> data) throws Exception {
		String username=data.get("username");
		String nickname=data.get("nickname");
		String gender=data.get("gender");
		String city=data.get("city");
		String phone=data.get("phone");
		String qq=data.get("qq");
		
		StringBuffer sb=new StringBuffer();
		if(username!=null&&!"".equals(username)){
			sb.append(" and id like '"+username+"' "); 
		}
		if(nickname!=null&&!"".equals(nickname)){
			sb.append(" and nickname like '"+nickname+"' "); 
		}
		if(gender!=null&&!"".equals(gender)){
			sb.append(" and gender = "+gender);
		}
		if(city!=null&&!"".equals(city)){
			sb.append(" and city like '"+city+"' "); 
		}
		if(phone!=null&&!"".equals(phone)){
			sb.append(" and phone like '"+phone+"' "); 
		}
		if(qq!=null&&!"".equals(qq)){
			sb.append(" and qq like '"+qq+"' "); 
		}
		
		sql.setSql("select * from s_user_info where 1=1 "+sb.toString());
		//System.out.println(sql.getSql());
		DataStore ds=sql.executeQuery();
		
		ArrayList<UserInfo> userList=new ArrayList<UserInfo>();
		for(int i=0;i<ds.rowCount();i++){
			UserInfo ui=new UserInfo();
			ui.setId(ds.getString(i, "id"));
			ui.setNickname(ds.getString(i, "nickname"));
			ui.setGender(ds.getInt(i, "gender"));
			ui.setCity(ds.getString(i, "city"));
			ui.setBirth(Tools.dateToString(ds.getDate(i, "birth"), "yyyy-mm-dd"));
			ui.setSignature(ds.getString(i, "signature"));
			ui.setHeadpicture(ds.getString(i, "headpicture"));
			ui.setIdcard(ds.getString(i, "idcard"));
			ui.setPhone(ds.getString(i, "phone"));
			ui.setQq(ds.getString(i, "qq"));
			ui.setEmail(ds.getString(i, "email"));
			
			userList.add(ui);
		}
		
		return userList;
	}
	
}
