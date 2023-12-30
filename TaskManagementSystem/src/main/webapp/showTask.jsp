<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task List</title>
<style>
	<%@include file ="css/bootstrap.min.css"%>
</style>
</head>
<body class="container text-center m-4">

	
<h1 class = "mt-5">Tasks</h1>

<table border="1" class="container table text-center">
    <thead class="thead-dark">
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
        <c:forEach var="task" items="${tasks}">
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
<a href="dashboard.jsp"><button class="btn btn-dark m-4">Return to Dashboard</button></a>

</body>
</html>