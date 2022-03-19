
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>

	
<%@page import="com.dquiz.entities.UserEntity"%>

<%@page import="java.util.ArrayList"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% UserEntity userObj = (UserEntity)session.getAttribute("userObj");

%>
	<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
		<div class="container">
			  <h1 style = "color:white" class="navbar-brand" href="index.jsp">DQuiz.</h1>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active">
			        <a class="nav-link" href="index.jsp">Home</a>
			      </li>
				
		
			       
			        
			        </div>
			      </li>
			
			    </ul>
			    
			    <ul class="navbar-nav ml-auto">
			    
			    	
			    
			    	<%-- <% if(null == u1){ %> --%>
			    	
			    	<% if(userObj == null){ %>  
			    		
			    		<li class="nav-item active">
				       		 <a class="nav-link" href="login.jsp">Login</a>
				      	</li>
				    	<li class="nav-item active">
				       		 <a class="nav-link" href="register.jsp">Register</a>
				      	</li>
				     
			    		
			    	 <% }  else { %>
			    	
			    		
			    		<li class="nav-item active">
				       		 <a class="nav-link font-weight-bold" href="adminDashboard.jsp" > Welcome : <%= userObj.getUserName() %></a>
				      	</li>
				    	<li class="nav-item active">
				       		 <a class="nav-link" href=LogoutServlet>Logout</a>
				      	</li> 
				
			    	 <% } %> 
			    
				      	
			    </ul>
			  </div>
		 </div>
	</nav>
</body>
</html>


