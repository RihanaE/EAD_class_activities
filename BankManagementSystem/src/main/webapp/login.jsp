<!DOCTYPE html>
<html lang="en">
	<head>
		<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		%>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		
		<title>Login</title>
		
		
		<link rel="stylesheet"
			href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		
		<link rel="stylesheet" href="css/style.css">
		<%@include file="logo.jsp" %>
	     
	</head>
	<body>
	
	<%if(session.getAttribute("errorMessage") != null) {%>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" >
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Error</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <%=session.getAttribute("errorMessage") %>
	      </div>
	      <div class="modal-footer text-center">
	        <button type="button" class="btn btn-secondary btn-danger" data-dismiss="modal" onClick="closeModal">Close</button>
	       
	      </div>
	    </div>
	  </div>
	</div>

		 
        <script>
            // Show the modal on page load if there's an error message
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("errorMessageModal").style.display = "block";
            });
            
            $(document).ready(function () {
                $('#exampleModalCenter').modal('show');
            });
        </script>
	<%} %>
	
		<div class="main">
	
			
			<section class="sign-in">
				<div class="container">
					<div class="signin-content">
						<div class="signin-image">
							<figure>
								<img src="images/signin.png" alt="sign ip image">
							</figure>
							<span class="signup-image-link">Do not have an account</span>
							<a href="register.jsp" class="signup-image-link text-dark font-weight-bold">Create an
								account</a>
						</div>
	
						<div class="signin-form">
							<h2 class="form-title">Sign in</h2>
							<form method="post" action="loginServlet" class="register-form"
								id="login-form">
								<div class="form-group">
									<label for="account"><i
										class="zmdi  zmdi-assignment-account"></i></label> <input
										type="text" name="account" id="account"
										placeholder="Account Number" required/>
								</div>
								<div class="form-group">
									<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
										type="password" name="password" id="password"
										placeholder="Password" required/>
								</div>
								
								<div class="form-group form-button">
									<input type="submit" name="login" id="login"
										class="form-submit" value="Log in" />
								</div>
							</form>
							
						</div>
					</div>
				</div>
			</section>
	
		</div>
	
		
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="js/main.js"></script>
		<script>
	        function validateForm() {
	            return true;
	        }
	
	        function closeModal() {
	            document.getElementById("errorMessageModal").style.display = "none";
	            <%session.setAttribute("errorMessage", null);%>
	        }
	    </script>
	</body>

</html>