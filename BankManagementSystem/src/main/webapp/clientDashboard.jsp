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
		
		<title>Dashboard</title>
		<%@include file="logo.jsp" %>
		    
		<style>
			<%@include file="css/bootstrap.min.css"%>
			
			.box:hover {
            transform: scale(1.02);
            transition: transform 0.3s ease-in-out;
        	}
		</style>
		
		<link rel="stylesheet" type="text/css" href="/css/styles.css">
		
		<nav class="bg-dark navbar d-flex justify-content-end">
		
			<!-- <a href="editClientProfile.jsp"><p class="text-white">Edit Profile</p></a>
			
			 &nbsp;&nbsp;&nbsp;&nbsp;
			 
			<a href="logout.jsp"><p class="text-white">Logout</p></a> -->
			
		</nav>
		
	</head>
	
	<body class="text-center p-5 m-5">
		
		
		<div class="card text-center ">
			<h1 class="m-3">Services</h1>
			
			<br/><br/><br/>
			
			<a href="accountDetail.jsp">
				<div class="container card  shadow hover1 m-auto box">
						<figure class="d-flex align-items-center">
							<img style="height:10rem;" class="float-left mt-5 mr-5" src="images/detail.svg" alt="users image"/>
							<h2 class="text-left ml-5 card-body hover1 align-middle">Account Detail</h2>
						</figure>
					
				</div>
			</a>
			
			<br/><br/>
			
			<a href="transfer.jsp">
				<div class="container m-auto card shadow box">
						<figure class="d-flex align-items-center">
							<img style="height:14rem;" class="float-left mt-5 mr-5" src="images/transfer.svg" alt="users image"/>
							<h2 class="text-left ml-5 card-body hover1 align-middle">Transfer</h2>
						</figure>
					
				</div>
			</a>
			
			<br/><br/>
			
			<a href="withdraw.jsp">
				<div class="container m-auto card shadow box">
						<figure class="d-flex align-items-center">
							<img style="height:14rem;" class="float-left mt-5 mr-5" src="images/withdraw.svg" alt="users image"/>
							<h2 class="text-left ml-5 card-body hover1 align-middle">Withdraw</h2>
						</figure>
					
				</div>
			</a>
			
			<br/><br/>
			
			<a href="transactionHistory.jsp">
				<div class="container card m-auto shadow box">
						<figure class="d-flex align-items-center">
							<img style="height:11rem;" class="float-left mt-5 mr-5" src="images/history.svg" alt="users image"/>
							<h2 class="text-left ml-5 card-body hover1 align-middle">Transaction History</h2>
						</figure>
					
				</div>
			</a>
			
			<br/><br/>
			
		</div>
	</body>
</html>