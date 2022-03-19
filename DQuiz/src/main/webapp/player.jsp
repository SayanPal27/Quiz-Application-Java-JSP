<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Start | DQuiz</title>		
		<%@include file="components/common.jsp"%>	
		
	</head>
		
	<style>
	
	.custom-bg{
	  background: #000000!important;
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
	html { margin: 0px; height: 100%; width: 100%; } 
	body { margin: 0px; min-height: 100%; width: 100%; }
	</style>	
	
	
	
	
	<body style="background-color: #ebf8fe;
opacity: 1;
background: radial-gradient(circle, transparent 20%, #ebf8fe 20%, #ebf8fe 80%, transparent 80%, transparent), radial-gradient(circle, transparent 20%, #ebf8fe 20%, #ebf8fe 80%, transparent 80%, transparent) 10px 10px, linear-gradient(#78baff 0.8px, transparent 0.8px) 0 -0.4px, linear-gradient(90deg, #78baff 0.8px, #ebf8fe 0.8px) -0.4px 0;
background-size: 20px 20px, 20px 20px, 10px 10px, 10px 10px;">
		<%@include file="components/navbar.jsp"%>
		<div class="container-fluid mb-5 ">
			<div class="row mt-5">
				<div class="col-md-4 offset-md-4">
						<div class="card">
						
							<div align="center">
							<%-- <%@ include file="components/response.jsp" %> --%>
							</div>
														
							<div class="card-body px-5">
								
								<h3 class="text-center my-3">Fill in your Details</h3>
								
							
								
								<form action=QuizServlet method="post">
										
									<div class="form-group">
									    <label for="name">Name<font style="color:red" >*</font></label>
									    <input type="text" class="form-control" id="name" name="userName" aria-describedby="nameHelp" placeholder="Enter Username" required>
									    <small id="nameHelp" class="form-text text-muted">Username is a mandatory field for future login.</small>
									</div>
									
									
									<div class="container text-center">
										<button class="btn btn-outline-success font-weight-bold">Start</button>
										
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