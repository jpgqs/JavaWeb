package com.dao;

import java.util.ArrayList;
import java.util.Date;

import com.bean.Student;
import com.bean.UserInfo;
import com.util.Tools;
import com.util.hibernate.DataStore;
import com.util.hibernate.Sql;

public class StudentBPO {

	private static Sql sql=new Sql();
	
	public static UserInfo getInfo(String id) throws Exception{
		
		StringBuffer sb=new StringBuffer("");
		sb.append("SELECT id,NAME,gender,birth,idcard,phone,qq,email,");
		sb.append("  (SELECT VALUE FROM p_code p WHERE p.code = academy) academy,");
		sb.append("  (SELECT VALUE FROM p_code p WHERE p.code = major) major,");
		sb.append("  class,");
		sb.append("  (SELECT VALUE FROM p_code p WHERE p.code = submajor) submajor,");
		sb.append("  subclass,emcontact,emphone,address,semester,enrollmentdate ");
		sb.append("FROM s_user_info ");
		sb.append("WHERE id= ?");
		
		sql.setSql(sb.toString());
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		
		if(ds.rowCount()==0)
			throw new Exception("该ID["+id+"]对应的身份信息不存在");
		
		Student s=new Student();
		
		s.setName(ds.getString(0, "name"));
		s.setGender(ds.getInt(0, "gender"));
		s.setBirth(Tools.dateToString(ds.getDate(0, "birth"), "yyyy-mm-dd"));
		s.setIdcard(ds.getString(0, "idcard"));
		s.setPhone(ds.getString(0, "phone"));
		s.setQq(ds.getString(0, "qq"));
		s.setEmail(ds.getString(0, "email"));
		s.setAcademy(ds.getString(0, "academy"));
		s.setMajor(ds.getString(0, "major"));
		s.setClasses(ds.getString(0, "class"));
		s.setSubmajor(ds.getString(0, "submajor"));
		s.setSubclass(ds.getString(0, "subclass"));
		s.setEmcontact(ds.getString(0, "emcontact"));
		s.setEmphone(ds.getString(0, "emphone"));
		s.setAddress(ds.getString(0, "address"));
		s.setSemester(ds.getInt(0, "semester"));
		s.setEnrollmentDate(ds.getDate(0, "enrollmentdate"));
		
		
		
		return s;
	}

	public static void add(Student student) throws Exception {
		if(student==null){
			throw new Exception("提交对象为null");
		}
		String id=student.getId();
		
		sql.setSql("select * from s_user_info where id = ?");
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()!=0){
			throw new Exception("增加学生信息失败：学号["+id+"]在数据库中已存在");
		}
		
		String name=student.getName();
		//验证身份证号码是否合法
		String idcard=student.getIdcard();
		Tools.idcardCheck(idcard);
		
		Date birth=Tools.stringToDate(idcard.substring(6, 14), "yyyymmdd");
		int gender=student.getGender();
		String phone=student.getPhone();
		String qq=student.getQq();
		String email=student.getEmail();
		String academy=student.getAcademy();
		String major=student.getMajor();
		String classes=student.getClasses();
		String submajor=student.getSubmajor();
		String subclass=student.getSubclass();
		String emcontact=student.getEmcontact();
		String emphone=student.getEmphone();
		String address=student.getAddress();
		
		int semester=1;
		
		Date enrollmentdate=Tools.getSemesterDate();
		
		sql.setSql("insert into s_user_info values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		sql.setString(1, id);
		sql.setString(2, name);
		sql.setInt(3, gender);
		sql.setDate(4, birth);
		sql.setString(5, idcard);
		sql.setString(6, phone);
		sql.setString(7, qq);
		sql.setString(8, email);
		sql.setString(9, academy);
		sql.setString(10, major);
		sql.setString(11, classes);
		sql.setString(12, submajor);
		sql.setString(13, subclass);
		sql.setString(14, emcontact);
		sql.setString(15, emphone);
		sql.setString(16, address);
		sql.setInt(17, semester);
		sql.setDate(18, enrollmentdate);
		sql.executeUpdate();
		
		
	}

	public static void addAll(DataStore ds) throws Exception {
		int num=ds.rowCount();
		System.out.println("需要更新的行数"+(num-1));
		for(int i=1;i<num;i++){
			Student s=new Student();
			
			s.setId(ds.getString(i, "id"));
			s.setName(ds.getString(i, "name"));
			int gender="男".equals(ds.getString(i, "gender"))?1:i;
			s.setGender(gender);
			s.setIdcard(ds.getString(i, "idcard"));
			s.setPhone(ds.getString(i, "phone"));
			s.setQq(ds.getString(i, "qq"));
			s.setEmail(ds.getString(i, "email"));
			s.setAcademy(ds.getString(i, "academy"));
			s.setMajor(ds.getString(i, "major"));
			s.setClasses(ds.getString(i, "class"));
			s.setSubmajor(ds.getString(i, "submajor"));
			s.setSubclass(ds.getString(i, "subclass"));
			s.setEmcontact(ds.getString(i, "emcontact"));
			s.setEmphone(ds.getString(i, "emphone"));
			s.setAddress(ds.getString(i, "address"));
			
			add(s);
		}
	}

	public static ArrayList<Student> search(String condition) throws Exception {
		
		StringBuffer sb=new StringBuffer("");
		sb.append("SELECT id,NAME,gender,birth,idcard,phone,qq,email,");
		sb.append("  (SELECT VALUE FROM p_code p WHERE p.code = academy) academy,");
		sb.append("  (SELECT VALUE FROM p_code p WHERE p.code = major) major,");
		sb.append("  class,");
		sb.append("  (SELECT VALUE FROM p_code p WHERE p.code = submajor) submajor,");
		sb.append("  subclass,emcontact,emphone,address,semester,enrollmentdate ");
		sb.append("FROM s_user_info ");
		sb.append("WHERE id LIKE ? OR NAME LIKE ? OR idcard LIKE ? limit 8 ");
		
		sql.setSql(sb.toString());
		sql.setString(1, "%"+condition+"%");
		sql.setString(2, "%"+condition+"%");
		sql.setString(3, "%"+condition+"%");
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0)
			throw new Exception("未找到与["+condition+"]相关的学生信息");
		
		ArrayList<Student> sl=new ArrayList<Student>();
		for(int i=0;i<ds.rowCount();i++){
			Student s=new Student();
			
			s.setId(ds.getString(i, "id"));
			s.setName(ds.getString(i, "name"));
			s.setGender(ds.getInt(i, "gender"));
			s.setBirth(Tools.dateToString(ds.getDate(i, "birth"), "yyyy-mm-dd"));
			s.setIdcard(ds.getString(i, "idcard"));
			s.setPhone(ds.getString(i, "phone"));
			s.setQq(ds.getString(i, "qq"));
			s.setEmail(ds.getString(i, "email"));
			s.setAcademy(ds.getString(i, "academy"));
			s.setMajor(ds.getString(i, "major"));
			s.setClasses(ds.getString(i, "class"));
			s.setSubmajor(ds.getString(i, "submajor"));
			s.setSubclass(ds.getString(i, "subclass"));
			s.setEmcontact(ds.getString(i, "emcontact"));
			s.setEmphone(ds.getString(i, "emphone"));
			s.setAddress(ds.getString(i, "address"));
			s.setSemester(ds.getInt(i, "semester"));
			s.setEnrollmentDate(ds.getDate(i, "enrollmentdate"));
			
			sl.add(s);
		}
		
		return sl;
	}

	public static Student extSearch(String condition) throws Exception {
		
		StringBuffer sb=new StringBuffer("");
		sb.append("SELECT id,NAME,gender,birth,idcard,phone,qq,email,");
		sb.append("  (SELECT VALUE FROM p_code p WHERE p.code = academy) academy,");
		sb.append("  (SELECT VALUE FROM p_code p WHERE p.code = major) major,");
		sb.append("  class,");
		sb.append("  (SELECT VALUE FROM p_code p WHERE p.code = submajor) submajor,");
		sb.append("  subclass,emcontact,emphone,address,semester,enrollmentdate ");
		sb.append("FROM s_user_info ");
		sb.append("WHERE id = ? OR NAME = ? OR idcard = ? limit 1 ");
		
		sql.setSql(sb.toString());
		sql.setString(1, condition);
		sql.setString(2, condition);
		sql.setString(3, condition);
		
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0)
			throw new Exception("未找到与["+condition+"]相关的学生信息");
		
		Student s=new Student();
		s.setId(ds.getString(0, "id"));
		s.setName(ds.getString(0, "name"));
		s.setGender(ds.getInt(0, "gender"));
		s.setBirth(Tools.dateToString(ds.getDate(0, "birth"), "yyyy-mm-dd"));
		s.setIdcard(ds.getString(0, "idcard"));
		s.setPhone(ds.getString(0, "phone"));
		s.setQq(ds.getString(0, "qq"));
		s.setEmail(ds.getString(0, "email"));
		s.setAcademy(ds.getString(0, "academy"));
		s.setMajor(ds.getString(0, "major"));
		s.setClasses(ds.getString(0, "class"));
		s.setSubmajor(ds.getString(0, "submajor"));
		s.setSubclass(ds.getString(0, "subclass"));
		s.setEmcontact(ds.getString(0, "emcontact"));
		s.setEmphone(ds.getString(0, "emphone"));
		s.setAddress(ds.getString(0, "address"));
		s.setSemester(ds.getInt(0, "semester"));
		s.setEnrollmentDate(ds.getDate(0, "enrollmentdate"));
		
		return s;
	}

	public static void alter(Student student) throws Exception {
		if(student==null){
			throw new Exception("提交对象为null");
		}
		ArrayList<String> params=new ArrayList<String>();
		
		String id=student.getId();
		sql.setSql("select * from s_user_info where id = ?");
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0){
			throw new Exception("修改错误：学号["+id+"]在数据库中不存在");
		}
		
		StringBuffer sb=new StringBuffer("");
		
		
		String name=student.getName();
		if(name!=null&&!name.equals(ds.getString(0, "name"))){
			params.add(name);
			sb.append(" name = ?, ");
		}
		//验证身份证号码是否合法
		String idcard=student.getIdcard();
		if(idcard!=null&&!idcard.equals(ds.getString(0, "idcard"))){
			params.add(idcard);
			sb.append(" idcard = ?, ");
			Tools.idcardCheck(idcard);
		}
		Date birth=Tools.stringToDate(idcard.substring(6, 14), "yyyymmdd");
		
		int gender=student.getGender();
		
		String phone=student.getPhone();
		if(phone!=null&&!phone.equals(ds.getString(0, "phone"))){
			params.add(phone);
			sb.append(" phone = ?, ");
		}
		String qq=student.getQq();
		if(qq!=null&&!qq.equals(ds.getString(0, "qq"))){
			params.add(qq);
			sb.append(" qq = ?, ");
		}
		String email=student.getEmail();
		if(email!=null&&!email.equals(ds.getString(0, "email"))){
			params.add(email);
			sb.append(" email = ?, ");
		}
		String academy=student.getAcademy();
		if(!academy.equals(ds.getString(0, "academy"))){
			params.add(academy);
			sb.append(" academy = ?, ");
		}
		String major=student.getMajor();
		if(!major.equals(ds.getString(0, "major"))){
			params.add(major);
			sb.append(" major = ?, ");
		}
		String classes=student.getClasses();
		if(classes!=null&&!classes.equals(ds.getString(0, "class"))){
			params.add(classes);
			sb.append(" class = ?, ");
		}
		String submajor=student.getSubmajor();
		if(submajor!=null&&!submajor.equals(ds.getString(0, "submajor"))){
			params.add(submajor);
			sb.append(" submajor = ?, ");
		}
		String subclass=student.getSubclass();
		if(subclass!=null&&!subclass.equals(ds.getString(0, "subclass"))){
			params.add(subclass);
			sb.append(" subclass = ?, ");
		}
		String emcontact=student.getEmcontact();
		if(emcontact!=null&&!emcontact.equals(ds.getString(0, "emcontact"))){
			params.add(emcontact);
			sb.append(" emcontact = ?, ");
		}
		String emphone=student.getEmphone();
		if(emphone!=null&&!emphone.equals(ds.getString(0, "emphone"))){
			params.add(emphone);
			sb.append(" emphone = ?, ");
		}
		String address=student.getAddress();
		if(address!=null&&!address.equals(ds.getString(0, "address"))){
			params.add(address);
			sb.append(" address = ?, ");
		}
		
		String condition=sb.toString();
		if(!"".equals(condition))
			condition=(","+condition).substring(0,condition.lastIndexOf(','));
		sql.setSql("UPDATE s_user_info SET gender = ?, birth = ? "+condition+" WHERE id = ?");
		
		sql.setInt(1, gender);
		sql.setDate(2, birth);
		for(int i=0;i<params.size();i++){
			sql.setString(i+3, params.get(i));
		}
		sql.setString(3+params.size(), id);
		
		sql.executeUpdate();
	}

	public static void delete(String id) throws Exception {
		if(Tools.isNull(id))
			throw new Exception("id为空！");
		
		sql.setSql("select * from s_user_info where id = ?");
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0){
			throw new Exception("删除学生信息失败：学号["+id+"]在数据库中不存在");
		}
		
		sql.setSql("delete from s_user_info where id = ? ");
		sql.setString(1, id);
		sql.executeUpdate();
		
		UserBPO.delete(id);
	}

	public static void alterContact(String id, String phone, String emphone,
			String qq, String email, String address) throws Exception {
		if(Tools.isNull(id))
			throw new Exception("id为空！");
		
		sql.setSql("select * from s_user_info where id = ?");
		sql.setString(1, id);
		DataStore ds=sql.executeQuery();
		if(ds.rowCount()==0){
			throw new Exception("修改联系方式失败：学号["+id+"]在数据库中不存在");
		}
		
		sql.setSql("update s_user_info set phone = ?, emphone = ?, qq = ?, email = ?, address = ? where id = ?");
		sql.setString(1, phone);
		sql.setString(2, emphone);
		sql.setString(3, qq);
		sql.setString(4, email);
		sql.setString(5, address);
		sql.setString(6, id);
		sql.executeUpdate();
	}
}
