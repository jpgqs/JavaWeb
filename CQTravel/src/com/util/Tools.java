package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
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
		
		//����ʽת��Ϊ��׼��ʽ
		format=format.toLowerCase();
		format=format.replace("mm", "MM");
		format=format.replace("hh", "HH");
		
		if(date.length()<format.length())
			throw new Exception("�����ַ����͸�ʽ��ƥ��");
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
		
		//����ʽת��Ϊ��׼��ʽ
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
			throw new Exception("���֤������ڲ��Ϸ��ַ�");
		
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
		//����ַ�������������
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
	
	/** 
	* ���Ƶ����ļ� 
	* @param oldPath String ԭ�ļ�·�� �磺c:/fqf.txt 
	* @param newPath String ���ƺ�·�� �磺f:/fqf.txt 
	* @return boolean 
	*/ 
	public static void copyFile(String oldPath, String newPath) throws Exception{  
		int bytesum = 0; 
		int byteread = 0; 
		File oldfile = new File(oldPath); 
		if (oldfile.exists()) { //�ļ�����ʱ 
			InputStream inStream = new FileInputStream(oldPath); //����ԭ�ļ� 
			FileOutputStream fs = new FileOutputStream(newPath); 
			byte[] buffer = new byte[1444]; 
			int length; 
			while ( (byteread = inStream.read(buffer)) != -1) { 
				bytesum += byteread; //�ֽ��� �ļ���С 
				//System.out.println(bytesum); 
				fs.write(buffer, 0, byteread); 
			} 
			inStream.close(); 
			oldfile.delete();
		} 
	} 
	
	public static Date getDate() throws Exception {
		return new Date(System.currentTimeMillis());
	}
	
	public static int getSingleRandom() throws Exception {
		return ((int)Math.random()*100)%9;
	}
	
	/**
	 * ����id
	 * @return ���ظ�ʽΪyyyyMMddHHmmss+1λ����������ȹ�15λ��
	 * @throws Exception
	 */
	public static String genId() throws Exception {
		String id=dateToString(getDate(), "yyyyMMddHHmmss");
		return id+getSingleRandom();
	}
}
