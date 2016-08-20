package com.dao;

import com.bean.Administrator;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class AdministratorBPO {

	private static Sql sql=new Sql();
	
	public static Administrator getContact() throws Exception{
		sql.setSql("select * from s_admin_info");
		DataStore ds=sql.executeQuery();
		
		Administrator admin=new Administrator();
		admin.setPhone(ds.getString(0, "phone"));
		admin.setQq(ds.getString(0, "qq"));
		admin.setEmail(ds.getString(0, "email"));
		
		return admin;
	}

	public static Administrator loginCheck(String id, String pwd) throws Exception {
		
		if(Tools.isNull(id)||Tools.isNull(pwd))
			return null;
		
		sql.setSql("select * from s_admin where id= ?");
		sql.setString(1, id);
		
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("用户名不存在");
		}
		String password=ds.getString(0, "pwd");
		if(!pwd.equals(password))
			throw new Exception("密码错误");
		
		Administrator admin=new Administrator();
		admin.setId(id);
		admin.setPwd(pwd);
		
		return admin;
	}
}
