package com.dquiz.dao;

import javax.persistence.NoResultException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.dquiz.dao.UserDao;
import com.dquiz.entities.UserEntity;
import com.dquiz.util.DBSessionFactoryUtil;

public class UserDao {
	
		public boolean saveUser(UserEntity userEntity) {
			
			boolean userSavedToDB = false;
			
			try {
				
				Session dbSession = DBSessionFactoryUtil.getDBConnection().openSession();
				Transaction dbTransaction = dbSession.beginTransaction();
				dbSession.save(userEntity);
				dbTransaction.commit();
				userSavedToDB = true;
				
			}
			catch(Exception e) {
				e.printStackTrace();
				
			}
			
			return userSavedToDB;
		}
		
		public UserEntity isUserValid(String emailInput, String passwordInput) {
			
//			boolean isUserAuthenticated = false;
			UserEntity userEntityWithValidEmail;
			
			try {
				
				Session dbSession = DBSessionFactoryUtil.getDBConnection().openSession();
				
				CriteriaBuilder userAuthCriteria = dbSession.getCriteriaBuilder();
				
				CriteriaQuery<UserEntity> userAuthQuery = userAuthCriteria.createQuery(UserEntity.class);
				
				Root<UserEntity> rootUserNavigation = userAuthQuery.from(UserEntity.class);
				
				userAuthQuery.select(rootUserNavigation).where(userAuthCriteria.equal(rootUserNavigation.get("userEmail"),emailInput));
				
				Query<UserEntity> userAuthHibernateQuery = dbSession.createQuery(userAuthQuery);
				
				userEntityWithValidEmail = userAuthHibernateQuery.getSingleResult();
				
				if(null != userEntityWithValidEmail) {
					
					if(userEntityWithValidEmail.getUserPassword().equalsIgnoreCase(passwordInput)) {
						return userEntityWithValidEmail;
					}
					else {
						return null;
					}
				}
				
				
				
			}
			catch(Exception e) {
				e.printStackTrace();
				
			}
			
			return null;
		}
		
		public boolean isDuplicateEmail(String emailInput) {
			
			boolean isDuplicateEmail = false;
				
		try {
					
			Session dbSession = DBSessionFactoryUtil.getDBConnection().openSession();
			
			CriteriaBuilder userAuthCriteria = dbSession.getCriteriaBuilder();
			
			CriteriaQuery<UserEntity> userAuthQuery = userAuthCriteria.createQuery(UserEntity.class);
			
			Root<UserEntity> rootUserNavigation = userAuthQuery.from(UserEntity.class);
			
			userAuthQuery.select(rootUserNavigation).where(userAuthCriteria.equal(rootUserNavigation.get("userEmail"),emailInput));
			
			Query<UserEntity> userAuthHibernateQuery = dbSession.createQuery(userAuthQuery);
			
			
			
			UserEntity userEntityWithDuplicateEmail = userAuthHibernateQuery.getSingleResult();
					
					
					
					if(null != userEntityWithDuplicateEmail) {
						
						isDuplicateEmail = true;
					}
					
					
					
				}
				catch(NoResultException e) {
					isDuplicateEmail = false;
					
					
				}
				
				
				return isDuplicateEmail;
				
			}
		
	


}
