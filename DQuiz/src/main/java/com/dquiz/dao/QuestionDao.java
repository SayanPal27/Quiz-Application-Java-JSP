package com.dquiz.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.dquiz.entities.QuestionEntity;

import com.dquiz.util.DBSessionFactoryUtil;

public class QuestionDao {
	
	public boolean saveQuestion(QuestionEntity questionEntity) {
		
		boolean questionSavedToDB = false;
		
		try {
			
			Session dbSession = DBSessionFactoryUtil.getDBConnection().openSession();
			Transaction dbTransaction = dbSession.beginTransaction();
			dbSession.save(questionEntity);
			dbTransaction.commit();
			questionSavedToDB = true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return questionSavedToDB;
	}
	
public List<QuestionEntity> getQuestionList() {
		
		
		List<QuestionEntity> questionEntityList = new ArrayList<QuestionEntity>();

		String queryString = "select q from QuestionEntity q ";
		
		Session dbSession = DBSessionFactoryUtil.getDBConnection().openSession();
		try {
			Transaction dbTransaction = dbSession.beginTransaction();
			Query questionListQuery = dbSession.createQuery(queryString);
	
			questionEntityList = questionListQuery.getResultList();
		

			
			dbTransaction.commit();		
		 	dbSession.close();
		}catch(Exception e) {
			dbSession.close();
			e.printStackTrace();
		}
		
		return questionEntityList;
	}

}
