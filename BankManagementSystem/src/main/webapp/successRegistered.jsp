<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<style>
	<%@include file="css/bootstrap.min.css"%>
</style>
</head>

<body class="m-auto ">
	<div class="container card border-success text-center p-5 m-5">
	
		<h1 class="text-success"> <i class = "zmdi zmdi-shield-check text-success"></i>	 Successfully Registered</h1>
		
		<div class="m-5">
			<a href="login.jsp"><button class="btn btn-success w-25 m-auto">Login</button></a>
		</div>
		
	
	</div>
	
	#5F5F8A
	

</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		
		<title>Registration Success</title>
		
		
		<link rel="stylesheet"
			href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		
		<link rel="stylesheet" href="css/style.css">
		<style>
			<%@include file="css/bootstrap.min.css"%>
			body {
			  min-height: 100vh;
			  margin: 0;
			  padding: 0;
			}
			
			.vertical-center {
				  margin:0;
				  padding:1rem;
				  position: absolute;
				  top: 50%;
				  right:10%;
				  left:10%;
				  -ms-transform: translateY(-50%);
				  transform: translateY(-50%);
		}

		</style>
	     
	</head>
	<body class="align-middle h-100%">
	
		<div class="main h-100% align-middle vertical-center bg-white">
	
			
			<section class="sign-in align-middle shadow">
				<div class="container">
					<div class="signin-content">
						<div class="signin-image">
							
							<figure>
								
								<img src="images/registered.svg" alt="sign ip image">
							</figure>
							<a href="index.jsp" class="signup-image-link"></a>
						</div>
	
						<div>
							
							<h1 class="text-dark"> <i class = "zmdi zmdi-shield-check"></i>	Registration Successful!</h1>
    						<p>Welcome to our community! You can now log in and access all the features.</p>
    						
    						<div class="m-5">
								<a href="login.jsp"><button class="btn btn-dark w-25 m-auto">Login</button></a>
							</div>
							
						</div>
					</div>
				</div>
			</section>
	
		</div>
	
		
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="js/main.js"></script>
	</body>

</html>