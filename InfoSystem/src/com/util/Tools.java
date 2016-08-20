package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Tools {
	
	public static Date stringToDate(String date,String format) throws Exception{
		Date vdate=null;
		SimpleDateFormat vsdf=null;
		
		if(date==null||format==null)
			return null;
		
		date=date.trim();
		if(date.length()==0)
			return null;
		
		//将格式转化为标准格式
		format=format.toLowerCase();
		format=format.replace("mm", "MM");
		format=format.replace("hh", "HH");
		
		if(date.length()<format.length())
			throw new Exception("日期字符串和格式不匹配");
		else
			date=date.substring(0,format.length());
		
		vsdf=new SimpleDateFormat(format);
		vsdf.setLenient(false);
		
		vdate=vsdf.parse(date);
		
		return vdate;
	}
	
	public static String dateToString(Date date,String format){
		String vdate=null;
		SimpleDateFormat vsdf=null;
		
		if(date==null||format==null)
			return null;
		
		//将格式转化为标准格式
		format=format.toLowerCase();
		format=format.replace("mm", "MM");
		format=format.replace("hh", "HH");
		
		vsdf=new SimpleDateFormat(format);
		vsdf.setLenient(false);
		
		vdate=vsdf.format(date);
		
		return vdate;
	}
	
	public static String trim(String s) {
		String str=s.trim();
		str=str.replace(" ", "");
		return str;
	}
	
	public static boolean isNull(String s){
		if(s==null)
			return true;
		s=trim(s);
		if(s.length()==0||s.equals(""))
			return true;
		return false;
	}
	
	public static boolean isNumber(String s){
		for(int i=0;i<s.length();i++){
			char ch=s.charAt(i);
			if(ch-'0'>9||ch-'0'<0)
				return false;
		}
		return true;
	}
	
	public static boolean isNumOrStr(String s){
		if(isNull(s))
			return false;
		String str1="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		int i;
	    for (i=0; i<s.length();i++) {
	    	char onechar=s.charAt(i);
	        if (!(str1.indexOf(onechar)!= -1)){
	        	return false;
	        }
	    }
		
		return true;
	}
	
	public static boolean idcardCheck(String id) throws Exception {
		
		String sub=id.substring(0, id.length()-1);
		if(!isNumber(sub))
			throw new Exception("身份证号码存在不合法字符");
		
		idCard idcard=new idCard(id);
		
		return idcard.isValid();
	}
	
	public static String formatTitle(String title,int length) {
		if(title.length()<=length)
			return title;
		String result=title;
		String number="0123456789";
		int numCount=0;
		for(int i=0;i<=length;i++){
			char ch=title.charAt(i);
			if(number.indexOf(ch)!=-1)
				numCount++;
		}
		//如果字符串不包含数字
		if(numCount==0)
			return result.substring(0, length)+"...";
		int al=result.length()-numCount/2;
		if(al<=length)
			return result;
		result=result.substring(0, length+numCount/2)+"...";
		
		return result;
	}
	
	public static String innerHtml(String html){
		String result=html;
		
		result=result.replace("<p>", "");
		result=result.replace("</p>", "");
		result=result.replace("<br>", "");
		result=result.replace("<ol>", "");
		result=result.replace("</ol>", "");
		result=result.replace("<li>", "");
		result=result.replace("</li>", "");
		result=result.replace("<strong>", "");
		result=result.replace("</strong>", "");
		result=result.replace("<em>", "");
		result=result.replace("</em>", "");
		result=result.replace("<ul>", "");
		result=result.replace("</ul>", "");
		result=result.replace("&nbsp;", "");
		
		return result;
	}
	
	public static Date getSemesterDate() throws Exception{
		String year=dateToString(new Date(), "yyyy");
		String date=year+"09";
		return stringToDate(date, "yyyymm");
	}
}
