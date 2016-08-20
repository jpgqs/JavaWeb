package com.dao;

import java.util.ArrayList;

import net.sf.json.JSONObject;

import com.bean.Hotel;
import com.bean.Note;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class CommonBPO {

	private Sql sql;
	
	public CommonBPO(){
		sql=new Sql();
	}
	
	public ArrayList<JSONObject> getAllSuggest(String key) throws Exception {
		
		ArrayList<JSONObject> list=new ArrayList<JSONObject>();
		sql.setSql("SELECT * FROM s_note WHERE location LIKE ? "
				+ " OR title LIKE ? ORDER BY readtime*0.2+opt*0.3+reply*0.4+collect*0.1 DESC LIMIT 1");
		sql.setString(1, "%"+key+"%");
		sql.setString(2, "%"+key+"%");
		DataStore ds=sql.executeQuery();
		
		Note n=null;
		if(ds.rowCount()>0){
			
			n=new Note();
			n.setId(ds.getString(0, "id"));
			n.setTitle(ds.getString(0, "title"));
			n.setAuthor(ds.getString(0, "author"));
			n.setUploadtime(Tools.dateToString(ds.getDate(0, "uploadtime"), "yyyy/MM/dd HH:mm:ss"));
			n.setReadtime(ds.getInt(0, "readtime")+1);
			n.setOpt(ds.getInt(0, "opt"));
			n.setReply(ds.getInt(0, "reply"));
			n.setCollect(ds.getInt(0, "collect"));
			n.setLocation(ds.getString(0, "location"));
			n.setFlag(ds.getInt(0, "flag"));
			n.setHeadpicture(ds.getString(0, "headpicture"));
			n.setContent(ds.getString(0, "content"));
			n.setHtmlcode(ds.getString(0, "htmlcode"));
			JSONObject note=JSONObject.fromObject(n);
			note.put("type", "note");
			list.add(note);
		}
		
		sql.setSql("SELECT * FROM s_hotel WHERE location LIKE ? "
				+ " OR NAME LIKE ? OR address LIKE ? "
				+ " OR VIEW LIKE ? ORDER BY opt DESC LIMIT 1");
		sql.setString(1, "%"+key+"%");
		sql.setString(2, "%"+key+"%");
		sql.setString(3, "%"+key+"%");
		sql.setString(4, "%"+key+"%");
		ds=sql.executeQuery();
		
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
			JSONObject ahotel=JSONObject.fromObject(hotel);
			ahotel.put("type", "hotel");
			list.add(ahotel);
		}
		
		
		return list;
	}
}
