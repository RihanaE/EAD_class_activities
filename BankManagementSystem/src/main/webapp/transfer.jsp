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
		<title>Transfer</title>
		<style>
			<%@include file="/css/bootstrap.min.css"%>
		</style>
	</head>
	
	<body class="container text-center">
	<h1 class="text-center mt-5">Transfer</h1>
		<form action="transferServlet" method="post" class="card shadow p-5">
			<div class="m-3">
				<input name = "account" type="text" class="form-control m-auto" placeholder="Account Number" required>
			</div>
			
			<div class="m-3">
				<input name = "amount" type="number" class="form-control m-auto" placeholder="Amount" required>
			</div>
			
			<div class="m-5">
				<button class="btn w-25 btn-success m-auto">Transfer</button>
			</div>
		</form>
		<div class="m-5">
				<a href="clientDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Back to Service Page</button></a>
			</div>
			
	</body>
</html>