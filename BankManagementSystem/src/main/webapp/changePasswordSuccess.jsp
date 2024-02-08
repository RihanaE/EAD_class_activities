<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
			if( session.getAttribute("userId") == null){response.sendRedirect("login.jsp");} 
		%>
		<meta charset="UTF-8">
		<title>Success</title>
		
		<link rel="stylesheet"
			href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		
		<link rel="stylesheet" href="css/style.css">
		<style>
			<%@include file="css/bootstrap.min.css"%>
			.bg-color{
				background-color:#F5F5F5;
			}
		</style>
	</head>
	
	
	<body class="m-auto bg-color">
		<br><br>
		<br><br>
	
		<div class="main h-100% align-middle vertical-center bg-color">
	
			
			<section class="sign-in align-middle">
				<div class="container">
					<div class="signin-content">
						<div class="signin-image">
							
							<figure >
								
								<img width=40% src="images/password.svg" alt="sign ip image">
							</figure>
							<a href="index.jsp" class="signup-image-link"></a>
						</div>
	
						<div>
							
							<h1 class="text-success"> <i class = "zmdi zmdi-shield-check text-success"></i>Success</h1>
    						<p>Password changed successfully</p>
    						
    						
							
							<div class="m-5">
								<a href="clientDashboard.jsp"><button class="btn btn-dark w-75 m-auto">Back to Service Page</button></a>
							</div>
							
						</div>
					</div>
				</div>
			</section>
	
		</div>
		
		<!-- <div class="container card border-success text-center p-5 m-5">
		
			<h1 class="text-success"> <i class = "zmdi zmdi-shield-check text-success"></i>	 Success</h1>
			
			<div class="m-5">
				<a href="clientDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Back to Service Page</button></a>
			</div>
			
		
		</div> -->
		
		
	
	</body>
</html>