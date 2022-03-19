package com.dquiz.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class DBSessionFactoryUtil {
	
	private static SessionFactory dbSessionFactory;
	
	public static SessionFactory getDBConnection() {
	
		if(null == dbSessionFactory) {
			dbSessionFactory = new Configuration().configure("hibernate_config.xml").buildSessionFactory();
		}
		
		return dbSessionFactory;
	}
	
	

}
