<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%if( session.getAttribute("userId") == null){response.sendRedirect("login.jsp");} %>
<body>
	<%session.invalidate();%>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	 

%>
	<%response.sendRedirect("login.jsp"); %>

</body>
</html> --%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
     <!-- <script>
        // Use onload instead of onunload
        window.onload = function () {
            // Use history.pushState to add a new history entry
            history.pushState(null, null, document.URL);
            window.addEventListener('popstate', function () {
                history.pushState(null, null, document.URL);
            });
        };
    </script> -->
    
   
</head>
<body>
    <% 
        // Invalidate the session
        session.invalidate();
        
        // Prevent caching
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        
        // Redirect to the login page after logout
        
    %>
</body>

</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	    <title>Logout</title>
	    
	</head>
	
	<body>
	
		
	    <%
	        session.invalidate();
	    	response.sendRedirect("login.jsp");
	    
	    %>
	    
	    
	</body>
</html>
