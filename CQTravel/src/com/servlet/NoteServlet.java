package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.bean.Note;
import com.bean.NoteReply;
import com.bean.User;
import com.bean.UserInfo;
import com.util.Tools;

public class NoteServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JSONObject resultJson=new JSONObject();
		
		String type=request.getParameter("type");
		
		if("addnote".equals(type)){
			String username=request.getParameter("username");
			String headpath=request.getParameter("headpath");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			String html=request.getParameter("html");
//			System.out.println(html);
			try {
				String id=null;
				if(headpath!=null&&headpath.length()!=0){
					String path = request.getSession().getServletContext()
							.getRealPath(headpath);
					String notepath=path.replace("temp", "notepic");
					headpath=headpath.replace("temp", "notepic");
					
					id=Note.add(title, headpath, username, content, html);
					notepath=notepath.replace(username, id);
					Tools.copyFile(path, notepath);
				}else{
					id=Note.add(title, username, content, html);
				}
				resultJson.put("flag", 1);
				resultJson.put("note", id);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("flag", 0);
				resultJson.put("errorinfo", e.getMessage());
			}
		}else if("notereply".equals(type)){
			String noteId=request.getParameter("noteid");
			String author=request.getParameter("author");
			String replided=request.getParameter("replided");
			String html=request.getParameter("html");
			String content=request.getParameter("content");
			
			try {
				String id=NoteReply.add(noteId, author, replided, content, html);
				Note.addReply(id);
				resultJson.put("flag", 1);
				resultJson.put("note", noteId);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("flag", 0);
				resultJson.put("errorinfo", e.getMessage());
			}
		}else if("hotnote".equals(type)){
			String index=request.getParameter("index");
			int begin=(Integer.parseInt(index)-1)*10;
			try {
				ArrayList<Note> notes=Note.getHotNotes(begin, 10);
				ArrayList<UserInfo> uis=new ArrayList<UserInfo>();
				for(Note note:notes){
					uis.add(UserInfo.getInfoById(note.getAuthor()));
				}
				//System.out.println(notes.size());
				JSONArray array=JSONArray.fromObject(notes);
				JSONArray paths=JSONArray.fromObject(uis);
				resultJson.put("reqflag", 1);
				resultJson.put("notes", array);
				resultJson.put("uis", paths);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("reqflag", 0);
				resultJson.put("errorinfo", e.getMessage());
			}
		}else if("ding".equals(type)){
			User u=(User)request.getSession().getAttribute("user");
			if(u!=null){
				String userId=u.getId();
				String noteId=request.getParameter("id");
				
				try {
					int result=Note.addOpt(userId, noteId);
					resultJson.put("flag", result);
				} catch (Exception e) {
					e.printStackTrace();
					resultJson.put("flag", 0);
					resultJson.put("errorinfo", e.getMessage());
				}
				
			}else{
				resultJson.put("flag", 2);
			}
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println(resultJson);
		out.flush();
		out.close();
	}
	
	

}
