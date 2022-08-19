<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.model.StudentObj"%>
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
<title>View Student</title>
<%@include file="allcss.jsp"%>
</head>
<body id="page-top">
	<%
		HttpSession mySession = request.getSession(false);
		if (mySession == null) {
			out.print("<center><h3>Your session has expired.. Navigating you to home page.....</h3></center>");
			response.setHeader("refresh", "5;url='/dashboard.jsp'");
		} else {
			@SuppressWarnings("unchecked")
			List<StudentObj> studentList = (List<StudentObj>) mySession.getAttribute("studentList");
			if (studentList != null) {
				Date createTime = new Date(mySession.getCreationTime());
	%>
	<h1 style="Color: blue">Learner's Academy</h1>
	<b style="Color: blue">You Logged in at <%=createTime%></b>
	<!-- Navigation-->
	<%@include file="navbar.jsp"%>
	<header class="masthead bg-primary text-white ">
		<div class="container d-flex align-items-center flex-column">
			<%
				if (mySession.getAttribute("exception") != null) {
			%>
			<%=mySession.getAttribute("exception")%>
			<%
				}
						if (mySession.getAttribute("exceptionSys") != null) {
			%>
			System Error
			<%=mySession.getAttribute("exceptionSys")%>
			<%
				}
			%>


			<h2 style="text-align: center; Color: black">Student Details</h2><br/>
			<pt:printStudent studentList="<%=studentList %>"/>


			<!-- Sing in  Form -->
			<section class="sign-in">
				<div class="container">
					<div class="signin-content">


						<div class="signin-form">

							<form action="UpdateStudent" method="post">
								<div class="mb-3">
									<label>Student Name</label> <input type="text"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="studentName"
										placeholder="Enter your Name">
								</div>
								<div class="mb-3">
									<label>Date Of Birth</label> <input type="Date"
										class="form-control" id="exampleInputPassword1"
										name="StudentDoB" placeholder="Enter Your DOB">
								</div>
								<button type="submit" class="btn btn-secondary col-12 mx-auto">ADD
									STUDENT</button>
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


