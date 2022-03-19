package com.dquiz.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.dquiz.entities.QuestionEntity;
import com.dquiz.entities.ResponseEntity;
import com.dquiz.util.DBSessionFactoryUtil;

public class ResponseDao {
	
	public boolean saveResponse(ResponseEntity responseEntity) {
		
		boolean responseSavedToDB = false;
		
		try {
			
			Session dbSession = DBSessionFactoryUtil.getDBConnection().openSession();
			Transaction dbTransaction = dbSession.beginTransaction();
			dbSession.save(responseEntity);
			dbTransaction.commit();
			responseSavedToDB = true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return responseSavedToDB;
	}
	
public List<ResponseEntity> getResponseList() {
		
		
		List<ResponseEntity> responseEntityList = new ArrayList<ResponseEntity>();

		String queryString = "select r from ResponseEntity r ";
		
		Session dbSession = DBSessionFactoryUtil.getDBConnection().openSession();
		try {
			Transaction dbTransaction = dbSession.beginTransaction();
			Query responseListQuery = dbSession.createQuery(queryString);
	
			responseEntityList = responseListQuery.getResultList();
		

			
			dbTransaction.commit();		
		 	dbSession.close();
		}catch(Exception e) {
			dbSession.close();
			e.printStackTrace();
		}
	
		return responseEntityList;
	}

}
