<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Register | DQuiz</title>		
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
	min-height: 100%; 
	width: 100%;
	background-color: #ebf8fe;
	opacity: 1;
	background: radial-gradient(circle, transparent 20%, #ebf8fe 20%, #ebf8fe 80%, transparent 80%, transparent), radial-gradient(circle, transparent 20%, #ebf8fe 20%, #ebf8fe 80%, transparent 80%, transparent) 10px 10px, linear-gradient(#78baff 0.8px, transparent 0.8px) 0 -0.4px, linear-gradient(90deg, #78baff 0.8px, #ebf8fe 0.8px) -0.4px 0;
	background-size: 20px 20px, 20px 20px, 10px 10px, 10px 10px; 
	}
	
	</style>	
	
	
	
	
	<body style="">
		<%@include file="components/navbar.jsp"%>
		<div class="container-fluid ">
			<div class="row mt-5 mb-5">
			<div class="col-md-3"></div>
			
				<div class="col-md-6">
						<div class="card">
						
							<div align="center">
							<%-- <%@ include file="components/response.jsp" %> --%>
							</div>
														
							<div class="card-body px-5">
								
								<h3 class="text-center my-3">Sign up Form</h3>
								
							 <% if( null != request.getAttribute("userSuccess")) { %> 	
								
								<h6 style="color: green"> User <%= request.getAttribute("userSuccess")  %> Successfully Registered</h6>
								
								 <% } %> 
								
									 <%if(null != request.getAttribute("authenticationFail")){ %> 
							<h5 style = "color:red"> <%=request.getAttribute("authenticationFail") %></h5>
						 <%} %>
						
								<form action=RegisterServlet method="post">
										
									<div class="form-group">
									    <label for="name">User Name<font style="color:red" >*</font></label>
									    <input type="text" class="form-control" id="name" name="userName" aria-describedby="nameHelp" placeholder="Enter Username" required>
									    <small id="nameHelp" class="form-text text-muted">Username is a mandatory field for future login.</small>
									</div>
									
									<div class="form-group">
									    <label for="emailId">User Email ID<font style="color:red" >*</font></label>
									    <input type="email" class="form-control" id="emailId" name="emailId" aria-describedby="emailHelp" placeholder="Enter EmailId" required>
									    <small id="emailHelp" class="form-text text-muted">Enter email ID to send further communication</small>
									</div>
									
									<div class="form-group">
									    <label for="password">User Password<font style="color:red" >*</font></label>
									    <input type="password" class="form-control" id="password" name="password" aria-describedby="passwordHelp" placeholder="Enter Password" required>
									    <small id="passwordHelp" class="form-text text-muted">Please remember your password</small>
									</div>
									
									<div class="form-group">
									    <label for="phone">User Phone #</label>
									    <input type="number" class="form-control" id="phone" name="phone" aria-describedby="phoneHelp" placeholder="Enter Phone #" min="1000000000" max="9999999999">
									    <small id="phoneHelp" class="form-text text-muted">Please provide contact number to reach out to</small>
									</div>
									
									<div class="form-group">
									    <label for="address">User Address</label>
									    <textarea style="height: 200px" class="form-control" id="address" name="address" aria-describedby="addressHelp" placeholder="Enter Address Details"></textarea>
									    <small id="addressHelp" class="form-text text-muted">Please provide your residence address</small>
									</div>
									
									<div class="container text-center">
										<button class="btn btn-outline-success font-weight-bold">Register</button>
										<button class="btn btn-outline-warning font-weight-bold">Reset</button>
									</div>						
			
										
								</form>
							
							</div>
						
						
						</div>
															
				</div>
			</div>
		</div>	
			<!-- Container (Contact Section) -->
		 <!-- Copyright -->
  <div id="footer" class="footer-copyright text-center py-3"><h4>DQuiz : Online Quiz Platform</h4>
  </div>
  <!-- Copyright -->
	</body>
</html>