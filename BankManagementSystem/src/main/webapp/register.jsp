<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Sign Up</title>
	
	<!-- Font Icon -->
	<link rel="stylesheet"
		href="fonts/material-icon/css/material-design-iconic-font.min.css">
	
	<!-- Main css -->
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

		
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="registerServlet" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" required/>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" required/>
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password" placeholder="Password" required/>
							</div>
							<div class="form-group">
								<label for="phone"><i class="zmdi zmdi-phone"></i></label>
								<input type="text" name="phone" id="phone"
									placeholder="Your phone number" required/>
							</div>
							<div class="form-group">
								<label for="account"><i class="zmdi zmdi-assignment-account"></i></label>
								<input type="text" name="account" id="account"
									placeholder="Account Number" required/>
							</div>
							
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup.svg" alt="sing up image">
						</figure>
						Already have an account <a href="login.jsp" class="text-weight-bold text-dark font-weight-bold text-center">Login</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
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