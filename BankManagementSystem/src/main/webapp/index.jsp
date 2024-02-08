<!DOCTYPE html>
<html lang="en">
  <head>
  
  	<%
	  	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		
		boolean open;
		if(session.getAttribute("userId") == null){
			open = false;
		}else{
			open = true;
		}
  	%>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>ANID Bank Management</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="image/logo.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Source+Sans+Pro:ital,wght@0,300;0,400;0,600;0,700;1,300;1,400;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link
      href="assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link
      href="assets/vendor/glightbox/css/glightbox.min.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Variables CSS Files. Uncomment your preferred color scheme -->
    <link href="assets/css/variables.css" rel="stylesheet" />
    <!-- <link href="assets/css/variables-blue.css" rel="stylesheet"> --><!-- <link href="assets/css/variables-pink.css" rel="stylesheet"> -->
    <!-- <link href="assets/css/variables-green.css" rel="stylesheet"> -->
    <!-- <link href="assets/css/variables-orange.css" rel="stylesheet"> -->
    <!-- <link href="assets/css/variables-purple.css" rel="stylesheet"> -->
    <!-- <link href="assets/css/variables-red.css" rel="stylesheet"> -->
    

    <!-- Template Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<style>
		.ls{
			list-style-type: none;
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
  	
    <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top" data-scrollto-offset="0">
      <div
        class="container-fluid d-flex align-items-center justify-content-between"
      >
        <a
          href="index.jsp"
          class="logo d-flex align-items-center scrollto me-auto me-lg-0"
        >
          
        
			  <figure class="m-1">
				<img class="logo" src="images/logo.png" width="90rem" height="50rem" alt="sign ip image">
			</figure>
			 
        </a>
        
        
        <nav id="navbar" class="navbar">
          <ul>
            <li>
              <a class="nav-link scrollto" href="#"
                >Home
                </a>
              
            </li>

            <li>
              <a class="nav-link scrollto" href="index.jsp#about">About</a>
            </li>
            <li>
              <a class="nav-link scrollto" href="index.jsp#services"
                >Features</a>
            </li>
            
            </li>
            <li>
              <a class="nav-link scrollto" href="index.jsp#contact">Contact</a>
            </li>
            
            <%if(session.getAttribute("userId") != null && open) {%>
       	
	       		<%if("admin".equals(session.getAttribute("role").toString())) { %>
	       			<li>
		              <a class="nav-link scrollto" href="adminDashboard.jsp"
		                >Service</a>
	            	</li>
	            	
	       		<%}else{ %>
	       			<li>
		              <a class="nav-link scrollto" href="clientDashboard.jsp"
		                >Service</a>
	            	</li>
	       		<% }%>
       			<li>
	              <a class="nav-link scrollto" data-toggle="modal" data-target="#confirmationModal"
	                >Log Out</a>
            	</li>
          </ul>
          <i class="bi bi-list mobile-nav-toggle d-none"></i>
        </nav>
       
       	
       	<%}else{ %>
       		</ul>
	          <i class="bi bi-list mobile-nav-toggle d-none"></i>
	        </nav>
       	
       		<a class="btn-getstarted scrollto" href="register.jsp"
	          >Get Started</a>
       	
       	<%} %>

        
      </div>
    </header>
    <!-- End Header -->

    <section id="hero-animated" class="hero-animated d-flex align-items-center">
      <div
        class="container d-flex flex-column justify-content-center align-items-center text-center position-relative"
        data-aos="zoom-out"
      >
        <img
          src="assets/img/hero-carousel/hero-carousel-3.svg"
          class="img-fluid animated"
        />
        <h2>Welcome to <span>ANID</span></h2>
        <p>
          A New Digital banking Management System for your business, providing a
          complete solution for your business needs.
        </p>
        <div class="d-flex">
          <a href="register.jsp" class="btn-get-started scrollto">Get Started</a>
        </div>
      </div>
    </section>

    <main id="main">
      <!-- ======= Featured Services Section ======= -->
      <section id="featured-services" class="featured-services">
        <div class="container">
          <div class="row gy-4">
            <div class="col-xl-3 col-md-6 d-flex" data-aos="zoom-out">
              <div class="service-item position-relative">
                <div class="icon"><i class="bi bi-activity icon"></i></div>
                <h4><a href="" class="stretched-link">Users Management</a></h4>
                <p>
                  Effortlessly create, modify, and manage user accounts. 
                </p>
              </div>
            </div>
            <!-- End Service Item -->

            <div
              class="col-xl-3 col-md-6 d-flex"
              data-aos="zoom-out"
              data-aos-delay="200"
            >
              <div class="service-item position-relative">
                <div class="icon">
                  <i class="bi bi-bounding-box-circles icon"></i>
                </div>
                <h4>
                  <a href="" class="stretched-link">Transaction Handling</a>
                </h4>
                <p>
                  Seamlessly record, view, and manage transaction history.
                  Support various types of transactions, including transfers and
                  balance inquiries.
                </p>
              </div>
            </div>
            <!-- End Service Item -->

            <div
              class="col-xl-3 col-md-6 d-flex"
              data-aos="zoom-out"
              data-aos-delay="400"
            >
              <div class="service-item position-relative">
                <div class="icon">
                  <i class="bi bi-calendar4-week icon"></i>
                </div>
                <h4><a href="" class="stretched-link">Card Management</a></h4>
                <p>
                  Efficiently issue, activate, and manage credit/debit cards.
                  Enable users to set spending limits and provide detailed
                  transaction history.
                </p>
              </div>
            </div>
            <!-- End Service Item -->

            <div
              class="col-xl-3 col-md-6 d-flex"
              data-aos="zoom-out"
              data-aos-delay="600"
            >
              <div class="service-item position-relative">
                <div class="icon"><i class="bi bi-broadcast icon"></i></div>
                <h4><a href="" class="stretched-link">Loan Management</a></h4>
                <p>
                  Offer various loan products with flexible terms. Allow users
                  to apply for loans, track loan status, and manage
                  repayments.
                </p>
              </div>
            </div>
            <!-- End Service Item -->
          </div>
        </div>
      </section>
      <!-- End Featured Services Section -->

      <!-- ======= About Section ======= -->
      <section id="about" class="about">
        <div class="container" data-aos="fade-up">
          <div class="section-header">
            <h2>About Our Bank</h2>
            <p>
              Discover more about our bank and our commitment to providing
              reliable financial services.
            </p>
          </div>

          <div class="row g-4 g-lg-5" data-aos="fade-up" data-aos-delay="200">
            <div class="col-lg-5">
              <div class="about-img">
                <img
                  src="assets/img/about.jpg"
                  class="img-fluid"
                  alt="About Us Image"
                />
              </div>
            </div>

            <div class="col-lg-7">
              <h3 class="pt-0 pt-lg-5">Empowering Your Financial Journey</h3>

              <!-- Tabs -->
              <ul class="nav nav-pills mb-3">
                <li>
                  <a class="nav-link active" data-bs-toggle="pill" href="#tab1"
                    >Our Mission</a
                  >
                </li>
                <li>
                  <a class="nav-link" data-bs-toggle="pill" href="#tab2"
                    >Core Values</a
                  >
                </li>
                <li>
                  <a class="nav-link" data-bs-toggle="pill" href="#tab3"
                    >Commitment</a
                  >
                </li>
              </ul>
              <!-- End Tabs -->

              <!-- Tab Content -->
              <div class="tab-content">
                <div class="tab-pane fade show active" id="tab1">
                  <p class="fst-italic">
                    At our bank, our mission is to empower individuals and
                    businesses on their financial journey by providing reliable
                    and innovative banking solutions.
                  </p>

                  <div class="d-flex align-items-center mt-4">
                    <i class="bi bi-check2"></i>
                    <h4>Customer-Centric Approach</h4>
                  </div>
                  <p>
                    We are committed to putting our customers first, ensuring
                    their financial well-being, and providing exceptional
                    customer service.
                  </p>

                  <div class="d-flex align-items-center mt-4">
                    <i class="bi bi-check2"></i>
                    <h4>Financial Inclusion</h4>
                  </div>
                  <p>
                    We strive for financial inclusion, making banking accessible
                    to all, and fostering economic growth in the communities we
                    serve.
                  </p>
                </div>
                <!-- End Tab 1 Content -->

                <div class="tab-pane fade show" id="tab2">
                  <p class="fst-italic">
                    Our core values define who we are and guide our actions in
                    serving our customers and communities.
                  </p>

                  <div class="d-flex align-items-center mt-4">
                    <i class="bi bi-check2"></i>
                    <h4>Integrity</h4>
                  </div>
                  <p>
                    We uphold the highest standards of integrity, transparency,
                    and ethical conduct in all our interactions.
                  </p>

                  <div class="d-flex align-items-center mt-4">
                    <i class="bi bi-check2"></i>
                    <h4>Innovation</h4>
                  </div>
                  <p>
                    We embrace innovation to provide cutting-edge banking
                    solutions that meet the evolving needs of our customers.
                  </p>
                </div>
                <!-- End Tab 2 Content -->

                <div class="tab-pane fade show" id="tab3">
                  <p class="fst-italic">
                    Our commitment is to deliver exceptional banking services
                    with a focus on customer satisfaction and community impact.
                  </p>

                  <div class="d-flex align-items-center mt-4">
                    <i class="bi bi-check2"></i>
                    <h4>Community Engagement</h4>
                  </div>
                  <p>
                    We actively engage with and support the communities we serve
                    through various initiatives and partnerships.
                  </p>

                  <div class="d-flex align-items-center mt-4">
                    <i class="bi bi-check2"></i>
                    <h4>Continuous Improvement</h4>
                  </div>
                  <p>
                    We are committed to continuous improvement, adapting to
                    changes, and enhancing our services to better serve our
                    customers.
                  </p>
                </div>
                <!-- End Tab 3 Content -->
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End About Section -->

      <!-- ======= Call To Action Section ======= -->
      <section id="cta" class="cta">
        <div class="container" data-aos="zoom-out">
          <div class="row g-5">
            <div
              class="col-lg-8 col-md-6 content d-flex flex-column justify-content-center order-last order-md-first"
            >
              <h3>Experience Seamless <em>Online Banking</em></h3>
              <p>
                Access your accounts, manage transactions, and enjoy secure
                online banking services.  
              </p>
              <a class="cta-btn align-self-start" href="register.jsp">Get Started</a>
            </div>

            <div
              class="col-lg-4 col-md-6 order-first order-md-last d-flex align-items-center"
            >
              <div class="img">
                <img
                  src="assets/img/cta.jpg"
                  alt="Call To Action Image"
                  class="img-fluid"
                />
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Call To Action Section -->

      <!-- ======= Services Section ======= -->
      <section id="services" class="services">
        <div class="container" data-aos="fade-up">
          <div class="section-header">
            <h2>Our Banking Features</h2>
            <p>
              Explore the range of online banking services we offer to make your
              financial management convenient and secure.
            </p>
          </div>

          <div class="row gy-5">
            <div
              class="col-xl-4 col-md-6"
              data-aos="zoom-in"
              data-aos-delay="200"
            >
              <div class="service-item">
                <div class="img">
                  <img
                    src="assets/img/services-1.jpg"
                    class="img-fluid"
                    alt="Service 1 Image"
                  />
                </div>
                <div class="details position-relative">
                  <div class="icon">
                    <i class="bi bi-credit-card"></i>
                  </div>
                  <a href="#" class="stretched-link">
                    <h3>Online Banking</h3>
                  </a>
                  <p>
                    Manage your accounts, transfer funds, and pay bills online
                    securely from the comfort of your home.
                  </p>
                </div>
              </div>
            </div>
            <!-- End Service Item -->

            <div
              class="col-xl-4 col-md-6"
              data-aos="zoom-in"
              data-aos-delay="300"
            >
              <div class="service-item">
                <div class="img">
                  <img
                    src="assets/img/services-2.jpg"
                    class="img-fluid"
                    alt="Service 2 Image"
                  />
                </div>
                <div class="details position-relative">
                  <div class="icon">
                    <i class="bi bi-shield-lock"></i>
                  </div>
                  <a href="#" class="stretched-link">
                    <h3>Security Features</h3>
                  </a>
                  <p>
                    Experience top-notch security measures to protect your
                    financial information and transactions.
                  </p>
                </div>
              </div>
            </div>
            <!-- End Service Item -->

            <div
              class="col-xl-4 col-md-6"
              data-aos="zoom-in"
              data-aos-delay="400"
            >
              <div class="service-item">
                <div class="img">
                  <img
                    src="assets/img/services-3.jpg"
                    class="img-fluid"
                    alt="Service 3 Image"
                  />
                </div>
                <div class="details position-relative">
                  <div class="icon">
                    <i class="bi bi-wallet2"></i>
                  </div>
                  <a href="#" class="stretched-link">
                    <h3>Mobile Banking</h3>
                  </a>
                  <p>
                    Access your accounts on the go with our user-friendly mobile
                    banking app.
                  </p>
                </div>
              </div>
            </div>
            <!-- End Service Item -->

            <!-- Add more services as needed -->
          </div>
        </div>
      </section>
      <!-- End Services Section -->

      <!-- ======= Testimonials Section ======= -->
      <section id="testimonials" class="testimonials">
        <div class="container" data-aos="fade-up">
          <div class="testimonials-slider swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <div class="testimonial-item">
                  <img
                    src="assets/img/testimonials/testimonials-1.jpg"
                    class="testimonial-img"
                    alt=""
                  />
                  <h3>Saul Goodman</h3>
                  <h4>Ceo &amp; Founder</h4>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i>
                  </div>
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
						The design is clean and modern. Makes managing finances a pleasant experience.         
					<i class="bi bi-quote quote-icon-right"></i>
                  </p>
                </div>
              </div>
              <!-- End testimonial item -->

              <div class="swiper-slide">
                <div class="testimonial-item">
                  <img
                    src="assets/img/testimonials/testimonials-2.jpg"
                    class="testimonial-img"
                    alt=""
                  />
                  <h3>Sara Wilsson</h3>
                  <h4>Designer</h4>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i>
                  </div>
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
	                    The transaction history feature is a game-changer!
	                     Helps me keep track of every penny. Great job, ANID Bank team!
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                </div>
              </div>
              <!-- End testimonial item -->

              <div class="swiper-slide">
                <div class="testimonial-item">
                  <img
                    src="assets/img/testimonials/testimonials-3.jpg"
                    class="testimonial-img"
                    alt=""
                  />
                  <h3>Jena Karlis</h3>
                  <h4>Store Owner</h4>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i>
                  </div>
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    Love the simplicity of the ANID Bank app! Managing my accounts has never been this easy. 
						Kudos to the developers!  
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                </div>
              </div>
              <!-- End testimonial item -->

              <div class="swiper-slide">
                <div class="testimonial-item">
                  <img
                    src="assets/img/testimonials/testimonials-4.jpg"
                    class="testimonial-img"
                    alt=""
                  />
                  <h3>Matt Brandon</h3>
                  <h4>Freelancer</h4>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i>
                  </div>
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    	Smooth and intuitive interface.
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                </div>
              </div>
              <!-- End testimonial item -->

              <div class="swiper-slide">
                <div class="testimonial-item">
                  <img
                    src="assets/img/testimonials/testimonials-5.jpg"
                    class="testimonial-img"
                    alt=""
                  />
                  <h3>John Larson</h3>
                  <h4>Entrepreneur</h4>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i>
                  </div>
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    	The transaction history feature is a game-changer!
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                </div>
              </div>
              <!-- End testimonial item -->
            </div>
            <div class="swiper-pagination"></div>
          </div>
        </div>
      </section>
      <!-- End Testimonials Section -->

      <!-- ======= F.A.Q Section ======= -->
      <section id="faq" class="faq">
        <div class="container-fluid" data-aos="fade-up">
          <div class="row gy-4">
            <div
              class="col-lg-7 d-flex flex-column justify-content-center align-items-stretch order-2 order-lg-1"
            >
              <div class="content px-xl-5">
                <h3>Frequently Asked <strong>Questions</strong></h3>
                <p>
                  Here are some common questions about our banking services. If
                  you have additional inquiries, feel free to contact our
                  support team.
                </p>
              </div>

              <div class="accordion accordion-flush px-xl-5" id="faqlist">
                <div
                  class="accordion-item"
                  data-aos="fade-up"
                  data-aos-delay="200"
                >
                  <h3 class="accordion-header">
                    <button
                      class="accordion-button collapsed"
                      type="button"
                      data-bs-toggle="collapse"
                      data-bs-target="#faq-content-1"
                    >
                      <i class="bi bi-question-circle question-icon"></i>
                      How do I open a new account with your bank?
                    </button>
                  </h3>
                  <div
                    id="faq-content-1"
                    class="accordion-collapse collapse"
                    data-bs-parent="#faqlist"
                  >
                    <div class="accordion-body">
                      To open a new account, you can visit our nearest branch or
                      apply online through our website. Make sure to have valid
                      identification and proof of address.
                    </div>
                  </div>
                </div>

                <div
                  class="accordion-item"
                  data-aos="fade-up"
                  data-aos-delay="300"
                >
                  <h3 class="accordion-header">
                    <button
                      class="accordion-button collapsed"
                      type="button"
                      data-bs-toggle="collapse"
                      data-bs-target="#faq-content-2"
                    >
                      <i class="bi bi-question-circle question-icon"></i>
                      How can I reset my online banking password?
                    </button>
                  </h3>
                  <div
                    id="faq-content-2"
                    class="accordion-collapse collapse"
                    data-bs-parent="#faqlist"
                  >
                    <div class="accordion-body">
                      If you forget your password, you can visit our near by branch. Follow the instructions you are told
                      inorder to reset your password securely.
                    </div>
                  </div>
                </div>

                <div
                  class="accordion-item"
                  data-aos="fade-up"
                  data-aos-delay="400"
                >
                  <h3 class="accordion-header">
                    <button
                      class="accordion-button collapsed"
                      type="button"
                      data-bs-toggle="collapse"
                      data-bs-target="#faq-content-3"
                    >
                      <i class="bi bi-question-circle question-icon"></i>
                      Are there any fees for using your online banking services?
                    </button>
                  </h3>
                  <div
                    id="faq-content-3"
                    class="accordion-collapse collapse"
                    data-bs-parent="#faqlist"
                  >
                    <div class="accordion-body">
                      Most of our online banking services are free, but certain
                      transactions may have associated fees.
            
                    </div>
                  </div>
                </div>

                <!-- Add more FAQs as needed -->
              </div>
            </div>

            <div
              class="col-lg-5 align-items-stretch order-1 order-lg-2 img"
              style="background-image: url('assets/img/faq.jpg')"
            >
              &nbsp;
            </div>
          </div>
        </div>
      </section>
      <!-- End F.A.Q Section -->

      <!-- ======= Contact Section ======= -->
      <section id="contact" class="contact">
        <div class="container">
          <div class="section-header">
            <h2>Contact Us</h2>
            <p>
              
              
              
              
             Phone Numbers:
              <ul class="ls"
              
              >
	              <li class="ls">(+1-646) 768964749</li>
	              <li class="ls">(+251) 965786432</li>
              </ul>
              <br><br>
              
              Ethiopia, Addis Ababa 6Kilo 
              
              
            </p>
          </div>
        </div>

        <div class="map">
          <iframe
			  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11662.074848084!2d38.72290826732464!3d9.05892405010792!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zOeWdmSBCYWiBhYmFiYQ!5e0!3m2!1sen!2set!4v1643796822648!5m2!1sen!2set"
			  frameborder="0"
			  allowfullscreen
			></iframe>

        </div>
        <!-- End Google Maps -->

        <!-- <div class="container">
          <div class="row gy-5 gx-lg-5">
            <div class="col-lg-4">
              <div class="info">
                <h3>Get in touch</h3>
                <p>
                  Et id eius voluptates atque nihil voluptatem enim in tempore
                  minima sit ad mollitia commodi minus.
                </p>

                <div class="info-item d-flex">
                  <i class="bi bi-geo-alt flex-shrink-0"></i>
                  <div>
                    <h4>Location:</h4>
                    <p>A108 Adam Street, New York, NY 535022</p>
                  </div>
                </div>
                

                <div class="info-item d-flex">
                  <i class="bi bi-envelope flex-shrink-0"></i>
                  <div>
                    <h4>Email:</h4>
                    <p>info@example.com</p>
                  </div>
                </div>
               

                <div class="info-item d-flex">
                  <i class="bi bi-phone flex-shrink-0"></i>
                  <div>
                    <h4>Call:</h4>
                    <p>+1 5589 55488 55</p>
                  </div>
                </div>
               
              </div>
            </div>

            <div class="col-lg-8">
              <form
                action="forms/contact.php"
                method="post"
                role="form"
                class="php-email-form"
              >
                <div class="row">
                  <div class="col-md-6 form-group">
                    <input
                      type="text"
                      name="name"
                      class="form-control"
                      id="name"
                      placeholder="Your Name"
                      required
                    />
                  </div>
                  <div class="col-md-6 form-group mt-3 mt-md-0">
                    <input
                      type="email"
                      class="form-control"
                      name="email"
                      id="email"
                      placeholder="Your Email"
                      required
                    />
                  </div>
                </div>
                <div class="form-group mt-3">
                  <input
                    type="text"
                    class="form-control"
                    name="subject"
                    id="subject"
                    placeholder="Subject"
                    required
                  />
                </div>
                <div class="form-group mt-3">
                  <textarea
                    class="form-control"
                    name="message"
                    placeholder="Message"
                    required
                  ></textarea>
                </div>
                <div class="my-3">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">
                    Your message has been sent. Thank you!
                  </div>
                </div>
                <div class="text-center">
                  <button type="submit">Send Message</button>
                </div>
              </form>
            </div>
         
          </div>
        </div>
        -->
      </section>
      <!-- End Contact Section -->
    </main>
    <!-- End #main -->

    <a
      href="#"
      class="scroll-top d-flex align-items-center justify-content-center"
      ><i class="bi bi-arrow-up-short"></i
    ></a>

    <div id="preloader"></div>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
  </body>
</html>
