<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.model.SubjectObj"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="pt" uri="WEB-INF/Tags.tld"%>
<%@page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>View Subject</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
<!-- Font Icon -->
<!-- Font Icon -->


</head>
<body id="page-top">
	<%
HttpSession mySession=request.getSession(false);
if(mySession==null){
	out.print("<center><h3>Your session has expired.. Navigating you to home page.....</h3></center>");
	response.setHeader("refresh", "5;url='/Dashboard.jsp'");
}
else{
@SuppressWarnings("unchecked")
List<SubjectObj> subList=(List<SubjectObj>)mySession.getAttribute("subList");
if(subList !=null){
Date createTime = new Date(mySession.getCreationTime());
%>
	<h1 style="Color: blue">Learner's Academy</h1>
	<b style="Color: blue">You Logged in at <%=createTime %></b>

	<!-- Navigation-->
	<%@include file="navbar.jsp"%>
	<header class="masthead bg-primary text-white ">
		<div class="container d-flex align-items-center flex-column">
			<%if(mySession.getAttribute("exception")!=null) {%>
			<%=mySession.getAttribute("exception") %>
			<%}if(mySession.getAttribute("exceptionSys")!=null) {%>
			System Error
			<%=mySession.getAttribute("exceptionSys") %>
			<%} %>
			<h2 style="text-align: center; Color: black">Subject Details</h2>
			<br />
			<pt:printSubject sublist="<%=subList %>" />
			<br />
			<!-- Sing in  Form -->
			<section class="sign-in">
				<div class="container">
					<div class="signin-content">


						<div class="signin-form">

							<form action="UpdateSubject" method="post">
								<div class="mb-3">
									<label>Subject Name</label> <input type="text"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="subName"
										placeholder="Enter Subject Name">
								</div>
								<div class="mb-3">
									<label>Subject Language</label> <input type="text"
										class="form-control" id="exampleInputPassword1" name="sublang"
										placeholder="Enter Subject Language">
								</div>
								<button type="submit" class="btn btn-secondary col-12 mx-auto">ADD
									SUBJECT</button>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>

	</header>


	<%@include file="footer.jsp"%>
		<%
		} else {
				response.sendRedirect("/Dashboard.jsp");
	%>

	<%
		}
		}
	%>

	<%
		mySession.removeAttribute("exception");
		mySession.removeAttribute("exceptionSys");
	%>
	
</body>
</html>



