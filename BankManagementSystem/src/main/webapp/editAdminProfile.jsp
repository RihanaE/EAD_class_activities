<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
			if( session.getAttribute("userId") == null){response.sendRedirect("login.jsp");} 
		%>
		
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	
		<%
		
			
			int id =(Integer) session.getAttribute("userId");
			session.setAttribute("editId",id ); 
		
		%>
		
	<body>
	
	</body>
</html>