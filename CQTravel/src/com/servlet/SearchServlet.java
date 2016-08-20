package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Hotel;
import com.bean.Note;
import com.bean.Question;
import com.bean.User;
import com.bean.UserInfo;
import com.bean.View;
import com.dao.CommonBPO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class SearchServlet extends HttpServlet{

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
		String type=request.getParameter("type");
		if("allsuggest".equals(type)){
			String key=request.getParameter("key");
			key=key.trim();
			try {
				Thread.sleep(1500);
				
				CommonBPO comm=new CommonBPO();
				ArrayList<JSONObject> list=comm.getAllSuggest(key);
				JSONArray arr=JSONArray.fromObject(list);
				
				resultJson.put("suggest", arr);
				//System.out.println(arr.toString());
				resultJson.put("searchflag", 1);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("searchflag", 0);
				resultJson.put("error", e.getMessage());
			}
		}else if("usersearch".equals(type)){
			String username=request.getParameter("username");
			String nickname=request.getParameter("nickname");
			String gender=request.getParameter("gender");
			String city=request.getParameter("city");
			String phone=request.getParameter("phone");
			String qq=request.getParameter("qq");
			//System.out.println(username+":"+nickname+":"+city+":"+phone+":"+qq+":"+gender);
			HashMap<String,String> data=new HashMap<String, String>();
			data.put("username", username);
			data.put("nickname",nickname);
			data.put("gender", gender);
			data.put("city", city);
			data.put("phone", phone);
			data.put("qq", qq);
			
			try {
				ArrayList<UserInfo> userList=UserInfo.searchUserList(data);
				//System.out.println(userList.size());
				JSONArray arr=JSONArray.fromObject(userList);
				resultJson.put("searchflag", 1);
				resultJson.put("result", arr);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("searchflag", 0);
				resultJson.put("error", e.getMessage());
			}
		}else if("userdelete".equals(type)){
			String username=request.getParameter("username");
			
			try {
				User.deleteUserById(username);
				resultJson.put("searchflag", 1);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("searchflag", 0);
				resultJson.put("error", e.getMessage());
			}
		}else if("roomtype".equals(type)){
			try {
				Map<String,String> types=Hotel.getRoomTypes();
				JSONObject map=JSONObject.fromObject(types);
				//System.out.println(map.toString());
				resultJson.put("type", map);
				resultJson.put("searchflag", 1);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("searchflag", 0);
				resultJson.put("error", e.getMessage());
			}
		}else if("search".equals(type)){
			String subtype=request.getParameter("subtype");
			JSONObject params=JSONObject.fromObject(request.getParameter("params"));
			JSONArray resultList=null;
			
			try {
				
				if("hotel".equals(subtype)){
					ArrayList<Hotel> hotelList=Hotel.searchHotelList(params);
					resultList=JSONArray.fromObject(hotelList);
				}else if("view".equals(subtype)){
					ArrayList<View> viewList=View.searchViewList(params);
					resultList=JSONArray.fromObject(viewList);
				}else if("note".equals(subtype)){
					ArrayList<Note> noteList=Note.searchNoteList(params);
					resultList=JSONArray.fromObject(noteList);
				}else if("qa".equals(subtype)){
					ArrayList<Question> questionList=Question.searchQuestionList(params);
					resultList=JSONArray.fromObject(questionList);
				}
				//System.out.println(userList.size());
				resultJson.put("type", subtype);
				resultJson.put("searchflag", 1);
				resultJson.put("result", resultList);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("searchflag", 0);
				resultJson.put("error", e.getMessage());
			}
		}else if("delete".equals(type)){
			String subtype=request.getParameter("subtype");
			String objid=request.getParameter("objid");
			
			try {
				if("hotel".equals(subtype)){
					Hotel.deleteHotelById(objid);
				}else if("view".equals(subtype)){
					View.deleteViewById(objid);
				}else if("note".equals(subtype)){
					Note.deleteNoteById(objid);
				}else if("qa".equals(subtype)){
					Question.deleteQuestionById(objid);
				}
				resultJson.put("searchflag", 1);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("searchflag", 0);
				resultJson.put("error", e.getMessage());
			}
		}else if("getobjbyid".equals(type)){
			String subtype=request.getParameter("subtype");
			String id=request.getParameter("id");
			JSONObject resultobj=null;
			try {
				if("hotel".equals(subtype)){
					Hotel hotel=Hotel.getHotelById(id);
					resultobj=JSONObject.fromObject(hotel);
				}else if("view".equals(subtype)){
					View view=View.getViewById(id);
					resultobj=JSONObject.fromObject(view);
				}
				resultJson.put("type", subtype);
				resultJson.put("result", resultobj);
				resultJson.put("searchflag", 1);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("searchflag", 0);
				resultJson.put("error", e.getMessage());
			}
		}else if("alter".equals(type)){
			String subtype=request.getParameter("subtype");
			JSONObject params=JSONObject.fromObject(request.getParameter("params"));
//			System.out.println(hotel);
			try {
				if("hotel".equals(subtype)){
					Hotel.alterHotel(params);
				}else if("view".equals(subtype)){
					View.alterView(params);
				}
				resultJson.put("type", subtype);
				resultJson.put("searchflag", 1);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("searchflag", 0);
				resultJson.put("error", e.getMessage());
			}
		}else if("insert".equals(type)){
			
			String subtype=request.getParameter("subtype");
			JSONArray objs=JSONArray.fromObject(request.getParameter("objs"));
			//System.out.println(hotels.toString());
			try {
				if("hotel".equals(subtype)){
					Hotel.insertHotel(objs);
				}else if("view".equals(subtype)){
					View.insertView(objs);
				}
				resultJson.put("searchflag", 1);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("searchflag", 0);
				resultJson.put("error", e.getMessage());
			}
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println(resultJson);
		out.flush();
		out.close();
	}
	
	public void doAllSearch(){
		
	}
	
	public static void main(String[] args) throws Exception {
		CommonBPO comm=new CommonBPO();
		ArrayList<JSONObject> list=comm.getAllSuggest("÷ÿ«Ï");
		JSONArray arr=JSONArray.fromObject(list);
		
		System.out.println(arr.toString());
	}

}
