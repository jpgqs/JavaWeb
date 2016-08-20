package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.bean.Note;
import com.bean.NoteReply;
import com.bean.Order;

public class OrderServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
JSONObject resultJson=new JSONObject();
		
		String type=request.getParameter("type");
		
		if("hotelorder".equals(type)){
			String user=request.getParameter("user");
			String hotel=request.getParameter("hotel");
			String count=request.getParameter("count");
			String beginday=request.getParameter("beginday");
			String endday=request.getParameter("endday");
//			System.out.println(html);
			
			try {
				Order.addHotelOrder(hotel, user,Integer.parseInt(count),beginday,endday);
				resultJson.put("flag", 1);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("flag", 0);
				resultJson.put("errorinfo", e.getMessage());
			}
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println(resultJson);
		out.flush();
		out.close();
	}
	
	

}
