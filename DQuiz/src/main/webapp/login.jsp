<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login | DQuiz</title>		
		<%@include file="components/common.jsp"%>		
	</head>
	
	<style>
	
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
	
	
	
	
	#footer {
   position:fixed;
   left:0px;
   bottom:0px;
   height:70px;
   width:100%;
   background-color:black;
   color: white;
}
	
	
	</style>	
	
	
	<body >
		<%@include file="components/navbar.jsp"%>
 
		<div class="container mb-3 mt-5">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					
					<div class="card mt-3">
						
						<div class="card-header custom-bg text-white">
							<h3> Login here </h3>
						</div>
						
						<div class="card-body">
							<%-- <%@include file="components/response.jsp"%> --%>
						<%if(null != request.getAttribute("authenticationFail")){ %>
							<h5 style = "color:red"> <%=request.getAttribute("authenticationFail") %></h5>
						<%} %>
							<form action=AdminLoginServlet method="post">
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							  </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
							  </div>
							  
							  <a href="register.jsp" class="text-center d-block mb-2"> If not registered click here</a>
							  
							  <div class="container text-center">
							  	<button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
							  	<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
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