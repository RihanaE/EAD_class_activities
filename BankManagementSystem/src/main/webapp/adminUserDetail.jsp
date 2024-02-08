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
		<title>Detail</title>
		<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
		<link rel="stylesheet" href="css/style.css">
		
		<style>
			<%@include file="css/bootstrap.min.css"%>
		</style>
		
	</head>
	
	<jsp:include page="/usersDetailServlet"/>
	<nav class="navbar navbar-dark bg-dark d-flex flex-row-reverse">
		<form action="detailSearchServlet" class="form-inline">
	    <input class="form-control mr-sm-2" name="item" type="search" placeholder="Search" aria-label="Search">
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	  </form>
	</nav>
	
	<body class="m-auto text-center">
		
		<h1 class="m-3">Details</h1>
		<br>
		<div class="container-fluid">
		
			<table class="table table-striped container m-auto">
				<thead class="bg-dark text-white">
					<tr>
						<td></td>
						<td>Name</td>
						<td>Email</td>
						<td>Phone Number</td>
						<td>Account Number</td>
						<td>Category</td>
						<td>Deposit</td>
						<td></td>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="detail" items="${usersDetail}">
						<tr>
							<td>${detail.id}</td>
							<td>${detail.name}</td>
							<td>${detail.email }</td>
							<td>${detail.phone}</td>
							<td>${detail.account }</td>
							<td>${detail.role }</td>
							<td>${detail.amount }
							<td>
								<p class="text-primary"><a href="editByAdmin.jsp?name=${detail.name}&email=${detail.email}&phone=${detail.phone}&account=${detail.account}&amount=${detail.amount}&id=${detail.id}"><i class = "zmdi zmdi-edit"> Edit</i></a></p>
								<p class="text-danger"><a href="delete.jsp?id=${detail.id}" class="text-danger"><i class="zmdi zmdi-delete"> Delete</i></a></p>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
	</body>
	
			<div class="m-5">
				<a href="adminDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Back to Admin Page</button></a>
			</div>

</html>