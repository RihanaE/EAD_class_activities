<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
 <style type="text/css">
    <%@include file="/css/bootstrap.min.css" %>
    
</style> 
</head>
<body>
<h2 class="text-center">Login</h2>
	<form class="container w-11" action="LoginServlet" method="post">
		Email: <input class="form-control" type="text" name="email"><br>
		Password: <input class="form-control"type="password" name="password"><br>
		<input type="submit" class="btn btn-success" value="Login">
	</form>
</body>
</html>