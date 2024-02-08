<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Logo</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<style>
			
			.logo{
				margin:0;
				position:absolute;
				left:4%;
				top:2%;
			}
			
			.link{
				margin:0;
				position:absolute;
				right:10%;
				top:6%;
				color:#000;
				
			}
			
			.link a{
				color:#000;
				text-decoration:none;
				
			}
			
			
			.link a:hover{
				text-decoration:none;
				color:#0ea2bd;
				
			}
			
			.zoomable-word {
		      display: inline-block;
		      transition: transform 0.3s ease-in-out;
		    }
		
		    .zoomable-word:hover {
		     
		      color:#0ea2bd;
		      transform: scale(0.9); 
		    }
			
			
		</style>
	
	</head>
	<body>
	
		<div class="modal" id="confirmationModal" tabindex="-1" role="dialog">
		    <div class="modal-dialog" role="document">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h5 class="modal-title">Confirm Logout</h5>
		          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		            <span aria-hidden="true">&times;</span>
		          </button>
		        </div>
		        <div class="modal-body">
		          <p>Are you sure you want to logout?</p>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
		          <a href="logout.jsp" class="btn logout btn-danger">Logout</a>
		        </div>
		      </div>
		    </div>
		  </div>
  		
  		<a href= "index.jsp" >
			<figure class="mb-4">
				<img class="logo" src="images/logo.png" width="90rem" height="50rem" alt="sign ip image">
			</figure>
		</a>
		
		<div class="link">
			
			
			<%if(session.getAttribute("userId") != null) {%>
				<a href="index.jsp" class="mr-3 zoomable-word">Home</a>
				
				<%if("admin".equals(session.getAttribute("role").toString())) {%>
					<a href="editByAdmin.jsp?id=<%=(Integer) session.getAttribute("userId")%>" class="ml-3 mr-3 zoomable-word">Edit Profile</a>
				<%}else{ %>
					<a href="editClientProfile.jsp" class="ml-3 mr-3 zoomable-word ">Edit Profile</a> 
				<%} %>
					<a href="" data-toggle="modal" data-target="#confirmationModal" class=" zoomable-word">Logout</a>
			<%} %>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	</body>
</html>