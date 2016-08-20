package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.bean.Book;
import com.bean.Student;
import com.util.hibernate.DataStore;

public class ExcelTool {

	public static int importStuInfo(File file) throws Exception {
		
		String filename=file.getName();
		int dot=filename.lastIndexOf('.');
		if(!".xlsx".equals(filename.substring(dot)))
			throw new Exception("ģ���ļ���ʽ����,��׺��������.xlsx���ļ�");
		
		InputStream inp = new FileInputStream(file);
		Workbook book=WorkbookFactory.create(inp);
		
		Sheet sheet=book.getSheetAt(0);
		int row=getRowNum(book, 0)+1;
		int column=getColumnNum(book, 0);
		System.out.println("��sheetҳ��"+row+"�У�"+column+"��");
		
		DataStore ds=new DataStore();
		String[] stu_info={"id","name","gender","idcard","phone","qq","email","academy","major","class","submajor","subclass","emcontact","emphone","address"};
		System.out.println("�����ͷ��DataStore");
		ds.addRow();
		for(int i=0;i<stu_info.length;i++){
			ds.put(0, stu_info[i], "");
		}
		for(int i=1;i<row;i++){
			ds.addRow();
			Row r=sheet.getRow(i);
			System.out.println("��ʼ�����"+i+"��");
			for(int j=0;j<column;j++){
				Cell cell = r.getCell(j, Row.CREATE_NULL_AS_BLANK);
				switch(cell.getCellType()){  
	               case Cell.CELL_TYPE_BLANK:  
	                 ds.put(i, stu_info[j], "");  
	                 break;  
	               case Cell.CELL_TYPE_BOOLEAN:  
	            	   ds.put(i, stu_info[j], Boolean.toString(cell.getBooleanCellValue()));
	                 break;  
	                //��ֵ  
	               case Cell.CELL_TYPE_NUMERIC:                 
	                 if(DateUtil.isCellDateFormatted(cell)){  
	                	 ds.put(i, stu_info[j], String.valueOf(cell.getDateCellValue()));
	                 }else{   
	                   cell.setCellType(Cell.CELL_TYPE_STRING);  
	                   String temp = cell.getStringCellValue();  
	                   //�ж��Ƿ����С���㣬�������С���㣬�����ַ�����ȡ�������С���㣬��ת��ΪDouble���͵��ַ���  
	                   if(temp.indexOf(".")>-1){  
	                	   ds.put(i, stu_info[j], String.valueOf(new Double(temp)).trim());
	                   }else{  
	                	   ds.put(i, stu_info[j], temp.trim());
	                   }  
	                 }  
	                 break;  
	               case Cell.CELL_TYPE_STRING:  
	            	   ds.put(i, stu_info[j], cell.getStringCellValue().trim());
	                 break;  
	               case Cell.CELL_TYPE_ERROR:  
	            	   ds.put(i, stu_info[j], "");  
	                 break;    
	               case Cell.CELL_TYPE_FORMULA:  
	                 cell.setCellType(Cell.CELL_TYPE_STRING);  
	                 ds.put(i, stu_info[j], cell.getStringCellValue());;  
	                 break;    
	               default:  
	            	   ds.put(i, stu_info[j], "");  
	                 break;  
	             }  
			}
		}
		
		Student.addAll(ds);
		return row-1;
	}
	
public static int importBookInfo(File file) throws Exception {
		
		String[] book_info={"id","name","publisher","author","price"};
		DataStore ds=getData(file, book_info);
		
		Book.addAll(ds);
		return ds.rowCount()-1;
	}


	public static DataStore getData(File file,String[] columns) throws Exception {
		
		String filename=file.getName();
		int dot=filename.lastIndexOf('.');
		if(!".xlsx".equals(filename.substring(dot)))
			throw new Exception("ģ���ļ���ʽ����,��׺��������.xlsx���ļ�");
		
		InputStream inp = new FileInputStream(file);
		Workbook book=WorkbookFactory.create(inp);
		
		Sheet sheet=book.getSheetAt(0);
		int row=getRowNum(book, 0)+1;
		int column=getColumnNum(book, 0);
		System.out.println("��sheetҳ��"+row+"�У�"+column+"��");
		
		DataStore ds=new DataStore();
		ds.addRow();
		for(int i=0;i<columns.length;i++){
			ds.put(0, columns[i], "");
		}
		for(int i=1;i<row;i++){
			ds.addRow();
			Row r=sheet.getRow(i);
			System.out.println("��ʼ�����"+i+"��");
			for(int j=0;j<column;j++){
				Cell cell = r.getCell(j, Row.CREATE_NULL_AS_BLANK);
				switch(cell.getCellType()){  
	               case Cell.CELL_TYPE_BLANK:  
	                 ds.put(i, columns[j], "");  
	                 break;  
	               case Cell.CELL_TYPE_BOOLEAN:  
	            	   ds.put(i, columns[j], Boolean.toString(cell.getBooleanCellValue()));
	                 break;  
	                //��ֵ  
	               case Cell.CELL_TYPE_NUMERIC:                 
	                 if(DateUtil.isCellDateFormatted(cell)){  
	                	 ds.put(i, columns[j], String.valueOf(cell.getDateCellValue()));
	                 }else{   
	                   cell.setCellType(Cell.CELL_TYPE_STRING);  
	                   String temp = cell.getStringCellValue();  
	                   //�ж��Ƿ����С���㣬�������С���㣬�����ַ�����ȡ�������С���㣬��ת��ΪDouble���͵��ַ���  
	                   if(temp.indexOf(".")>-1){  
	                	   ds.put(i, columns[j], String.valueOf(new Double(temp)).trim());
	                   }else{  
	                	   ds.put(i, columns[j], temp.trim());
	                   }  
	                 }  
	                 break;  
	               case Cell.CELL_TYPE_STRING:  
	            	   ds.put(i, columns[j], cell.getStringCellValue().trim());
	                 break;  
	               case Cell.CELL_TYPE_ERROR:  
	            	   ds.put(i, columns[j], "");  
	                 break;    
	               case Cell.CELL_TYPE_FORMULA:  
	                 cell.setCellType(Cell.CELL_TYPE_STRING);  
	                 ds.put(i, columns[j], cell.getStringCellValue());;  
	                 break;    
	               default:  
	            	   ds.put(i, columns[j], "");  
	                 break;  
	             }  
			}
		}
		
		return ds;
	}
	
	 /** 
	   * ����Excel�����indexֵ��ʵ������Ҫ��1 
	   * @return 
	   */  
	  public static int getRowNum(Workbook wb,int sheetIndex){  
	    Sheet sheet = wb.getSheetAt(sheetIndex);  
	    return sheet.getLastRowNum();  
	  }  
	    
	  /** 
	   * �������ݵ����� 
	   * @return  
	   */  
	  public static int getColumnNum(Workbook wb,int sheetIndex){  
	    Sheet sheet = wb.getSheetAt(sheetIndex);  
	    Row row = sheet.getRow(0);  
	    if(row!=null&&row.getLastCellNum()>0){  
	       return row.getLastCellNum();  
	    }  
	    return 0;  
	  }  
}
