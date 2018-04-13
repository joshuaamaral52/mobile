<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<div class="well well-sm">
					<h3 class="text-center">Registration Page</h3>
				</div>
				<c:choose>
					<c:when test="${not empty msg}">
						<div class="alert alert-success text-center">${msg}</div>
					</c:when>
				</c:choose>
				<form:form method="post"
					action="${pageContext.request.contextPath}/SaveUser"
					modelAttribute="user" class="form-horizontal">
					<div class="form-group">
						<form:label path="username" class="control-label col-sm-2">Username</form:label>
						<div class="col-sm-8">
							<form:input path="username" class="form-control"
								placeholder="Enter Username" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="custName" class="control-label col-sm-2">Customer Name</form:label>
						<div class="col-sm-8">
							<form:input path="custName" class="form-control"
								placeholder="Enter Full Name" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="email" class="control-label col-sm-2">Email ID</form:label>
						<div class="col-sm-8">
							<form:input path="email" class="form-control"
								placeholder="Enter Email ID" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="mobile" class="control-label col-sm-2">Mobile No</form:label>
						<div class="col-sm-8">
							<form:input path="mobile" class="form-control"
								placeholder="Enter Mobile no." />
						</div>
					</div>
					<div class="form-group">
						<form:label path="password" class="control-label col-sm-2">Password</form:label>
						<div class="col-sm-8">
							<form:input path="password" type="password" class="form-control"
								placeholder="Enter Password" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="address" class="control-label col-sm-2">Address</form:label>
						<div class="col-sm-8">
							<form:input path="address" class="form-control"
								placeholder="Enter Address" />
						</div>
					</div>
					<div class="form-group">
						<center>
							<input type="submit" class="btn btn-primary" />&nbsp;<input
								class="btn btn-warning" type="reset" />
						</center>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>