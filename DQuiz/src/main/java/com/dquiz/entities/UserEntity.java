package com.dquiz.entities;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Column;

@Entity
@Table(name = "USER_ENTITY")
public class UserEntity {
	
	@Id 
	@GeneratedValue(strategy =GenerationType.AUTO)
	@Column(name = "USER_ID", length = 20)
	private long userId;
	
	@Column(name = "USER_ADDRESS", length = 100)
	private String userAddress;
	
	@Column(name = "USER_EMAIL", length = 50)
	private String userEmail;
	
	@Column(name = "USER_NAME", length = 50)
	private String userName;
	
	@Column(name = "USER_PASSWORD", length = 50)
	private String userPassword;
	
	@Column(name = "USER_PHONE", length = 30)
	private long userPhone;
	
	@Column(name = "USER_ROLE", length = 50)
	private String userRole;
	
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public long getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(long userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	
	
	

}
