package com.dao;


import java.util.HashMap;
import java.util.Map;

import com.bean.Subject;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class SubjectBPO {

	private static Sql sql=new Sql();
	
	public static Map<String,Subject> getLessonMap(String id) throws Exception {
		
		StringBuffer sb=new StringBuffer("");
		sb.append("SELECT d.*,dc.classroom_id ");
		sb.append("FROM ");
		sb.append("  s_user_info si,");
		sb.append("  r_stu_subject_rela r, ");
		sb.append("  d_subject d, ");
		sb.append("  d_classroom dc ");
		sb.append("WHERE si.`id` = r.`student_id` ");
		sb.append("  AND si.`semester` = r.`student_sem` ");
		sb.append("  AND r.`student_sem`=d.`semester`");
		sb.append("  AND r.`subject_id`=d.`id`");
		sb.append("  AND d.`id`=dc.`subject_id`");
		
		sb.append("  AND si.`id`= ? ");
		
		sql.setSql(sb.toString());
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		
		Map<String,Subject> lessonmap=new HashMap<String,Subject>();
		
		for(int i=0;i<ds.rowCount();i++){
			String subjectid=ds.getString(i, "id");
			String name=ds.getString(i, "name");
			String type=SubjectBPO.getSubjectType(ds.getString(i, "type"));
			String classtime=ds.getString(i, "class_time");
			String credict=ds.getString(i, "credict");
			String teacherId=ds.getString(i, "teacher_id");
			String bookId=ds.getString(i, "book_id");
			String semester=ds.getString(i, "semester");
			String schooltime=ds.getString(i, "school_time");
			String classroom=ds.getString(i, "classroom_id");
			String[] times=schooltime.split(";");
			for(int j=0;j<times.length;j++){
				Subject s=new Subject(subjectid,name,type,classtime,credict,teacherId,times[j],bookId,semester,classroom);
				lessonmap.put(times[j], s);
			}
		}
		
		return lessonmap;
	}
	
	public static String getSubjectType(String code) throws Exception {
		
		sql.setSql("select code3 from global_code where code0='subjecttype' and code2 = ? ");
		sql.setString(1, code);
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0){
			throw new Exception("不存在已定义code值["+code+"]");
		}
		
		return ds.getString(0, "code3");
	}
}
