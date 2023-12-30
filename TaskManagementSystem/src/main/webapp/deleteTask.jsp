<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<%@ include file="css/bootstrap.min.css"%>
</style>
</head>
<body class="container m-4">
	<% 

		int id =Integer.parseInt(request.getParameter("id")); 
		session.setAttribute("taskId", id);
	%>
<form class="container bg-light border border-danger p-10 text-center" action="deleteTaskServlet" method="post">
	<p>Are You Sure?</p>
	<button class="btn btn-danger text-white m-4" type="submit"> Yes </button>
	
	<a href="dashboard.jsp"><button class="btn btn-dark text-white m-4"> No</button></a>
</form>

</body>
</html>