package com.dao;

import java.util.ArrayList;

import com.bean.Score;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class ScoreBPO {

	private static Sql sql=new Sql();
	public static ArrayList<Score> getScoreList(String id) throws Exception {
		StringBuffer sb=new StringBuffer("");
		sb.append("SELECT ");
		sb.append("  d.`id`,d.`name`,d.`teacher_id`,d.`credict`,ss.`score` ");
		sb.append("FROM ");
		sb.append("  s_user_info s,");
		sb.append("  d_subject d,");
		sb.append("  s_score ss ");
		sb.append("WHERE s.`id` = ss.`student_id` ");
		sb.append("  AND s.`semester` = ss.`student_sem` ");
		sb.append("  AND ss.`subject_id`=d.`id`");
		sb.append("  AND s.`id`= ? ");
		
		sql.setSql(sb.toString());
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		
		ArrayList<Score> sl=new ArrayList<Score>();
		for(int i=0;i<ds.rowCount();i++){
			Score s=new Score();
			s.setId(ds.getString(i, "id"));
			s.setSubject(ds.getString(i, "name"));
			s.setTeacher(ds.getString(i, "teacher_id"));
			s.setCredict(ds.getString(i, "credict"));
			s.setScore(ds.getInt(i, "score"));
			
			sl.add(s);
		}
		
		return sl;
	}

	public static ArrayList<Score> getGrades(String id) throws Exception {
		StringBuffer sb=new StringBuffer("");
		sb.append("SELECT ");
		sb.append("  d.`id`,d.`name`,d.`credict`,ss.`gpa`,ss.`makeup_flag` ");
		sb.append("FROM ");
		sb.append("  s_user_info s,");
		sb.append("  d_subject d,");
		sb.append("  s_grade ss ");
		sb.append("WHERE s.`id` = ss.`student_id` ");
		sb.append("  AND ss.`subject_id`=d.`id`");
		sb.append("  AND s.`id`= ? ");
		
		sql.setSql(sb.toString());
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		
		ArrayList<Score> sl=new ArrayList<Score>();
		for(int i=0;i<ds.rowCount();i++){
			Score s=new Score();
			s.setId(ds.getString(i, "id"));
			s.setSubject(ds.getString(i, "name"));
			s.setCredict(ds.getString(i, "credict"));
			s.setGpa(ds.getDouble(i, "gpa"));
			s.setIsMakeup(ds.getInt(i, "makeup_flag"));
			
			sl.add(s);
		}
		
		return sl;
	}

}
