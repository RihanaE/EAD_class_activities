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
		<title>Insert title here</title>
		<link rel="stylesheet"
			href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		
		<link rel="stylesheet" href="css/style.css">
		<style>
			<%@include file="css/bootstrap.min.css"%>
		</style>
	</head>
	
	<%-- <%

		int id = (Integer) session.getAttribute("userId");
	%> --%>
	
	<nav class="navbar d-flex flex-row-reverse ">
			
				<p class="text-danger">
					<a href="" data-toggle="modal" data-target="#confirmationModal" >
					<button class="btn btn-dark btn-outline-danger my-2 my-sm-0 text-white">
						<i class="zmdi zmdi-delete"> &nbsp; &nbsp; Delete Account</i>
					</button></a>
				</p>
			
	</nav>
	<body class="m-5 p-5">
	
		<div class="modal" id="confirmationModal" tabindex="-1" role="dialog">
		    <div class="modal-dialog" role="document">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h5 class="modal-title">Confirm Logout</h5>
		          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		            <span aria-hidden="true">&times;</span>
		          </button>
		        </div>
		        <div class="modal-body">
		          <p>Are you sure you want to delete the account?</p>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
		          <a href="delete.jsp?id=<%=(Integer) session.getAttribute("userId") %>" class="btn logout btn-danger">Delete</a>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		<div class="container m-auto text-center">
		
			<%if("admin".equals(session.getAttribute("role"))){ %>
			
			<%} else { %>
				
				<h1>Change Password</h1>
				<form method="post" action="changePasswordServlet" class="card shadow m-5 p-5">
					<div class="form-group">
						<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
							type="password" name="password" id="password"
							placeholder="New Password" />
					</div>
					
					<div class="form-group form-button m-auto">
						<input type="submit"
							class="form-submit" value="Change Password" required />
					</div>
				</form>
			
			<%} %>
			
			
		
			<div class="m-auto text-center">
				<a href="clientDashboard.jsp"><button class="btn btn-dark m-4 w-25">Return to the Service Page</button></a>
			</div>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	</body>
</html>