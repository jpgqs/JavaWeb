package com.dao;

import com.bean.Admin;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class AdminBPO {

	private Sql sql=new Sql();

	public Admin login(String passport, String password) throws Exception {
		if(Tools.isNull(passport)||Tools.isNull(password))
			return null;
		
		sql.setSql("select * from admin where passport= ?");
		sql.setString(1, passport);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("����Ա������");
		}
		String pwd=ds.getString(0, "password");
		if(!password.equals(pwd))
			throw new Exception("�������");
		
		if(ds.getInt(0, "valid")==0){
			throw new Exception("�ù���Ա�˺���ʧЧ");
		}
		
		Admin admin=new Admin();
		admin.setPassport(passport);
		admin.setPassword(pwd);
		admin.setValid(1);
		
		return admin;
	}
}
