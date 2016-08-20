package com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.bean.User;

import net.sf.json.JSONObject;

public class UploadServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JSONObject resultJson=new JSONObject();
		try {
			User u=(User)request.getSession().getAttribute("user");
			DiskFileItemFactory factory = new DiskFileItemFactory();
			String path = request.getSession().getServletContext()
					.getRealPath("file\\temp");
			File f = new File(path);
			System.out.println(path);
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
					String relativePath="file/temp/"+fileName;
					resultJson.put("path", relativePath);
					//System.out.println(relativePath);
					request.setAttribute(name, fileName);
					newfile = new File(path, fileName);
					//System.out.println(path+"\\"+fileName);
					if(newfile.exists()){
						newfile.delete();
					}
					item.write(newfile);
				}
			}
			resultJson.put("flag", 1);
		} catch (Exception e) {
			e.printStackTrace();
			resultJson.put("flag", 0);
			resultJson.put("error", e.getMessage());
		}
		
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println(resultJson);
		out.flush();
		out.close();
	}
			
	

}
