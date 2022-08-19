<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.model.ClassObj"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="pt" uri="WEB-INF/Tags.tld"%>
<%@page session="false"%><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>View Class</title>
<%@include file="allcss.jsp"%>
</head>
<body id="page-top">
	<%
		HttpSession mySession = request.getSession(false);
		if (mySession == null) {
			out.print("<center><h3>Your session has expired.. Navigating you to home page.....</h3></center>");
			response.setHeader("refresh", "5;url='/Dashboard.jsp'");
		} else {
			@SuppressWarnings("unchecked")
			List<ClassObj> classList = (List<ClassObj>) mySession.getAttribute("classList");
			if (classList != null) {
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

			<h2 style="text-align: center; Color: black">Class Details</h2>
			<br />
			<pt:printClass classList="<%=classList%>" />
			<br/>
			
			<!-- Sing in  Form -->
			<section class="sign-in">
				<div class="container">
					<div class="signin-content">


						<div class="signin-form">

							<form action="UpdateClass" method="post">
								<div class="mb-3">
									<label>Standard</label> <input type="number"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="standard"
										placeholder="Enter Standard">
								</div>
								<div class="mb-3">
									<label>Division</label> <input type="text" class="form-control"
										id="exampleInputPassword1" name="division"
										placeholder="Enter Division">
								</div>
								<button type="submit" class="btn btn-secondary col-12 mx-auto">ADD
									CLASS</button>
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
				response.sendRedirect("Dashboard.jsp");
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



