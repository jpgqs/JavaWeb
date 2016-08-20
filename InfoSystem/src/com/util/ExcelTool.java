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
			throw new Exception("模板文件格式错误,后缀名必须是.xlsx的文件");
		
		InputStream inp = new FileInputStream(file);
		Workbook book=WorkbookFactory.create(inp);
		
		Sheet sheet=book.getSheetAt(0);
		int row=getRowNum(book, 0)+1;
		int column=getColumnNum(book, 0);
		System.out.println("该sheet页共"+row+"行，"+column+"列");
		
		DataStore ds=new DataStore();
		String[] stu_info={"id","name","gender","idcard","phone","qq","email","academy","major","class","submajor","subclass","emcontact","emphone","address"};
		System.out.println("插入表头到DataStore");
		ds.addRow();
		for(int i=0;i<stu_info.length;i++){
			ds.put(0, stu_info[i], "");
		}
		for(int i=1;i<row;i++){
			ds.addRow();
			Row r=sheet.getRow(i);
			System.out.println("开始插入第"+i+"行");
			for(int j=0;j<column;j++){
				Cell cell = r.getCell(j, Row.CREATE_NULL_AS_BLANK);
				switch(cell.getCellType()){  
	               case Cell.CELL_TYPE_BLANK:  
	                 ds.put(i, stu_info[j], "");  
	                 break;  
	               case Cell.CELL_TYPE_BOOLEAN:  
	            	   ds.put(i, stu_info[j], Boolean.toString(cell.getBooleanCellValue()));
	                 break;  
	                //数值  
	               case Cell.CELL_TYPE_NUMERIC:                 
	                 if(DateUtil.isCellDateFormatted(cell)){  
	                	 ds.put(i, stu_info[j], String.valueOf(cell.getDateCellValue()));
	                 }else{   
	                   cell.setCellType(Cell.CELL_TYPE_STRING);  
	                   String temp = cell.getStringCellValue();  
	                   //判断是否包含小数点，如果不含小数点，则以字符串读取，如果含小数点，则转换为Double类型的字符串  
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
			throw new Exception("模板文件格式错误,后缀名必须是.xlsx的文件");
		
		InputStream inp = new FileInputStream(file);
		Workbook book=WorkbookFactory.create(inp);
		
		Sheet sheet=book.getSheetAt(0);
		int row=getRowNum(book, 0)+1;
		int column=getColumnNum(book, 0);
		System.out.println("该sheet页共"+row+"行，"+column+"列");
		
		DataStore ds=new DataStore();
		ds.addRow();
		for(int i=0;i<columns.length;i++){
			ds.put(0, columns[i], "");
		}
		for(int i=1;i<row;i++){
			ds.addRow();
			Row r=sheet.getRow(i);
			System.out.println("开始插入第"+i+"行");
			for(int j=0;j<column;j++){
				Cell cell = r.getCell(j, Row.CREATE_NULL_AS_BLANK);
				switch(cell.getCellType()){  
	               case Cell.CELL_TYPE_BLANK:  
	                 ds.put(i, columns[j], "");  
	                 break;  
	               case Cell.CELL_TYPE_BOOLEAN:  
	            	   ds.put(i, columns[j], Boolean.toString(cell.getBooleanCellValue()));
	                 break;  
	                //数值  
	               case Cell.CELL_TYPE_NUMERIC:                 
	                 if(DateUtil.isCellDateFormatted(cell)){  
	                	 ds.put(i, columns[j], String.valueOf(cell.getDateCellValue()));
	                 }else{   
	                   cell.setCellType(Cell.CELL_TYPE_STRING);  
	                   String temp = cell.getStringCellValue();  
	                   //判断是否包含小数点，如果不含小数点，则以字符串读取，如果含小数点，则转换为Double类型的字符串  
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
	   * 返回Excel最大行index值，实际行数要加1 
	   * @return 
	   */  
	  public static int getRowNum(Workbook wb,int sheetIndex){  
	    Sheet sheet = wb.getSheetAt(sheetIndex);  
	    return sheet.getLastRowNum();  
	  }  
	    
	  /** 
	   * 返回数据的列数 
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
