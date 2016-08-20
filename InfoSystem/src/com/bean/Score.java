package com.bean;

import java.util.ArrayList;

import com.dao.ScoreBPO;

public class Score {

	private String id;
	private String subject;
	private String student;
	private String semester;
	private int isMakeup;
	private double gpa;
	private String teacher;
	private String credict;
	/**
	 * @return the credict
	 */
	public String getCredict() {
		return credict;
	}
	/**
	 * @param credict the credict to set
	 */
	public void setCredict(String credict) {
		this.credict = credict;
	}
	/**
	 * @return the teacher
	 */
	public String getTeacher() {
		return teacher;
	}
	/**
	 * @param teacher the teacher to set
	 */
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	/**
	 * @return the gpa
	 */
	public double getGpa() {
		return gpa;
	}
	/**
	 * @param gpa the gpa to set
	 */
	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	private int score;
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}
	/**
	 * @param subject the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}
	/**
	 * @return the student
	 */
	public String getStudent() {
		return student;
	}
	/**
	 * @param student the student to set
	 */
	public void setStudent(String student) {
		this.student = student;
	}
	/**
	 * @return the semester
	 */
	public String getSemester() {
		return semester;
	}
	/**
	 * @param semester the semester to set
	 */
	public void setSemester(String semester) {
		this.semester = semester;
	}
	/**
	 * @return the isMakeup
	 */
	public int getIsMakeup() {
		return isMakeup;
	}
	/**
	 * @param isMakeup the isMakeup to set
	 */
	public void setIsMakeup(int isMakeup) {
		this.isMakeup = isMakeup;
	}
	/**
	 * @return the score
	 */
	public int getScore() {
		return score;
	}
	/**
	 * @param score the score to set
	 */
	public void setScore(int score) {
		this.score = score;
	}
	
	public static ArrayList<Score> getScoreList(String id) throws Exception {
		return ScoreBPO.getScoreList(id);
	}
	
	public static ArrayList<Score> getGrades(String id) throws Exception {
		return ScoreBPO.getGrades(id);
	}
}
