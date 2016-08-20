package com.bean;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.dao.SubjectBPO;

public class Subject {

	private String id;
	private String name;
	private String type;
	private String classtime;
	private String credict;
	private String teacherId;
	private String schoolTime;
	private String bookId;
	private String semester;
	private String classroom;
	
	
	/**
	 * @return the classroom
	 */
	public String getClassroom() {
		return classroom;
	}

	/**
	 * @param classroom the classroom to set
	 */
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}

	public Subject(){
		
	}
	
	public Subject(String id,String name,String type,String classtime,String credict,String teacherId,String schoolTime,String bookId,String semester,String classroom) {
		this.id=id;
		this.name=name;
		this.type=type;
		this.classtime=classtime;
		this.credict=credict;
		this.teacherId=teacherId;
		this.schoolTime=schoolTime;
		this.bookId=bookId;
		this.semester=semester;
		this.classroom=classroom;
	}
	
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return the classtime
	 */
	public String getClasstime() {
		return classtime;
	}
	/**
	 * @param classtime the classtime to set
	 */
	public void setClasstime(String classtime) {
		this.classtime = classtime;
	}
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
	 * @return the teacherId
	 */
	public String getTeacherId() {
		return teacherId;
	}
	/**
	 * @param teacherId the teacherId to set
	 */
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	/**
	 * @return the schoolTime
	 */
	public String getSchoolTime() {
		return schoolTime;
	}
	/**
	 * @param schoolTime the schoolTime to set
	 */
	public void setSchoolTime(String schoolTime) {
		this.schoolTime = schoolTime;
	}
	/**
	 * @return the bookId
	 */
	public String getBookId() {
		return bookId;
	}
	/**
	 * @param bookId the bookId to set
	 */
	public void setBookId(String bookId) {
		this.bookId = bookId;
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
	 * 通过学生学号获取到当前学期选课情况
	 * @param studentId
	 * @return
	 * @throws Exception
	 */
	public static Map<String,String> getLessonList(String studentId) throws Exception {
		Map<String,String> lessonmap=new HashMap<String,String>();
		Map<String,Subject> map=SubjectBPO.getLessonMap(studentId);
		
		Set<String> s=map.keySet();
		for(String key:s){
			Subject sub=map.get(key);
			String name=sub.getName();
			String type=sub.getType();
			String classroom=sub.getClassroom();
			lessonmap.put(key, name+"<br>"+type+"<br>"+classroom);
		}
		
		return lessonmap;
	}
	
}
