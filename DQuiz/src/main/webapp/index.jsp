<!DOCTYPE html>
<html>
	<head>
	  <title>DQuiz</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	   <%@ include file="components/common.jsp"%> 
	</head>
	
	<style>
	
		html { margin: 0px; height: 100%; width: 100%; } 
	body { margin: 0px; min-height: 100%; width: 100%; 
	background-color: #000000;
opacity: 1;
background: radial-gradient(circle, transparent 20%, #000000 20%, #000000 80%, transparent 80%, transparent), radial-gradient(circle, transparent 20%, #000000 20%, #000000 80%, transparent 80%, transparent) 10px 10px, linear-gradient(#00314e 0.8px, transparent 0.8px) 0 -0.4px, linear-gradient(90deg, #00314e 0.8px, #000000 0.8px) -0.4px 0;
background-size: 20px 20px, 20px 20px, 10px 10px, 10px 10px;}
	
	#footer {
   position:fixed;
   left:0px;
   bottom:0px;
   height:70px;
   width:100%;
   background-color:#2596be;
   color: white;
}
	
	.custom-bg{
	  background: #2596be; !important;
	}
	
	.jumbotron {
	background-color: #000000;
opacity: 1;
background: radial-gradient(circle, transparent 20%, #000000 20%, #000000 80%, transparent 80%, transparent), radial-gradient(circle, transparent 20%, #000000 20%, #000000 80%, transparent 80%, transparent) 10px 10px, linear-gradient(#0b0d27 0.8px, transparent 0.8px) 0 -0.4px, linear-gradient(90deg, #0b0d27 0.8px, #000000 0.8px) -0.4px 0;
background-size: 20px 20px, 20px 20px, 10px 10px, 10px 10px;
	  color: #ffffff;
	  border-top: solid;
	}
	
	
	
	</style>
	<body >
		
		 <%@include file="components/navbar.jsp"%>  	
		<div class="jumbotron text-center">
		<div class ="row" >
		<div class = "col-md-6" style="padding-top: 100px;">
		<h1 style = "color:#2596be;">Welcome to DQuiz!</h1>
		<h4 style = "color:#d3eaf2">The #1 Quiz Platform in the Making.</h4>
		<div class ="row" style="padding-top: 50px;">
		<div class = "col-md-5" >
		<a href = "login.jsp"><button style="width: 250px;" class="btn btn-success text-white" >Login for Admin</button></a>
		</div>
		<div class = "col-md-7">
		<a href = "player.jsp"><button style="width: 250px;" class="btn btn-success text-white" >Start Quiz ! </button></a>
		</div>
		</div>
		</div>
		<div class = "col-md-6 text-right">
		<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<lottie-player src="https://assets7.lottiefiles.com/packages/lf20_SkhtL8.json"  background="transparent"  speed="1"  style="width: 600px; height: 400px;"  loop autoplay></lottie-player>
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


