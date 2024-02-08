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
		<title>Create Account</title>
		
		<style>
			<%@include file="/css/bootstrap.min.css"%>
		</style>
		
		<link rel="stylesheet"
			href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		<!-- Main css -->
		<link rel="stylesheet" href="css/style.css">
	</head>
	
	<h1 class="text-center">Edit</h1>
	<body class="m-5">
	
		<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
			if( session == null || session.getAttribute("userId") == null){response.sendRedirect("login.jsp");} 
	
		%>
		
		<form class="container card m-auto p-5">
				
			
			<div class="form-group">
				<label for="account"><i class="zmdi zmdi-lock-outline"></i></label>
				<input type="text" name="account" id="account"
					placeholder="Account Number" required/>
			</div>
			<div class="form-group">
				<label for="amount"><i class="zmdi zmdi-money"></i></label>
				<input type="text" name="amount" id="amount"
					placeholder="Amount" />
			</div>
			<div class="form-group">
				<label for="role"><i class="zmdi zmdi-account-o"></i></label>
				<input type="text" name="role" id="role"
					placeholder="Role" />
			</div>
			
			<div class="form-group form-button m-auto">
				<input type="submit" name="edit" id="edit"
					class="form-submit m-auto" value="Edit" />
			</div>
		</form>
		
	
	</body>
</html>