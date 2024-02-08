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
		<title>Success</title>
		
		<link rel="stylesheet"
			href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		
		<link rel="stylesheet" href="css/style.css">
		<style>
			<%@include file="css/bootstrap.min.css"%>
			.bg-color{
				background-color:#F5F5F5;
			}
		</style>
	</head>
	
	
	<body class="m-auto bg-color">
		<br><br>
		<br><br>
	
		<div class="main h-100% align-middle vertical-center bg-color">
	
			
			<section class="sign-in align-middle">
				<div class="container">
					<div class="signin-content">
						<div class="signin-image">
							 <figure>
								<img height=200rem width=200rem src="images/wrong.svg" alt="error page">
							</figure>
						</div>
	
						<div class="text-center m-auto">
							
							
							<h2 class="text-danger"> <i class = "zmdi zmdi-close-circle text-danger"></i><%=session.getAttribute("errorMessage") %></h2>
    						
    						
							
							<div class="m-5">
								<%if (session.getAttribute("role").toString().equals("client")){ %>
									<a href="clientDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Back</button></a>
									
									<%}else { %>
									
									<a href="adminDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Back</button></a>
									<%} %> 
								</div>
							
						</div>
					</div>
				</div>
			</section>
	
		</div>
		</body>
</html>
		<%-- <meta charset="UTF-8">
		<title>Error</title>
		
		<link rel="stylesheet"
			href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		<!-- Main css -->
		<link rel="stylesheet" href="css/style.css">
		
		<style>
			<%@include file="css/bootstrap.min.css"%>
		</style>
	
	</head>
	
	
	
	<body class="m-auto text-center">
		<div class="m-5">
		
			<div class="container card border-danger text-center p-5 m-5">
			
				<h1 class="text-danger"> <i class = "zmdi zmdi-close-circle text-danger"></i><%=session.getAttribute("errorMessage") %></h1>
				
				<div class="m-5">
				<%if (session.getAttribute("role").toString().equals("client")){ %>
					<a href="clientDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Back</button></a>
					
					<%}else { %>
					
					<a href="adminDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Back</button></a>
					<%} %>
				</div>
				
			
			</div>
		
		</div>
	
	</body>
</html> --%>


