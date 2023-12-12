<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
</head>
<body>
	
	<%
		String name = session.getAttribute("name").toString();
	%>
	<h1>Welcome, <%=name %>!</h1>
<!-- Display welcome message or user-specific
content here -->
</body>
</html>