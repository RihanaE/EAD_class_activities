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
			session.invalidate();
		%> 
		<meta charset="UTF-8">
		<title>Success</title>
		<link rel="stylesheet"
			href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		<!-- Main css -->
		<link rel="stylesheet" href="css/style.css">
		<style>
			<%@include file="css/bootstrap.min.css"%>
		</style>
	</head>
	
	
	
	<br><br>
	<br><br>
	<body class="m-auto ">
		<br><br>
		<br><br>
		<div class="container card border-success text-center p-5 m-auto">
		
			<h1 class="text-success"> <i class = "zmdi zmdi-shield-check text-success"></i>	 Successfully Deleted</h1>
			
			<div class="m-5">
				<a href="register.jsp"><button class="btn btn-success w-25 mr-5">Register</button></a>
				<a href="index.jsp"><button class="btn btn-dark w-25 ml-5">Home</button></a>
			</div>
			
			
			
		
		</div>
		
		
	
	</body>
</html>