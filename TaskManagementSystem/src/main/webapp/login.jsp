<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
<style>
	<%@include file="css/bootstrap.min.css" %>
</style>
</head>
<body>
<h1 class="text-center">Log In</h1>
<form class="container" action="loginServlet" method="post">
	Username: <input type="text" class="form-control m-4" required name="userName" />
	Password: <input type="password" class="form-control m-4 " required name = "password"/>
	
	
	<div class="text-center">
		<button type="submit" class="btn btn-success text-center">Log In</button> 
		<br/>
		Don't have an account <a href="index.jsp">Register</a>
	</div>
</form>

</body>
</html>