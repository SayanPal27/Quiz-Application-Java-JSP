<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
<%@page import="com.dquiz.entities.QuestionEntity"%>

<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Quiz | DQuiz</title>		
		<%@include file="components/common.jsp"%>
		
		<script type="text/javascript">
		
		
		function gotoNextQuestion(questionNo){
			
			let answers = localStorage.getItem("answers");
			var flag=0;
			
			if(null == answers){
				let userAnswers = [];
				var answersGiven = document.getElementsByName("answer");
				
				for(i = 0; i < answersGiven.length; i++) {
		                if(answersGiven[i].checked){
		                	userAnswers.push({question: questionNo,answer: answersGiven[i].value});
		                	flag=1;
		                }}
				localStorage.setItem("answers", JSON.stringify(userAnswers));
				console.log('Answer Added');
		    }
			else {
			//question already Answered
			let userAnswers = JSON.parse(answers);
			
			
			let oldQuestion = userAnswers.find((ques) => ques.question == questionNo);
			
			if(oldQuestion){
				flag=1;
				
				var answersGiven = document.getElementsByName("answer");
				for(i = 0; i < answersGiven.length; i++) {
		                if(answersGiven[i].checked)
		                	oldQuestion.answer = answersGiven[i].value
		                }
				
				userAnswers.map((q) => {			
						if(q.question == oldQuestion.question){
							q.answer = oldQuestion.answer;
						} 
					}
				)
				localStorage.setItem("answers", JSON.stringify(userAnswers));
			}
			else{
				var answersGiven = document.getElementsByName("answer");
				
				for(i = 0; i < answersGiven.length; i++) {
		                if(answersGiven[i].checked){
		                	userAnswers.push({question: questionNo,answer: answersGiven[i].value});flag=1;
		                }}
				
				localStorage.setItem("answers", JSON.stringify(userAnswers));
				
				}
		}
			if(flag==0){
				alert("Please Select one option to proceed !")
			}
			else{
				window.location = "quiz.jsp?qno="+(questionNo+1);
			}
			
			 
			
	}
		
function markLastQuestion(questionNo){
			
			let answers = localStorage.getItem("answers");
			var flag=0;
			
			if(null == answers){
				let userAnswers = [];
				var answersGiven = document.getElementsByName("answer");
				
				for(i = 0; i < answersGiven.length; i++) {
		                if(answersGiven[i].checked){
		                	userAnswers.push({question: questionNo,answer: answersGiven[i].value});
		                	flag=1;
		                }}
				localStorage.setItem("answers", JSON.stringify(userAnswers));
				console.log('Answer Added');
		    }
			else {
			//question already Answered
			flag=1;
			let userAnswers = JSON.parse(answers);
			
			let oldQuestion = userAnswers.find((ques) => ques.question == questionNo);
			
			if(oldQuestion){
				
				var answersGiven = document.getElementsByName("answer");
				for(i = 0; i < answersGiven.length; i++) {
		                if(answersGiven[i].checked)
		                	oldQuestion.answer = answersGiven[i].value
		                }
				
				userAnswers.map((q) => {			
						if(q.question == oldQuestion.question){
							q.answer = oldQuestion.answer;
						} 
					}
				)
				localStorage.setItem("answers", JSON.stringify(userAnswers));
			}
			else{
				var answersGiven = document.getElementsByName("answer");
				
				for(i = 0; i < answersGiven.length; i++) {
		                if(answersGiven[i].checked){
		                	userAnswers.push({question: questionNo,answer: answersGiven[i].value});flag=1;
		                }}
				
				localStorage.setItem("answers", JSON.stringify(userAnswers));
				
				}
		}
			if(flag==0){
				alert("Please Select one option to proceed !")
			}
			else{
				window.location = "quiz.jsp?qno="+(questionNo);
			}
			
			 
			
	}
		
		
function gotoPrevQuestion(questionNo){
	let answers = localStorage.getItem("answers");
	if(null == answers){
		let userAnswers = [];
		var answersGiven = document.getElementsByName("answer");
		for(i = 0; i < answersGiven.length; i++) {
			if(answersGiven[i].checked)
				userAnswers.push({question: questionNo,answer: answersGiven[i].value});
		}
		localStorage.setItem("answers", JSON.stringify(userAnswers));
		console.log('Answer Added');
	}
	else {
		//question already Answered
		let userAnswers = JSON.parse(answers);
		let oldQuestion = userAnswers.find((ques) => ques.question == questionNo);
		if(oldQuestion){
			var answersGiven = document.getElementsByName("answer");
			for(i = 0; i < answersGiven.length; i++) {
				if(answersGiven[i].checked)
					oldQuestion.answer = answersGiven[i].value
		    }
			userAnswers.map((q) => {
				if(q.question == oldQuestion.question){
					q.answer = oldQuestion.answer;
				} 
			}
			)
			localStorage.setItem("answers", JSON.stringify(userAnswers));
		}
		else{
			var answersGiven = document.getElementsByName("answer");
			for(i = 0; i < answersGiven.length; i++) {
				if(answersGiven[i].checked)
					userAnswers.push({question: questionNo,answer: answersGiven[i].value});
		    }
			localStorage.setItem("answers", JSON.stringify(userAnswers));
		}
	}
	window.location = "quiz.jsp?qno="+(questionNo-1);
}
	
function loadAnswer(questionNo){
	
	let answers = localStorage.getItem("answers");
	
	if(null != answers){
		
		let userAnswers = JSON.parse(answers);
		
		let oldQuestion = userAnswers.find((ques) => ques.question == questionNo);
		if(oldQuestion){
			
			var questionElement = document.getElementsByName("answer");
			for(i = 0; i < questionElement.length; i++) {
                if(questionElement[i].value == oldQuestion.answer)
                	questionElement[i].checked=true;
                }
			
		}
    }
	
	
}

function submitAnswers(){
	var decision = confirm("Do you want to submit?");
	if(decision){
		let answers = localStorage.getItem("answers");
		let userAnswers = JSON.parse(answers);
		var responses = document.getElementById('responses');
		responses.value = answers;
		var form = document.getElementById('submitForm');
		localStorage.clear();
		form.submit();
	}
}

	</script>	
		
	</head>
	<style>
			.jumbotron {
    background: rgba(255, 255, 255, 0.25);
     border: 2px solid white;
}

html { margin: 0px; height: 90%; width: 100%; } 
	body { 
	margin: 0px; 
	height: 100%; 
	width: 98%; 
	background-size:cover; 
	color:white; 
	background-color: #000000;
opacity: 1;
background: radial-gradient(circle, transparent 20%, #000000 20%, #000000 80%, transparent 80%, transparent), radial-gradient(circle, transparent 20%, #000000 20%, #000000 80%, transparent 80%, transparent) 10px 10px, linear-gradient(#1e005d 0.8px, transparent 0.8px) 0 -0.4px, linear-gradient(90deg, #1e005d 0.8px, #000000 0.8px) -0.4px 0;
background-size: 20px 20px, 20px 20px, 10px 10px, 10px 10px;}
	#footer {
   
   left:0px;
   bottom:0px;
   height:70px;
   width:100%;
  
   color: white;
}
			
		</style>
		
		
	<%
		int questionNo = Integer.parseInt(request.getParameter("qno"));
		List<QuestionEntity> questionList = (List<QuestionEntity>)session.getAttribute("questionList");
		String[] answers = new String[questionList.size()];
		
	%>
	
	
	
	<body onload=loadAnswer(<%=questionNo %>)>
	<div class="row" style="height:110px;">
	<div class="col-md-2 text-center mt-3" >
	
		<h2>DQuiz.</h2>
	</div>
	<div class="col-md-7">
	</div>
	<div class="col-md-3 text-center mt-4">
		<h4>Welcome: <%= session.getAttribute("name") %></h4>
	</div>
	</div>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8 jumbotron" id = "questionPanel" >
		<h2>Question <%= questionNo %> </h2>
		<% QuestionEntity question = questionList.get(questionNo-1); %>
		<h5><%= question.getQuestion() %></h5>
		
		
		<div class = "row" style="margin-top: 30px;">
		<div class= "col-md-6">
			<input type="radio" id= "answer" name="answer" value="option1">&nbsp;&nbsp;&nbsp;&nbsp;<%= question.getOption1() %> <br/>
		</div>
		<div class= "col-md-6">
			<input type="radio" id= "answer" name="answer" value="option2">&nbsp;&nbsp;&nbsp;&nbsp;<%= question.getOption2() %>	<br/>
		</div>
		</div>
		
		<div class = "row">
		<div class= "col-md-6">
			<input type="radio" id= "answer" name="answer" value="option3">&nbsp;&nbsp;&nbsp;&nbsp;<%= question.getOption3() %>	<br/>
		</div>
		<div class= "col-md-6">
			<input type="radio" id= "answer" name="answer" value="option4">&nbsp;&nbsp;&nbsp;&nbsp;<%= question.getOption4() %>	<br/>
		</div>
		</div>
		<br />
		<br />
		<br />
		<div class="row">
		<div class="col-md-4 text-right">
		<% if(questionNo!=1) {%>
		<button class= "btn btn-success " style="width:100px;" onclick = gotoPrevQuestion(<%=questionNo%>) > Prev </button>
		<%}else{} %>
		</div>
		<div class="col-md-4 text-left">
		<% if(questionNo!= questionList.size()) {%>
		<button class= "btn btn-success " style="width:100px;"  onclick = gotoNextQuestion(<%=questionNo%>)> Next </button>
	<% }else {%>
		<button class= "btn btn-success " style="width:100px;"  onclick = markLastQuestion(<%=questionNo%>)> Next </button>
	<% } %>
		</div>
		<% if(questionNo== questionList.size()) {%>
		<div class="col-md-4 text-right">
		<form action=SubmitServlet method="post" id="submitForm">
	
	<input type="hidden" name="name" id="name" value=<%=session.getAttribute("name")%>>
	<input type="hidden" name="responses" id="responses">
  	<input class= "btn btn-success" type="submit" value="Submit" onclick = "submitAnswers()">
	</form>
		</div><% } %>
		</div>
			<center>
		
		
	
	</div>
	</center>
	<div class="col-md-2">
	
	</div>
	
	</div>
		 <!-- Copyright -->
  <div id="footer" class="footer-copyright text-center py-3"><h4>DQuiz : Online Quiz Platform</h4>
  </div>
  <!-- Copyright -->
	
	</body>
</html>