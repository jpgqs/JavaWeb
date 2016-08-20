package com.dao;

import java.util.ArrayList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.bean.Hotel;
import com.bean.View;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class ViewBPO {

	private Sql sql=new Sql();

	public View getViewById(String id) throws Exception {
		if(Tools.isNull(id))
			return null;
		
		sql.setSql("select * from s_view where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，景点信息不存在");
		}
		
		View view=new View();
		view.setId(ds.getString(0, "id"));
		view.setLocation(ds.getString(0, "location"));
		view.setName(ds.getString(0, "name"));
		view.setAddress(ds.getString(0, "address"));
		view.setDescription(ds.getString(0, "description"));
		view.setCheckin(ds.getString(0, "checkin"));
		view.setComment(ds.getString(0, "comment"));
		view.setPrice((float)ds.getDouble(0, "price"));
		view.setOpt(ds.getInt(0, "opt"));
		view.setHeadpicture(ds.getString(0, "headpicture"));
		view.setExtra(ds.getString(0, "extra"));
		
		return view;
	}

	public ArrayList<View> searchViewList(JSONObject data) throws Exception {
		String id=data.getString("id");
		String location=data.getString("location");
		String name=data.getString("name");
		String address=data.getString("address");
		
		StringBuffer sb=new StringBuffer();
		if(id!=null&&!"".equals(id)){
			sb.append(" and id like '"+id+"' "); 
		}
		if(location!=null&&!"".equals(location)){
			sb.append(" and location like '"+location+"' "); 
		}
		if(name!=null&&!"".equals(name)){
			sb.append(" and name like '"+name+"' ");
		}
		if(address!=null&&!"".equals(address)){
			sb.append(" and address like '"+address+"' "); 
		}
		
		sql.setSql("select * from s_view where 1=1 "+sb.toString());
		//System.out.println(sql.getSql());
		DataStore ds=sql.executeQuery();
		
		ArrayList<View> viewList=new ArrayList<View>();
		for(int i=0;i<ds.rowCount();i++){
			View v=new View();
			
			v.setId(ds.getString(i, "id"));
			v.setLocation(ds.getString(i, "location"));
			v.setName(ds.getString(i, "name"));
			v.setAddress(ds.getString(i, "address"));
			v.setDescription(ds.getString(i, "description"));
			v.setCheckin(ds.getString(i, "checkin"));
			v.setComment(ds.getString(i, "comment"));
			v.setPrice((float)ds.getDouble(i, "price"));
			v.setOpt(ds.getInt(i, "opt"));
			v.setHeadpicture(ds.getString(i, "headpicture"));
			v.setExtra(ds.getString(i, "extra"));
			
			viewList.add(v);
		}
		
		return viewList;
	}

	public void deleteViewById(String id) throws Exception {
		sql.setSql("select * from s_view where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，景点信息不存在");
		}
		
		sql.setSql("delete from s_view where id = ?");
		sql.setString(1, id);
		sql.executeUpdate();
	}

	public void alterView(JSONObject params) throws Exception {
		String id=params.getString("id");
		String location=params.getString("location");
		String name=params.getString("name");
		String address=params.getString("address");
		String description=params.getString("description");
		String checkin=params.getString("checkin");
		String comment=params.getString("comment");
		String price=params.getString("price");
		
		if(Tools.isNull(id))
			throw new Exception("系统错误，景点编号为空");
		
		sql.setSql("select * from s_view where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("系统错误，景点信息不存在");
		}
		StringBuffer sb=new StringBuffer();
		sb.append("update s_view set location = ? , ");
		sb.append("		name = ? , ");
		sb.append("		address = ? , ");
		sb.append("		description = ? , ");
		sb.append("		checkin = ? , ");
		sb.append("		comment = ? , ");
		sb.append("		price = ? ");
		sb.append(" where id = ? ");
		
		sql.setSql(sb.toString());
		sql.setString(1, location);
		sql.setString(2, name);
		sql.setString(3, address);
		sql.setString(4, description);
		sql.setString(5, checkin);
		sql.setString(6, comment);
		sql.setDouble(7, Double.parseDouble(price));
		sql.setString(8, id);
		
		sql.executeUpdate();
	}

	public void insertView(JSONArray objs) throws Exception {
		for(int i=0;i<objs.size();i++){
			JSONObject view=objs.getJSONObject(i);
			
			String id=view.getString("id");
			String location=view.getString("location");
			String name=view.getString("name");
			String address=view.getString("address");
			String description=view.getString("description");
			String checkin=view.getString("checkin");
			String comment=view.getString("comment");
			String price=view.getString("price");
			String extra=view.getString("ext");
			if("".equals(price)){
				price="0";
			}
			
			if("".equals(id)||"".equals(name)){
				throw new Exception("第"+(i+1)+"行,景点编号和名称不能为空！");
			}
			//System.out.println(id+":"+location+":"+name+":"+address+":"+description+":"+checkin+":"+tips+":"+comment+":"+price+":"+roomtype+":"+view);
			sql.setSql("insert into s_view(id,location,name,address,description,checkin,comment,price,extra) "
					+ "values(?,?,?,?,?,?,?,?,?) ");
			sql.setString(1, id);
			sql.setString(2, location);
			sql.setString(3, name);
			sql.setString(4, address);
			sql.setString(5, description);
			sql.setString(6, checkin);
			sql.setString(7, comment);
			sql.setDouble(8, Double.parseDouble(price));
			sql.setString(9, extra);
			
			try {
				sql.executeUpdate();
			} catch (Exception e) {
				if(e.getMessage().startsWith("10001")){
					throw new Exception("插入第"+(i+1)+"行时失败，id["+id+"]存在重复记录，本次共插入"+i+"行");
				}else{
					throw new Exception(e.getMessage());
				}
			}
		}
	}
	
	public View getSuggestView(String key) throws Exception {
		
		sql.setSql("SELECT * FROM s_view WHERE location LIKE ? "
				+ " OR NAME LIKE ? OR address LIKE ? "
				+ " ORDER BY opt DESC LIMIT 1");
		sql.setString(1, "%"+key+"%");
		sql.setString(2, "%"+key+"%");
		sql.setString(3, "%"+key+"%");
		DataStore ds=sql.executeQuery();
		
		View view=null;
		if(ds.rowCount()>0){
			view=new View();
			view.setId(ds.getString(0, "id"));
			view.setLocation(ds.getString(0, "location"));
			view.setName(ds.getString(0, "name"));
			view.setAddress(ds.getString(0, "address"));
			view.setDescription(ds.getString(0, "description"));
			view.setCheckin(ds.getString(0, "checkin"));
			view.setComment(ds.getString(0, "comment"));
			view.setPrice((float)ds.getDouble(0, "price"));
			view.setOpt(ds.getInt(0, "opt"));
			view.setHeadpicture(ds.getString(0, "headpicture"));
			view.setExtra(ds.getString(0, "extra"));
		}
		
		return view;
	}
	
	
}
