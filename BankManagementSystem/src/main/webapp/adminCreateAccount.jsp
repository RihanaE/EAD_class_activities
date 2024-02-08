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
		
		
		<link rel="stylesheet" href="css/style.css">
	</head>
	
	
	<body class="container p-5">
		<h1 class="text-center m-5">Create Account</h1>
		
		<form method = "post" action="createAccountServlet" class="p-5 card m-auto">
			<div class="form-group">
				<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> <input
					type="text" name="name" id="name" placeholder="Name" />
			</div>
			
			<div class="form-group">
				<label for="email"><i class="zmdi zmdi-email"></i></label> <input
					type="email" name="email" id="email" placeholder="Email" />
			</div>
			
			<div class="form-group">
				<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
					type="password" name="password" id="password" placeholder="Password" />
			</div>
			
			<div class="form-group">
				<label for="phone"><i class="zmdi zmdi-phone"></i></label>
				<input type="text" name="phone" id="phone"
					placeholder="Phone number" />
			</div>
			
			<div class="form-group">
				<label for="account"><i class="zmdi zmdi-assignment-account"></i></label>
				<input type="text" name="account" id="account"
					placeholder="Account Number" />
			</div>
			
			<div class="form-group">
				<label for="amount"><i class="zmdi zmdi-money"></i></label>
				<input type="text" name="amount" id="amount"
					placeholder="Amount" />
			</div>
			
			<div class="form-group">
				<label for="role"><i class="zmdi zmdi-account-o"></i></label>
				<select name = "role" id="role" class="form-control">
					<option selected disabled>Role</option>
					<option value="admin">Admin</option>
					<option value="client">Client</option>
				</select>
			
			</div>
			
			<div class="form-group form-button">
				<input type="submit" name="signup" id="signup"
					class="form-submit" value="Register" />
			</div>
		</form>
		
		<div class="m-5 text-center">
			<a href="adminDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Return to Dashboard</button></a>
		</div>
			
		
	
	</body>
</html>