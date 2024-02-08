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
	
	
	
	<body class="m-auto text-center container">
		
		<h1 class="text-center m-5">Result</h1>
		
		<table class="table table-striped m-5">
			<thead class="bg-dark text-white">
				<tr>
					<%if(role.equals("client")) {%>
						<td></td>
						<td>Sender</td>
						<td>Reciever</td>
						<td>Sender Account</td>
						<td>Reciever Account</td>
						<td>Date</td>
						<td>Amount</td>
					<%} else{ %>
					
						<td>Id</td>
						<td>Sender</td>
						<td>Reciever</td>
						<td>Sender Account</td>
						<td>Reciever Account</td>
						<td>Date</td>
						<td>Amount</td>
					<%} %>
				</tr>
				
			</thead>
			<tbody>
				<c:forEach var="transfer" items="${searchedList}">
					<tr>
						<%if(role.equals("client")) {%>
							<td>#</td>
							<td>${transfer.sender}</td>
							<td>${transfer.reciever}</td>
							<td>${transfer.senderAccount}</td>
							<td>${transfer.recieverAccount}</td>
							<td>${transfer.date}</td>
							<td>${transfer.amount}</td>
						<%} else{ %>
							
							<td>${transfer.id}</td>
							<td>${transfer.sender}</td>
							<td>${transfer.reciever}</td>
							<td>${transfer.senderAccount}</td>
							<td>${transfer.recieverAccount}</td>
							<td>${transfer.date}</td>
							<td>${transfer.amount}</td>
						<%} %>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
		
		<div class="m-5">
			<%if(role.equals("client")) {%>
				<a href="transactionHistory.jsp"><button class="btn btn-dark w-25 m-auto">Back</button></a>
			<%} else{ %>
				<a href="adminTransaction.jsp"><button class="btn btn-dark w-25 m-auto">Back</button></a>
			<%} %>
		</div>
				
		
	
	</body>
</html>