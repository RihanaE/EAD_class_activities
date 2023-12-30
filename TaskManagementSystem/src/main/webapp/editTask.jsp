<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	<%@include file="css/bootstrap.min.css"%>
</style>
</head>
<body>
	<% int id =Integer.parseInt(request.getParameter("id")); 
		session.setAttribute("taskId", id);
	%>
	<form class="container" action="EditTaskServlet" method="post">
		Task title: <input type="text" required name="taskTitle" class="form-control m-3" value="<%=request.getParameter("taskTitle")%>" />
		Description: <textarea rows="4" name="desc" cols="10" placeholder="Enter description" class="form-control m-3" ></textarea>
		Due date: <input type="date" required name="dueDate" class="form-control m-3" value="<%=request.getParameter("dueDate")%>"/>
		Priority: <select name="priority" class="form-control m-3" required>
					<option value="high">High</option>
					<option value="medium">Medium</option>
					<option value="low">Low</option>
				</select>
				
		Status: <select name="status" class="form-control m-3" required>
					<option value="incomplete">Incomplete</option>
					<option value="completed">Completed</option>
					
				</select>
		<div class="text-center">		
			<button type="submit" class="btn btn-success">Edit</button>
		</div>
	</form>

</body>
</html>