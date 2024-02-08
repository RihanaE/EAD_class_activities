<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
			if(session == null || session.getAttribute("userId") == null){response.sendRedirect("login.jsp");} 
		%>
	<meta charset="UTF-8">
	
	<title></title>
	</head>
	<body>
		<%
			int id = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("editId", id);
		
		%>
		<jsp:forward page="/deleteServlet"/>
	
	</body>
</html>