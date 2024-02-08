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
		<title>Admin Dashboard</title>
		<%@include file="logo.jsp" %>
		
		<style>
		
			<%@include file="/css/bootstrap.min.css"%>
			
			.box:hover {
            transform: scale(1.02);
            transition: transform 0.3s ease-in-out;
        	}
			
		</style>
		
		<link rel="stylesheet" type="text/css" href="/css/styles.css">
		
		<nav class="bg-dark navbar d-flex justify-content-end">
			<%-- <a href="editByAdmin.jsp?id=<%=(Integer) session.getAttribute("userId")%>"><p class="text-white">Edit Profile</p></a>
			 
			 &nbsp;&nbsp;&nbsp;&nbsp;
			 
			<a href="logout.jsp"><p class="text-white">Logout</p></a> --%>
		</nav>
		
	</head>
	
	
	
	<body class="text-center p-5 m-5">
		<%int id = (Integer) session.getAttribute("userId"); %>
	
	
		<div class="card text-center ">
			<h1 class="m-3">Welcome to the Admin's Dashboard</h1>
			
			<br/><br/><br/>
			
			<a href="adminUserDetail.jsp">
				<div class="container card  shadow hover1 m-auto box">
					<figure class="d-flex align-items-center">
						<img style="height:14rem;" class="float-left mt-5 mr-5" src="images/users.svg" alt="users image"/>
						<h2 class="text-left ml-5 card-body hover1 align-middle">See users</h2>
					</figure>
					
					
				</div>
			</a>
			
			<br/><br/>
			
			<a href="adminCreateAccount.jsp">
				<div class="container m-auto card shadow box">
					<figure class="d-flex align-items-center">
						<img style="height:11rem;" class="float-left mt-5 mr-5" src="images/account.svg" alt="users image"/>
						<h2 class="text-left ml-5 card-body hover1 align-middle">Create Account</h2>
					</figure>
					
				</div>
			</a>
			
			<br/><br/>
			
			<a href="adminTransaction.jsp">
				<div class="container card m-auto shadow box">
					<figure class="d-flex align-items-center">
							<img style="height:7rem;" class="float-left mt-5 mr-5" src="images/transaction.svg" alt="users image"/>
							<h2 class="text-left ml-5 card-body hover1 align-middle">Transaction Details</h2>
						</figure>
					
				</div>
			</a>
			
			<br/><br/>
			
		</div>
	</body>
</html>