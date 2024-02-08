<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
			if( session == null || session.getAttribute("userId") == null){response.sendRedirect("login.jsp");} 
		%>
		<meta charset="UTF-8">
		<title>Create Account</title>
		<style>
			<%@include file="/css/bootstrap.min.css"%>
		</style>
		<link rel="stylesheet"
			href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		<!-- Main css -->
		<link rel="stylesheet" href="css/style.css">
	</head>
	
	<%	
	
			String name = "";
			String email = "" ;
			String phone = "";
			String account = "";
			float amount = (float) 0.0 ;
			
		if(Integer.parseInt(request.getParameter("id")) != (Integer) session.getAttribute("userId")){
		    name = request.getParameter("name");
		    email = request.getParameter("email");
		    phone = request.getParameter("phone");
		    account = request.getParameter("account");
		    amount = Float.parseFloat(request.getParameter("amount"));
		    int id = Integer.parseInt(request.getParameter("id"));
		    session.setAttribute("editId", id);
		    
		    
		} else {
			int id = Integer.parseInt(request.getParameter("id"));
		    session.setAttribute("editId", id);
		}
	
	    
	%>
	
		
	<h1 class="text-center">Edit</h1>
	<body class="m-5">
		
		<form method="post" action="editUserServlet" class="container card m-auto p-5">
			<div class="form-group">
				<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> <input
					type="text" name="name" id="name" placeholder="Name" value="<%=name %>" required/>
			</div>
			<div class="form-group">
				<label for="email"><i class="zmdi zmdi-email"></i></label> <input
					type="email" name="email" id="email" placeholder="Email" value="<%=email %>" required/>
			</div>
			
			<div class="form-group">
				<label for="phone"><i class="zmdi zmdi-phone"></i></label>
				<input type="text" name="phone" id="phone"
					placeholder="Phone number" value="<%=phone %>"/>
			</div>
			
			<div class="form-group">
				<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
					type="password" name="password" id="password" placeholder="Password" required/>
			</div>
			
			<div class="form-group">
				<label for="account"><i class="zmdi zmdi-lock-outline"></i></label>
				<input type="text" name="account" value="<%=account %>" id="account"
					placeholder="Account Number" required/>
			</div>
			
			<%if ("client".equals(session.getAttribute("role").toString()) || (Integer)session.getAttribute("userId") != Integer.parseInt(request.getParameter("id"))) {%>
				<div class="form-group">
					<label for="amount"><i class="zmdi zmdi-money"></i></label>
					<input type="text" name="amount" value="<%=amount %>" id="amount"
						placeholder="Amount" />
				</div>
				
			<%} %>
			<!-- <div class="form-group">
				<label for="role"><i class="zmdi zmdi-account-o"></i></label>
				<input type="text" name="role" id="role"
					placeholder="Role" />
			</div> -->
			
			<div class="form-group form-button m-auto">
				<input type="submit" name="edit" id="edit"
					class="form-submit m-auto" value="Edit" />
			</div>
		</form>
		
			<div class="m-5 text-center">
				<%if ("client".equals(session.getAttribute("role").toString())) {%>
					<a href="adminUserDetail.jsp"><button class="btn btn-dark w-25 m-auto">Return to Users Detail page</button></a>
				<%} else { %>
					<a href="adminDashboard.jsp"><button class="btn btn-dark w-25 m-auto">Return to Dashboard</button></a>
				<%} %>
			</div>
	
	</body>
</html>