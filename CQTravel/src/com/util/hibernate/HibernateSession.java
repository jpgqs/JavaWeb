package com.util.hibernate;

import java.util.HashMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateSession {
	
	private static final ThreadLocal<Session> threadSession=new ThreadLocal<Session>();
	private static final Configuration cfg=new Configuration();
	public static HashMap<String,SessionFactory> sfMap=new HashMap<String, SessionFactory>();
	
	public static Session currentSession(){
		return currentSession("hibernate");
	}
	
	public static Session currentSession(String dbName){
		Session s=(Session) threadSession.get();
		if(dbName==null||dbName.equals("")){
			dbName="hibernate";
		}
		if(s==null){
			
			if(sfMap!=null&&sfMap.size()>0&&sfMap.containsKey(dbName)){
				SessionFactory sf=sfMap.get(dbName);
				s=sf.openSession();
				threadSession.set(s);
			}else{
				SessionFactory sf=cfg.configure(dbName+".cfg.xml").buildSessionFactory();
				sfMap.put(dbName, sf);
				s=sf.openSession();
				threadSession.set(s);
			}
			
			
		}
//		System.out.println("��ȡ��Hibernate���ӣ�");
		return s;
	}
	
	public static void closeSession(){
		closeSession("hibernate");
	}
	
	public static void closeSession(String dbName){
		Session s=threadSession.get();
		if(s!=null){
			s.close();
//			System.out.println("Hibernate���ӹر�");
		}
	}
	
	public static SessionFactory getSessionFactory(String dbName){
		if(dbName==null||dbName.equals("")){
			dbName="hibernate";
		}
		SessionFactory sf=null;
		if(sfMap!=null&&sfMap.size()>0&&sfMap.containsKey(dbName)){
			sf=sfMap.get(dbName);
		}
		return sf;
	}

}
