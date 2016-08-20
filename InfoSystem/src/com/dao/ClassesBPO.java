package com.dao;

import com.bean.Classes;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class ClassesBPO {
	
	private static Sql sql=new Sql();

	public static Classes getClassById(String id) throws Exception{
		
		if(Tools.isNull(id))
			return null;
		
		sql.setSql("select * from s_class where id= ?");
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("该班级["+id+"]信息不存在");
		}
		
		Classes c=new Classes();
		c.setId(id);
		c.setAcademy(ds.getString(0, "academy"));
		c.setMajor(ds.getString(0, "major"));
		c.setCounselor(ds.getString(0, "counselor"));
		c.setSlogan(ds.getString(0, "slogan"));
		
		return c;
	}
}
