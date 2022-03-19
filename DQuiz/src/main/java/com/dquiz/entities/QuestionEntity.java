package com.dquiz.entities;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Column;

@Entity
@Table(name = "QUESTION_ENTITY")
public class QuestionEntity {
	
	@Id 
	@GeneratedValue(strategy =GenerationType.AUTO)
	@Column(name = "QUESTION_ID", length = 20)
	private long questionId;
	
	@Column(name = "QUESTION", length = 100)
	private String question;
	
	@Column(name = "OPTION1", length = 250)
	private String option1;
	
	@Column(name = "OPTION2", length = 250)
	private String option2;
	
	@Column(name = "OPTION3", length = 250)
	private String option3;
	
	@Column(name = "OPTION4", length = 250)
	private String option4;
	
	@Column(name = "ANSWER", length = 50)
	private String answer;

	public long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(long questionId) {
		this.questionId = questionId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
