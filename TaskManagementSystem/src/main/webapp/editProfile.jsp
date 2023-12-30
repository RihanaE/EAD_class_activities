<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	<%@include file="css/bootstrap.min.css" %>
</style>
</head>
<body>

<form class="container" action="EditProfileServlet" method="post">
	Username: <input type="text" class="form-control m-4" required name="userName" value="<%=session.getAttribute("userName").toString()%>"/>
	Password: <input type="password" class="form-control m-4 " required name = "password"/>
	
	
	<div class="text-center">
		<button type="submit" class="btn btn-success text-center m-4">Edit</button> 
		<a href="dashboard.jsp" class="btn btn-dark m-4">Cancel</a>
	</div>
	
	
</form>

</body>
</html>