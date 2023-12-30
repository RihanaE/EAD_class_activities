<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Task</title>
<style>
	<%@include file="css/bootstrap.min.css"%>
</style>
</head>
<body>
<h1 class="mt-5"> Add Task</h1>
<form class="container" action="createTaskServlet">
	Task title: <input type="text" required name="taskTitle" class="form-control m-3"/>
	Description: <textarea rows="4" name="desc" cols="10" placeholder="Enter description" class="form-control m-3"></textarea>
	Due date: <input type="date" required name="dueDate" class="form-control m-3" />
	Priority: <select name="priority" class="form-control m-3">
				<option value="high">High</option>
				<option value="medium">Medium</option>
				<option value="low">Low</option>
			</select>
	<div class="text-center">		
		<button type="submit" class="btn btn-dark">Create</button>
	</div>
	
</form>
<a href="dashboard.jsp"><button class="btm btn-dark m-4">Return to Dashboard</button></a>

</body>
</html>