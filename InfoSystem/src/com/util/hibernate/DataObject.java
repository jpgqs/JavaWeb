package com.util.hibernate;

import java.util.Date;
import java.util.HashMap;
import java.util.Set;

import com.util.Tools;

public class DataObject extends HashMap{

	public DataObject(){}
	
	public DataObject(HashMap map){
		super(map);
	}
	
	public boolean containsKey(String key) {
		key=key.toLowerCase();
		return super.containsKey(key);
	}
	
	public Set keySet() {
		return super.keySet();
	}
	
	public void clear() {
		super.clear();
	}
	
	public Object put(String key,Object value) throws Exception {
		if(key==null||key.equals(""))
			throw new Exception("关键字为空");
		key=key.toLowerCase();
		if(value instanceof java.sql.Date)
			value=new Date(((java.sql.Date)value).getTime());
		if(value instanceof java.sql.Timestamp)
			value=new Date(((java.sql.Timestamp)value).getTime());
		return super.put(key, value);
	}
	
	public Object put(String key,int value) throws Exception {
		return put(key,new Integer(value));
	}
	
	public Object put(String key,double value) throws Exception {
		return put(key,new Double(value));
	}
	
	public Object put(String key,boolean value) throws Exception {
		return put(key,new Boolean(value));
	}
	
	public Object getObject(String key) throws Exception {
		if(key==null||key.equals(""))
			throw new Exception("关键字为空");
		key=key.toLowerCase();
		
		if(!containsKey(key))
			throw new Exception("关键字"+key+"不存在");
		
		return super.get(key);
	}
	
	public double getDouble(String key) throws Exception {
		Object o=getObject(key);
		if(o==null){
			return 0;
		}
		if(o instanceof Double)
			return ((Double)o).doubleValue();
		else
			return Double.parseDouble(o.toString());
	}
	
	public Double getDoubleClass(String key) throws Exception {
		Object o=getObject(key);
		if(o==null){
			return null;
		}
		if(o instanceof Double)
			return ((Double)o).doubleValue();
		else
			return Double.parseDouble(o.toString());
	}
	
	public int getInt(String key) throws Exception {
		Object o=getObject(key);
		if(o==null){
			return 0;
		}
		if(o instanceof Double)
			return ((Integer)o).intValue();
		else
			return Integer.parseInt(o.toString());
	}
	
	public Integer getIntCalss(String key) throws Exception {
		Object o=getObject(key);
		if(o==null){
			return null;
		}
		if(o instanceof Double)
			return ((Integer)o).intValue();
		else
			return Integer.parseInt(o.toString());
	}
	
	public boolean getBoolean(String key) throws Exception {
		Object o=getObject(key);
		if(o==null){
			return false;
		}
		if(o instanceof Boolean)
			return ((Boolean)o).booleanValue();
		else{
			if("true".equals(o.toString().toLowerCase()))
				return true;
			else 
				return false;
		}
	}
	
	public Date getDate(String key) throws Exception {
		Object o=getObject(key);
		if(o==null){
			return null;
		}
		if(o instanceof Date)
			return (Date)o;
		else
			return Tools.stringToDate(o.toString(), "yyyyMMddhhmmss");
	}
	
	public String getString(String key) throws Exception {
		Object o=getObject(key);
		if(o==null){
			return null;
		}
		if(o instanceof String)
			return (String)o;
		else 
			throw new Exception("该key["+key+"]对应的元素不是字符串");
	}
	
	public DataObject getDataObject(String key) throws Exception {
		Object o=getObject(key);
		if(o==null){
			return null;
		}
		if(o instanceof DataObject)
			return (DataObject)o;
		else 
			throw new Exception("该key["+key+"]对应的元素不是DataObject");
	}
	
	public Object remove(String key){
		key=key.toLowerCase();
		return super.remove(key);
	}
}
