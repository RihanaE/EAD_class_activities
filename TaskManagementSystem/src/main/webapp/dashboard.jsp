<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
	<%@include file="css/bootstrap.min.css"%>
</style>
</head>
<body class="container bg-gradient" >
	<div class="container">
		<div class="row">
			<div class="col-md">
				<%String name = session.getAttribute("userName").toString();%>
				<h2 class="text-center mt-5"><%=name +"'s" %> DashBoard</h2>
				
			</div>
			<div>
				<a href="editProfile.jsp">Edit Profile</a>
			</div>
		</div>
	</div>
			<div>
				
				<h1 class="text-center">Welcome to your dashboard</h1>
				
			</div>
			<div class="container text-center bg-secondary mt-4 d-flex justify-content-around rounded mh-100 w-75">
				<h3 class="btn btn-dark m-3 shadow"><a href="taskCreate.jsp" class="text-white">Add Task</a></h3>
				<h3 class="btn btn-success m-3 shadow"><a href="displayServlet" class="text-white">Display Task</a></h3>
				<h3 class = "btn btn-warning m-3 shadow"><a href="searchTask.jsp" class="text-white">Search Task</a></h3>
			</div>


</body>
</html>