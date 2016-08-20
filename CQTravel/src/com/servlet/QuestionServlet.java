package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Question;
import com.bean.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class QuestionServlet extends HttpServlet {

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
		if("addq".equals(type)){
			JSONObject params=JSONObject.fromObject(request.getParameter("params"));
			String userId=((User)request.getSession().getAttribute("user")).getId();
			params.put("author", userId);
			try {
				String qid=Question.addQuestion(params);
				resultJson.put("flag", 1);
				resultJson.put("id", qid);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("flag", 0);
				resultJson.put("msg", e.getMessage());
			}
		}else if("load".equals(type)){
			int index=Integer.parseInt(request.getParameter("index"));
			try {
				ArrayList<Question> ql=Question.getAllQuestionList((index-1)*10, 10);
				JSONArray qlist=JSONArray.fromObject(ql);
				resultJson.put("flag", 1);
				resultJson.put("list", qlist);
			} catch (Exception e) {
				e.printStackTrace();
				resultJson.put("flag", 0);
				resultJson.put("msg", e.getMessage());
			}
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println(resultJson);
		out.flush();
		out.close();
	}

	
}
