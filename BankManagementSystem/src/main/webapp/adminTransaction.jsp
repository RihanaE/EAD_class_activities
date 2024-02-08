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
		<title>Transaction Details</title>
		<style>
			<%@include file="css/bootstrap.min.css"%>
		</style>
	</head>
	
	<jsp:include page="/adminTransactionHistoryServlet"/>
	<nav class="navbar navbar-dark bg-dark d-flex flex-row-reverse">
		<form action="searchServlet" class="form-inline">
		    <input class="form-control mr-sm-2" name="item" type="search" placeholder="Search" aria-label="Search">
		    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	  	</form>
	</nav>
	<body class="m-auto text-center">
		<h1 class="m-3">Transaction Details</h1>
		<br>
		<table class="table table-striped m-auto container">
			<thead class="bg-dark text-white">
				<tr>
				<td>Id</td>
				<td>Sender</td>
				<td>Reciever</td>
				<td>Sender Account</td>
				<td>Reciever Account</td>
				<td>Date</td>
				<td>Amount</td>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="detail" items="${usersDetail }">
					<tr>
						<td>${detail.id}</td>
						<td>${detail.sender}</td>
						<td>${detail.reciever}</td>
						<td>${detail.senderAccount }</td>
						<td>${detail.recieverAccount }</td>
						<td>${detail.date }</td>
						<td>${detail.amount }</td>
					</tr>
				
				</c:forEach>
			</tbody>
		</table>
		
		<div class="m-5">
			<a href="adminDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Return to Dashboard</button></a>
		</div>
	
	</body>
</html>