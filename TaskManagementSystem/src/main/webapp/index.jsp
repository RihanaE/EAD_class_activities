<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<style>
	<%@include file="css/bootstrap.min.css"%>
</style>
</head>
<body>
<h1 class="text-center">Register</h1>
<form action="registerServlet" method="post" class="container">
	Username: <input type="text" required name="userName" class="form-control m-4" />
	Password: <input type="password" required name="password" class="form-control m-4" />
	<div class="text-center">
		<button type="submit" class="btn btn-dark" >Register</button>
		<br />
		Already have an account <a href="login.jsp">LogIn</a>
	</div>
</form>
</body>
</html>