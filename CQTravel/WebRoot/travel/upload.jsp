<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ include file="_sessioncheck.jsp"%>
<%@ page import="com.bean.UserInfo" %>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

<%
	
	try {

		DiskFileItemFactory factory = new DiskFileItemFactory();
		String path = request.getSession().getServletContext()
				.getRealPath("file\\headpic");
		File f = new File(path);
		//System.out.println(path);
		if (!f.exists())
			f.mkdirs();
		factory.setRepository(f);
		factory.setSizeThreshold(1024 * 1024);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(1024*5000);
		List<FileItem> list = upload.parseRequest(request);
		File newfile = null;
		//System.out.println(list.size());
		for (FileItem item : list) {
			if (item.isFormField()) {
				String name = item.getFieldName();
				String value = item.getString("UTF-8");
				request.setAttribute(name, value);
			} else {
				String name = item.getFieldName();
				String value = item.getName();
				//System.out.println(name+"-"+value);
				int start = value.lastIndexOf(".");
				String filetag = value.substring(start);
				String fileName=u.getId()+filetag;
				//System.out.println(fileName);
				request.setAttribute(name, fileName);
				newfile = new File(path, fileName);
				//System.out.println(path+"\\"+fileName);
				if(newfile.exists()){
					newfile.delete();
				}
				item.write(newfile);
				String userpath=path.substring(path.indexOf("file"))+"\\"+fileName;
				//System.out.println(userpath);
				UserInfo.addHeadPicture(u.getId(), userpath.replace("\\", "/"));
				
				u=User.getUserById(u.getId());
				session.removeAttribute("user");
				session.setAttribute("user", u);
			}
		}
		out.println("<script type=\"text/javascript\">");
		out.println("alert('图片上传成功');");
		out.println("</script>");
		out.flush();
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('上传图片失败：" + e.getMessage() + "');");
		out.println("history.back();");
		out.println("</script>");
		out.flush();
	}
	out.println("<script  type=\"text/javascript\"> ");
		out.println(" window.location.replace(\"myheadpic.jsp\");");
		out.println("</script> ");
%>
