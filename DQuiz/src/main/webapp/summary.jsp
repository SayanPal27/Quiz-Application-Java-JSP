<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    <%@page import="com.dquiz.entities.ResponseEntity"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Scorecard | Dquiz</title>		
		<%@include file="components/common.jsp"%>	
		
	</head>
		
	<style>
	
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
	

	.jumbotron {
	  background: rgba(255, 255, 255, 0.75);
	  
	  border: 2px solid white;
	  color: #000000;
	  border-top: solid white;
	}
	
	
	
	</style>	
	
	
	
	
	<body style=" ">
		
	<% ResponseEntity summary = (ResponseEntity)session.getAttribute("summary"); %>
	
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
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<div class="jumbotron text-center">
		
		<h1>Scorecard</h1>
		<div class="text-left">
	<h3>Name: <%= summary.getName() %></h3>
	<h3>Total Questions: <%= summary.getTotal() %></h3>
	<h3>Correct Answers: <%= summary.getCorrect() %></h3>
	<h3>Percentage: <%= summary.getPercentage() %></h3>
		</div>
		<div class="text-center">
		<a href="index.jsp"><button class= "btn btn-success">Back to Home</button></a>
		</div>
		</div>
	</div>
	<div class="col-md-2">
	</div>
	</div>
	
	
	
	
		 <!-- Copyright -->
  <div id="footer" class="footer-copyright text-center py-3"><h4>DQuiz : Online Quiz Platform</h4>
  </div>
  <!-- Copyright -->
	</body>
	
</html>