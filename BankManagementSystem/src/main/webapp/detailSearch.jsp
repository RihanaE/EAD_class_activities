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
		<title>Transaction History</title>
		<style>
			<%@include file="css/bootstrap.min.css"%>
		</style>	
	</head>
	

	<%
	
		String role = session.getAttribute("role").toString();
	
	%>
	
	<h1 class="text-center m-5">Result</h1>
	
	<body class="m-auto text-center container">
		
		<h1 class="m-5"></h1>
		
		<table class="table table-striped container m-5">
		<thead class="bg-dark text-white">
			<tr>
				<td>Id</td>
				<td>Name</td>
				<td>Email</td>
				<td>Phone Number</td>
				<td>Account Number</td>
				<td>Category</td>
				<td>Deposit</td>
				
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="detail" items="${searchedList}">
				<tr>
					<td>${detail.id }</td>
					<td>${detail.name}</td>
					<td>${detail.email }</td>
					<td>${detail.phone}</td>
					<td>${detail.account }</td>
					<td>${detail.role }</td>
					<td>${detail.amount }
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
		
		<div class="m-5">
			<a href="adminUserDetail.jsp"><button class="btn btn-dark w-25 m-auto">Back</button></a>
		</div>
				
		
	
	</body>
</html>