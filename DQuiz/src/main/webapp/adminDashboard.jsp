<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>

	
<%@page import="com.dquiz.entities.QuestionEntity"%>

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Admin Dashboard | DQuiz</title>		
		<%@include file="components/common.jsp"%>	
		
	</head>
		
	<style>
	
	.custom-bg{
	  background: #000000!important;
	}

	#footer {
  
   left:0px;
   bottom:0px;
   height:70px;
   width:100%;
   background-color:black;
   color: white;
}
	html { margin: 0px; height: 100%; width: 100%; } 
	body { 
	margin: 0px; 
	min-height:379px; 
	width: 100%; 
	background-size: cover;
	background-color: #ebf8fe;
	opacity: 1;
	background: radial-gradient(circle, transparent 20%, #ebf8fe 20%, #ebf8fe 80%, transparent 80%, transparent), radial-gradient(circle, transparent 20%, #ebf8fe 20%, #ebf8fe 80%, transparent 80%, transparent) 10px 10px, linear-gradient(#78baff 0.8px, transparent 0.8px) 0 -0.4px, linear-gradient(90deg, #78baff 0.8px, #ebf8fe 0.8px) -0.4px 0;
	background-size: 20px 20px, 20px 20px, 10px 10px, 10px 10px;
	
	}
	</style>	
	
	
	
	
	<body style="">
		<%@include file="components/navbar.jsp"%>
		<% List<QuestionEntity> questionList = (List<QuestionEntity>)session.getAttribute("questionList"); %>
		<div class="container-fluid mb-5 " style="min-height: 379px;">
			<div class="row mt-5">
			<div class="col-md-2" style= >
			<form action=ViewResponseServlet method="post">
			<button type="submit" class="btn btn-primary custom-bg border-0">View Responses</button>
			</form>
			</div>
				<div class="col-md-10 ">
				<h3>Questions </h3>
				
				<% if(null != request.getAttribute("Upload Status")){
					if(request.getAttribute("Upload Status").equals("success")){ %>
					<h5>Upload Success</h5>
					<%}else{%>
					<h5>Upload Failure</h5>
					<%}}%>
				
				
				
					<table class="table table-light">
                       <thead class="thead-dark">
                         <tr>
                           <th scope="col">No.</th>
                           <th scope="col">Question</th>
                           <th scope="col">Option A</th>
                           <th scope="col">Option B</th>
                           <th scope="col">Option C</th>
                           <th scope="col">Option D</th>
                           <th scope="col">Answer Option</th>
                         </tr>
                       </thead>
                       <tbody>
                       <%
                       		int count=0;
                       		for(QuestionEntity q: questionList){
                       %>
                         <tr>
      						<th scope="row"><%= ++count %></th>
      						<td><%= q.getQuestion() %></td>
      						<td><%= q.getOption1() %></td>
      						<td><%= q.getOption2() %></td>
      						<td><%= q.getOption3() %></td>
      						<td><%= q.getOption4() %></td>
      						<td><%= q.getAnswer() %></td>
      						<%} %>
    					</tr>
    					
  					</tbody>
				</table>
				<center>
				<button class="btn btn-primary custom-bg border-0"  data-toggle="modal" data-target="#add-question-modal">Add Question</button>
						</center>									
				</div>
			</div>
		</div>	
		
		
		<!-- Add Question Modal -->
	<div class="modal fade" id="add-question-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Question</h5>
					<button type="button" class="close" style="color:white;" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form action="AddQuestionServlet" method="post">
						<div class="form-group">
								<textarea style="height: 150px" class="form-control" name="question" id="question" placeholder="Enter Question" required></textarea> 
						</div>
						<div class="form-group">
								<input type="text" class="form-control" name="option1" id="option1" placeholder="Enter Option1"  required> 
						</div>
						<div class="form-group">
								<input type="text" class="form-control" name="option2" id="option2" placeholder="Enter Option2"  required> 
						</div>
						<div class="form-group">
								<input type="text" class="form-control" name="option3" id="option3" placeholder="Enter Option3"  required> 
						</div>
						<div class="form-group">
								<input type="text" class="form-control" name="option4" id="option4" placeholder="Enter Option4"  required> 
						</div>
						<div class="form-group">
						<label for="answer">Choose Correct Option</label>
						<br/>
							<input type="radio" name="answer" value="option1"> Option A &nbsp;
							<input type="radio" name="answer" value="option2"> Option B	&nbsp;
							<input type="radio" name="answer" value="option3"> Option C	&nbsp;
							<input type="radio" name="answer" value="option4"> Option D &nbsp;
								 
						</div>
						<div class="container text-center">
							<button class="btn btn-success">Add Question</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
						
						
						
					</form>
				</div>
								
			</div>
		</div>
		
	</div>
	<!-- Copyright -->
  <div id="footer" class="footer-copyright text-center py-3"><h4>DQuiz : Online Quiz Platform</h4>
  </div>
  <!-- Copyright -->
	
			<!-- Container (Contact Section) -->
	
	</body>
	
</html>