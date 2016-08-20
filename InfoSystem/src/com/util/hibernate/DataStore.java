package com.util.hibernate;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Vector;

public class DataStore extends Vector{
	
	String[] columnTypes=null;
	
	public DataStore(){
	}
	
	public DataStore(Vector vector){
		super(vector);
	}
	
	
	
	/**
	 * @return the columnType
	 */
	public String[] getColumnTypes() {
		return columnTypes;
	}

	/**
	 * @param columnType the columnType to set
	 */
	public void setColumnTypes(String[] columnType) {
		this.columnTypes = columnType;
	}

	public int rowCount(){
		return super.size();
	}
	
	private void checkRow(int row) throws Exception {
		if(row<0||row>=rowCount()){
			throw new Exception("行号["+row+"]无效，当前DataStore的行数:"+rowCount());
		}
	}
	
	public DataObject getRow(int row) throws Exception {
		checkRow(row);
		Object o=super.get(row);
		if(o instanceof DataObject)
			return (DataObject)o;
		else if(o instanceof HashMap)
			return new DataObject((HashMap)o);
		else
			throw new Exception("获取行号出错，该类型不支持");
	}
	
	public void addRow(){
		super.add(new DataObject());
	}
	
	public void addRow(DataObject o){
		super.add(o);
	}
	
	public void insertRow(int row,DataObject o) throws Exception {
		if(row!=rowCount())
			checkRow(row);
		super.insertElementAt(o, row);
	}
	
	public void insertRow(int row) throws Exception {
		this.insertRow(row, new DataObject());
	}
	
	/**
	 * 删除某行
	 * @param row
	 * @return
	 * @throws Exception
	 */
	public Object delRow(int row) throws Exception {
		checkRow(row);
		return super.remove(row);
	}
	
	/**
	 * 删除某行某列元素
	 * @param row
	 * @param column
	 * @return
	 * @throws Exception
	 */
	public Object delItem(int row,String column) throws Exception {
		return getRow(row).remove(column);
	}
	
	public void clear(){
		super.clear();
	}
	
	/**
	 * 验证某行是否存在某个元素
	 * @param row
	 * @param column
	 * @return
	 * @throws Exception
	 */
	public boolean containsItem(int row,String column) throws Exception {
		return getRow(row).containsKey(column);
	}
	
	public Object put(int row,String column,Object value) throws Exception {
		if(row==rowCount())
			addRow();
		else
			checkRow(row);
		try{
			DataObject tmp=getRow(row);
			tmp.put(column, value);
			super.set(row, tmp);
			return tmp;
		}catch(Exception e){
			throw new Exception("DataStore rom ["+row+"],"+e.getMessage());
		}
	}
	
	public Object put(int row,String column,int value) throws Exception {
		return put(row, column, new Integer(value));
	}
	
	public Object put(int row,String column,double value) throws Exception {
		return put(row, column, new Double(value));
	}
	
	public Object put(int row,String column,boolean value) throws Exception {
		return put(row, column, new Boolean(value));
	}
	
	public Object getObject(int row,String column) throws Exception {
		try{
			return getRow(row).getObject(column);
		}catch(Exception e){
			throw new Exception("DataStore rom ["+row+"],"+e.getMessage());
		}
	}
	
	public String getString(int row,String column) throws Exception {
		try{
			return getRow(row).getString(column);
		}catch(Exception e){
			throw new Exception("DataStore rom ["+row+"],"+e.getMessage());
		}
	}
	
	public double getDouble(int row,String column) throws Exception {
		try{
			return getRow(row).getDouble(column);
		}catch(Exception e){
			throw new Exception("DataStore rom ["+row+"],"+e.getMessage());
		}
	}
	
	public Double getDoubleClass(int row,String column) throws Exception {
		try{
			return getRow(row).getDoubleClass(column);
		}catch(Exception e){
			throw new Exception("DataStore rom ["+row+"],"+e.getMessage());
		}
	}
	
	public int getInt(int row,String column) throws Exception {
		try{
			return getRow(row).getInt(column);
		}catch(Exception e){
			throw new Exception("DataStore rom ["+row+"],"+e.getMessage());
		}
	}
	
	public Integer getIntClass(int row,String column) throws Exception {
		try{
			return getRow(row).getIntCalss(column);
		}catch(Exception e){
			throw new Exception("DataStore rom ["+row+"],"+e.getMessage());
		}
	}
	
	public boolean getBoolean(int row,String column) throws Exception {
		try{
			return getRow(row).getBoolean(column);
		}catch(Exception e){
			throw new Exception("DataStore rom ["+row+"],"+e.getMessage());
		}
	}
	
	public Date getDate(int row,String column) throws Exception {
		try{
			return getRow(row).getDate(column);
		}catch(Exception e){
			throw new Exception("DataStore rom ["+row+"],"+e.getMessage());
		}
	}
	
	public Collection getColumn(String column) throws Exception {
		ArrayList l=new ArrayList();
		for(int i=0;i<rowCount();i++){
			l.add(i, getObject(i,column));
		}
		return l;
	}
	
	public String[] getColumnName() throws Exception {
		String[] cols=null;
		int lines=super.size();
		if(lines==0)
			return null;
		int size=getRow(0).size();
		
		cols=new String[size];
		Object[] os=getRow(0).keySet().toArray();
		for(int i=0;i<cols.length;i++){
			cols[i]=(String)os[i];
		}
		return cols;
	}
	
	public String getColumnType(String colName) throws Exception {
		String otype=null;
		
		String[] column=getColumnName();
		for(int i=0;i<column.length;i++){
			if(column[i].equals(colName)){
				otype=this.getColumnTypes()[i];
				break;
			}
		}
		
		return otype;
	}
}
