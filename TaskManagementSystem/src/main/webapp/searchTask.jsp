<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Task</title>
<style>
<%@include file="css/bootstrap.min.css"%>
</style>
</head>
<body class="container text-center">

	<h1 class="text-center mt-4">Result</h1>
	<form action="searchTaskServlet" method="post">
	 <input type="text" name="taskTitle" required placeholder="Enter the title" class="form-control"> 
	 <button class="btn btn-success m-4">Search</button>
	</form>
	
	<div class="container">
	<c:if test="${not empty tasksSearched }">
		<table border ="1" class="table container">
			<thead class="table-dark">
				<tr>
					<th></th>
					<th>Title</th>
					<th>Description</th>
					<th>Due Date</th>
					<th>Priority</th>
					<th>Status</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
        <c:forEach var="task" items="${tasksSearched}">
            <tr>
                <td>*</td>
                <td>${task.title}</td>
                <td>${task.desc}</td>
                <td>${task.dueDate}</td>
                <td>${task.priority}</td>
                <td>${task.status}</td>
                <td><p class="text-success"><a href="editTask.jsp?id=${task.id}&taskTitle=${task.title}&dueDate=${task.dueDate}">Edit</a></p> <p ><a class="text-danger" href="deleteTask.jsp?id=${task.id}">Delete</a></p></td>
            </tr>
        </c:forEach>
    </tbody>
		</table>
	</c:if>
	</div>

</body>
<a href="dashboard.jsp"><button class="btn btn-dark">Return to the Dashboard</button></a>
</html>