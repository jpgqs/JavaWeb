package com.bean;

import java.util.ArrayList;

import com.dao.AnswerBPO;

public class Answer {
	
	private static AnswerBPO answerBPO=new AnswerBPO();
	
	public static ArrayList<Answer> getAnswerByQuestion(String id) throws Exception {
		return answerBPO.getAnswerByQuestion(id);
	}

}
