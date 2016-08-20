package com.dao;

import java.util.ArrayList;

import com.bean.Academy;
import com.bean.Major;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class AcademyBPO {

	private static Sql sql=new Sql();
	
	public static ArrayList<Academy> getAcademies() throws Exception {
		
		sql.setSql("SELECT * FROM p_code WHERE parent= 1 ");
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0){
			throw new Exception("学院代码未初始化");
		}
		
		ArrayList<Academy> al=new ArrayList<Academy>();
		for(int i=0;i<ds.rowCount();i++){
			Academy a=new Academy();
			a.setId(ds.getString(i, "code"));
			a.setName(ds.getString(i, "value"));
			Major[] majors=getMajorsById(ds.getInt(i, "id"));
			if(majors==null){
				majors=new Major[1];
				majors[0]=new Major();
				majors[0].setId(ds.getString(i, "code"));
				majors[0].setName(ds.getString(i, "value"));
			}
			a.setMajor(majors);
			
			al.add(a);
		}
		return al;
	}
	
	public static Major[] getMajorsById(int id) throws Exception {
		
		sql.setSql("SELECT * FROM p_code WHERE id = ? ");
		sql.setInt(1, id);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0){
			throw new Exception("学院代码id["+id+"]不存在");
		}
		
		sql.setSql("SELECT * FROM p_code WHERE parent = ? ");
		sql.setInt(1, id);
		ds=sql.executeQuery();
		if(ds.rowCount()==0){
			return null;
		}
		Major[] majors=new Major[ds.rowCount()];
		for(int i=0;i<ds.rowCount();i++){
			majors[i]=new Major();
			majors[i].setId(ds.getString(i, "code"));
			majors[i].setName(ds.getString(i, "value"));
		}
		
		return majors;
	}

	
	public static void main(String[] args) throws Exception {
		AcademyBPO.getAcademies();
	}

	public static String[] getAllMajorIds() throws Exception {
		
		ArrayList<Academy> al=getAcademies();
		ArrayList<String> ids=new ArrayList<String>();
		for(Academy a:al){
			Major[] majors=a.getMajor();
			for(Major m:majors){
				ids.add(a.getId()+m.getId());
			}
		}
		
		String[] id=new String[ids.size()];
		for(int i=0;i<ids.size();i++){
			id[i]=ids.get(i);
		}
		
		return id;
	}
	
public static String[] getAllMajorNames() throws Exception {
		
		ArrayList<Academy> al=getAcademies();
		ArrayList<String> names=new ArrayList<String>();
		for(Academy a:al){
			Major[] majors=a.getMajor();
			for(Major m:majors){
				names.add(m.getName());
			}
		}
		
		String[] name=new String[names.size()];
		for(int i=0;i<names.size();i++){
			name[i]=names.get(i);
		}
		
		return name;
	}


}
