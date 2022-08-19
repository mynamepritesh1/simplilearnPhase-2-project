<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.model.ClassObj"%>
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
<title>View Class Report</title>
<%@include file="allcss.jsp"%>


</head>
<body id="page-top">


	<div style="text-align: centre">
		<%
			HttpSession mySession = request.getSession(false);
			if (mySession == null) {
				out.print("<center><h3>Your session has expired.. Navigating you to home page.....</h3></center>");
				response.setHeader("refresh", "5;url='/dashboard.jsp'");
			} else {
				ClassObj cls = (ClassObj) mySession.getAttribute("class");
				@SuppressWarnings("unchecked")
				List<Object> reportList = (List<Object>) mySession.getAttribute("reportList");
				if (reportList != null) {
					Date createTime = new Date(mySession.getCreationTime());
		%>
		
		<!-- Navigation-->
		<%@include file="navbar.jsp"%>
		<header class="masthead bg-primary text-white ">
			<div class="container d-flex align-items-center flex-column">

				<h2 style="text-align: center; Color: black">Class Report
					Details</h2>

				<h3 style="text-align: center">
					Id:
					<%=cls.getClassID()%>
					Standard:
					<%=cls.getStandard()%>
					Division:
					<%=cls.getDivision()%></h3>

				<pt:printReport reportList="<%=reportList%>" />
				<br /> <br />

			</div>

		</header>
</div>

		<%@include file="footer.jsp"%>

		<%
			} else {
					response.sendRedirect("/SchoolManagmentSystem/Dashboard.jsp");
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
