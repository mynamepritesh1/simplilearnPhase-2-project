<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Learner's Academy</title>
<%@include file="allcss.jsp"%>
</head>
<body id="page-top">
	<%
HttpSession mySession=request.getSession(false);
if(mySession==null){
	out.print("<center><h3>Your session has expired.. Navigating you to home page.....</h3></center>");
	response.sendRedirect("Dashboard.jsp");
}
else{
	Date createTime = new Date(mySession.getCreationTime());
%>
	<h1 style="Color: blue">Learner's Academy</h1>
	<b style="Color: blue">You Logged in at <%=createTime %></b>


	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<%if(mySession.getAttribute("exception")!=null) {%>
			<%=mySession.getAttribute("exception") %>
			<%}if(mySession.getAttribute("exceptionSys")!=null) {%>
			System Error
			<%=mySession.getAttribute("exceptionSys") %>
			<%} %>
			<a class="navbar-brand" href="Dashboard.jsp">Learner's Academy</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="student">Students</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="teacher">Teachers</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="classes">CLasses</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="subject">Subject</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>


				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center ">

		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5" src="assets/img/avataaars.svg"
				alt="..." />
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Integrated
				Learning Experience</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">Building
				confidence through support</p>
		</div>
	</header>

	<!-- About Section-->
	<section class="page-section bg-secondary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h1
				class="page-section-heading text-center text-uppercase text-white">Welcome
				To Learner's Academy</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="row">
				<div class="col-lg-4 ms-auto">
					<p class="lead">Learner's Academy is a group of schools
						including a Primary, Junior and Senior Secondary Schools, located
						in Thane, bandra,kalyan Maharashtra. Primary School were founded
						in 2010 and barely five years afterward the Junior Secondary was
						established and upgraded to a Senior Secondary School after the
						first JSCE in June 2015.</p>
				</div>
				<div class="col-lg-4 me-auto">
					<p class="lead">Learner's Academy operates a school catering to
						the entirety of early childhood education. Set on thousands of
						square meters of lush green land in the Thane, it is a breath of
						fresh air. The school has all that parents need to ensure
						qualitative, affordable and morally sound education for their
						children..</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<footer class="footer text-center bg-light text-black">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						Main Road,MK Nagar Thane West <br /> 400605
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1 text-black"
						href="#!"><i class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1 text-black" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1 text-black" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1 text-black" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About Us</h4>
					<p class="lead mb-0">Developer Name:-Pritesh Ingale</p>
					<p class="lead mb-0">Developer Email:-pritesh1272@gmail.com</p>

					<p class="lead mb-0">Simplilearn Phase 2 Project</p>

				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2022</small>
		</div>
	</div>
<%} %>
<%mySession.removeAttribute("exception");
mySession.removeAttribute("exceptionSys");%>

</body>
</html>
