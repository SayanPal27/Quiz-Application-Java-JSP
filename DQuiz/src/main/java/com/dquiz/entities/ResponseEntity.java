package com.dquiz.entities;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Column;

@Entity
@Table(name = "RESPONSE_ENTITY")
public class ResponseEntity {
	
	@Id 
	@GeneratedValue(strategy =GenerationType.AUTO)
	@Column(name = "RESPONSE_ID", length = 20)
	private long responseId;
	
	@Column(name = "NAME", length = 20)
	private String name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "CORRECT", length = 100)
	private int correct;
	
	@Column(name = "TOTAL", length = 50)
	private int total;
	
	@Column(name = "percentage", length = 50)
	private double percentage;
	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public long getResponseId() {
		return responseId;
	}

	public void setResponseId(long responseId) {
		this.responseId = responseId;
	}

	public int getCorrect() {
		return correct;
	}

	public void setCorrect(int correct) {
		this.correct = correct;
	}

	public double getPercentage() {
		return percentage;
	}

	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	
	


	

}
