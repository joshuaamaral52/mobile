<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="/resources/bootstrap-3.3.7-dist/Scripts/bootstrap.min.js"></script>
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-lg-12 bg-info">
			<div class="navbar-header">
				<a class="navbar-brand" href="index">The Electronic Store</a>
			</div>
			<ul class="nav nav-pills nav-justified">
				<li><a href="index">Home</a></li>
				<c:if test="${empty loggedIn}">
					<li><a href="Register">Register</a></li>
				</c:if>
				<c:choose>
					<c:when test="${role=='ROLE_ADMIN'}">
						<li><a href="Category">Category</a></li>
						<li><a href="Supplier">Supplier</a></li>
						<li><a href="Product">Product</a></li>
						<li><a href="ConsumerCart">Consumer Cart</a></li>
						<li><a href="DeliveredItems">Delivered Items</a>
					</c:when>
					<c:when test="${role=='ROLE_USER'}">
						<li><a href="ProductDisplay">Product View</a></li>
						<li><a href="Cart">Cart</a></li>
						<li><a href="MyPurchases">My Purchases</a>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${loggedIn==true}">
						<li><a href="logout">Logout</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="login007">Login</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<%
			String username = (String) session.getAttribute("username");
			if (username != null) {
				out.print("<div class='col-lg-12 bg-warning'>");
				out.print("Welcome: " + username);
				out.print("</div>");
			}
		%>
	</div>
	<br />