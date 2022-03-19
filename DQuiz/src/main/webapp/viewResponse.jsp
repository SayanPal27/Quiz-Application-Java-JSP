<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>

	
<%@page import="com.dquiz.entities.ResponseEntity"%>

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Responses | DQuiz</title>		
		<%@include file="components/common.jsp"%>		
	</head>
	
	<style>
	
	#footer {
  
   left:0px;
   bottom:0px;
   height:70px;
   width:100%;
   background-color:black;
   color: white;
}
	
	.custom-bg{
	  background: black!important;
	}
	
	
	html { margin: 0px; height: 100%; width: 100%; } 
	body { 
	margin: 0px; 
	min-height: 100%; 
	width: 100%;
	background-color: #ebf8fe;
	opacity: 1;
	background: radial-gradient(circle, transparent 20%, #ebf8fe 20%, #ebf8fe 80%, transparent 80%, transparent), radial-gradient(circle, transparent 20%, #ebf8fe 20%, #ebf8fe 80%, transparent 80%, transparent) 10px 10px, linear-gradient(#78baff 0.8px, transparent 0.8px) 0 -0.4px, linear-gradient(90deg, #78baff 0.8px, #ebf8fe 0.8px) -0.4px 0;
	background-size: 20px 20px, 20px 20px, 10px 10px, 10px 10px; 
	}
	</style>	
	
	
	<body >
		<%@include file="components/navbar.jsp"%>
		<% List<ResponseEntity> responseList = (List<ResponseEntity>)session.getAttribute("responseList"); %>
			<div class="container-fluid mb-5 " style="min-height: 379px;">
			<div class="row mt-5">
			<div class="col-md-2" >
			</div>
				<div class="col-md-8 ">
				<h3>Responses </h3>

					<table class="table table-light">
                       <thead class="thead-dark">
                         <tr>
                           <th scope="col">No.</th>
                           <th scope="col">Name</th>
                           <th scope="col">Total Questions</th>
                           <th scope="col">Correct</th>
                           <th scope="col">Percentage</th>
                         
                    
                         </tr>
                       </thead>
                       <tbody>
                       <%
                       		int count=0;
                       if(responseList != null){
                       		for(ResponseEntity r: responseList){
                       %>
                         <tr>
      						<th scope="row"><%= ++count %></th>
      						<td><%= r.getName() %></td>
      						<td><%= r.getTotal() %></td>
      						<td><%= r.getCorrect() %></td>
      						<td><%= r.getPercentage() %></td>
      						
      						
      						
    					</tr>
    					<% }}else{ %>
    					<h2>No Responses Recorded Yet</h2>
    					<% } %>
    					
    					
  					</tbody>
				</table>
				<center>
				<a href="adminDashboard.jsp"><button class="btn btn-primary custom-bg border-0" >Back </button></a>
						</center>									
				</div>
				<div class="col-md-2" >
			</div>
				
			</div>
			
		</div>	
				
		
	 <!-- Copyright -->
  <div id="footer" class="footer-copyright text-center py-3"><h4>DQuiz : Online Quiz Platform</h4>
  </div>
  <!-- Copyright -->
	</body>
			<!-- Container (Contact Section) -->
	
			
		
</html>