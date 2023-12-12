<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
</head>
<style>
	<%@include file="/css/bootstrap.min.css"%>
</style>
<body>
<%@ include file="header.jsp" %>
	<h2 class="text-center">Registration Form</h2>
	
	<form class="container" action="RegistrationServlet" method="post">
		<b>Name</b>: <input class="form-control" type="text" name="name" value="<%=request.getParameter("name")%>"><br/>
		 
		<b>Email</b>: <input class="form-control" type="email" name="email" value="<%=request.getParameter("email")%>"><br/>
	
		<b>Password</b>: <input class="form-control" type="password" name="password">
		
		<input type="submit" class="btn btn-dark m-2" value="Register">
		
	</form>

</body>
</html>