<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Transaction History</title>
		<style>
			<%@include file="css/bootstrap.min.css"%>
	
		</style>	
	</head>
	
<%if(session.getAttribute("userId") == null){response.sendRedirect("login.jsp");return;} %>

<!-- <nav class="navbar d-flex flex-row-reverse">
	<form action="searchServlet" class="form-inline">
	    <input class="form-control mr-sm-2" name="item" type="search" placeholder="Search" aria-label="Search">
	    <button class="btn bg-dark btn-outline-success my-2 my-sm-0 text-white" type="submit">Search</button>
 	</form>
</nav> -->
	
	<nav class="navbar navbar-dark bg-dark d-flex flex-row-reverse">
		<form action="searchServlet" class="form-inline">
		    <input class="form-control mr-sm-2" name="item" type="search" placeholder="Search" aria-label="Search">
		    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	  	</form>
	</nav>
	
	
	<body class="m-auto text-center container">
		<jsp:include page="/transactionHistoryServlet"/>
		<h1>History</h1>
		
		<table class="table table-striped m-5">
			<thead class="bg-dark text-white">
				<tr>
					<td></td>
					<td>Sender</td>
					<td>Reciever</td>
					<td>Sender Account</td>
					<td>Reciever Account</td>
					<td>Date</td>
					<td>Amount</td>
				</tr>
				
			</thead>
			<tbody>
				<c:forEach var="transfer" items="${transactionHistory}">
					<tr>
						<td>#</td>
						<td>${transfer.sender}</td>
						<td>${transfer.reciever}</td>
						<td>${transfer.senderAccount}</td>
						<td>${transfer.recieverAccount}</td>
						<td>${transfer.date}</td>
						<td>${transfer.amount}</td>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
		
		<div class="m-5">
			<a href="clientDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Back to Service Page</button></a>
		</div>
				
		
	
	</body>
</html> --%>

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
	
	<jsp:include page="/transactionHistoryServlet"/>
	<nav class="navbar navbar-dark bg-dark d-flex flex-row-reverse">
		<form action="searchServlet" class="form-inline">
		    <input class="form-control mr-sm-2" name="item" type="search" placeholder="Search" aria-label="Search">
		    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	  	</form>
	</nav>
	<body class="m-auto text-center">
		<h1>History</h1>
		<br><br>
	
		<table class="table table-striped m-auto container">
				<thead class="bg-dark text-white">
					<tr>
						<td></td>
						<td>Sender</td>
						<td>Reciever</td>
						<td>Sender Account</td>
						<td>Reciever Account</td>
						<td>Date</td>
						<td>Amount</td>
					</tr>
					
				</thead>
				<tbody>
					<c:forEach var="transfer" items="${transactionHistory}">
						<tr>
							<td>#</td>
							<td>${transfer.sender}</td>
							<td>${transfer.reciever}</td>
							<td>${transfer.senderAccount}</td>
							<td>${transfer.recieverAccount}</td>
							<td>${transfer.date}</td>
							<td>${transfer.amount}</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
		
		<div class="m-5">
				<a href="clientDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Back to Service Page</button></a>
		</div>
	
	</body>
</html>