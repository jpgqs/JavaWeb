package com.util;

import java.util.Date;

import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class idCard {

	private Sql sql=new Sql();
	private int[] factor={7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
	private static final Date r1900 = new Date(-2209017600000l);
	private String id;
	
	public idCard(String id){
		this.id=id;
	}
	
	
	public String oldToNew(String id){
		StringBuffer news=new StringBuffer(id.substring(0,6));
		news.append("19").append(id.substring(6));
		news.append(getVerifyCode(id));
		return news.toString();
	}
	
	
	public boolean isValid() throws Exception{
		if(id.length()!=15&&id.length()!=18)
			throw new RuntimeException("身份证长度不合法");
		if(id.length()==15)
			oldToNew(id);
		
		return checkAreaCode(id)&&checkBirthDate(id)&&checkVerifyCode(id);
	}
	
	public boolean checkAreaCode(String id) throws Exception{
		String areaCode=id.substring(0,6);
		
		sql.setSql("select 1 from nation where code = ?");
		sql.setString(1, areaCode);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0)
			return false;
		return true;
	}
	
	public boolean checkBirthDate(String id){
		
		String birthDate=id.substring(6, 14);
		
		Date bd;
		try {
			bd = Tools.stringToDate(birthDate, "yyyymmdd");
			if(bd.after(new Date())||bd.before(r1900))
				return false;
			
		} catch (Exception e) {
			throw new RuntimeException("身份证出生日期不合法");
		}
		
		return true;
		
	}
	
	public boolean checkVerifyCode(String id){
		
		String sub=id.substring(17);
		
		return sub.equals(getVerifyCode(id));
	}
	
	public String getVerifyCode(String id){
		if(id.length()<17)
			throw new RuntimeException("身份证号码长度错误");
		int sum=0;
		for(int i=0;i<17;i++){
			char ch=id.charAt(i);
			sum+=((int)(ch-'0'))*factor[i];
		}
		sum%=11;
		if(sum==10)
			return "X";
		return sum+"";
	}
	
	public String genRandomId(){
		String id=null;
		
		return id;
	}
	
}
