<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="com.util.ExcelTool" %>
<%@ include file="_adminsessioncheck.jsp" %>
<%
	int count=0;
	try{
	
		DiskFileItemFactory factory = new DiskFileItemFactory();
        String path = request.getSession().getServletContext().getRealPath(
                "file")+"\\"+session.getId();
        File f=new File(path);
        if(!f.exists())
        	f.mkdirs();
        factory.setRepository(new File(path));
        factory.setSizeThreshold(1024 * 1024);
 
        ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> list = upload.parseRequest(request);
 		File newfile=null;
            for (FileItem item : list) {
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString("UTF-8");
                    request.setAttribute(name, value);
                } else {
                    String name = item.getFieldName();
                    String value = item.getName();
                    int start = value.lastIndexOf("\\");
                    String fileName = value.substring(start + 1);
                    request.setAttribute(name, fileName);
 					newfile=new File(path, fileName);
                    item.write(newfile);
                    if(fileName.contains("studentinfo")){
                    	count=ExcelTool.importStuInfo(newfile);
                    }else{
                    	count=ExcelTool.importBookInfo(newfile);
                    }
                    
                    newfile.delete();
                }
            }
%>
<script type="text/javascript">
	alert("文件上传成功！本次共插入信息<%=count %>条");history.back();
</script>
<%
 	}catch(Exception e){
 	
  		out.println("<script type=\"text/javascript\">");
		out.println("alert('上传文件失败："+e.getMessage()+"');");
		out.println("history.back();");
		out.println("</script>");
 }
%>

