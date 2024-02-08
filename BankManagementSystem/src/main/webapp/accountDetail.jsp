<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
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
		<title>Account Detail</title>
		
		<style>
			<%@include file="css/bootstrap.min.css"%>
		</style>
	</head>
	
	<jsp:include page="/clientDetailServlet" />
	<body class="m-auto container">
		<h1 class="m-5 text-center">Account Information</h1>
		<table class="table m-5">
			<thead class="bg-dark text-white">
				<tr>
					<td></td>
					<td>Name</td>
					<td>Account Number</td>
					<td>Email</td>
					<td>Phone Number</td>
					<td>Amount</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td>${clientDetail.name}</td>
					<td>${clientDetail.account}</td>
					<td>${clientDetail.email}</td>
					<td>${clientDetail.phone}</td>
					<td>${clientDetail.amount}</td>
				</tr>
			</tbody>
		</table>

		<div class="m-auto text-center">
			<a href="clientDashboard.jsp"><button class="btn btn-dark m-4 w-25">Return to the Service Page</button></a>
		</div>
	</body>
</html>