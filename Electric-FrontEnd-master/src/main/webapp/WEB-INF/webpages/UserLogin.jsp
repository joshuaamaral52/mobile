<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="/resources/bootstrap-3.3.7-dist/Scripts/bootstrap.min.js"></script>
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<div class="well well-sm">
					<h3 class="text-center">Login Page</h3>
				</div>
				<c:choose>
					<c:when test="${not empty msg}">
						<div class="alert alert-danger text-center"><strong>Login Error!</strong>&nbsp;${msg}</div>
					</c:when>
				</c:choose>
				<form class="form-horizontal" action="perform_login" method="post">
					<div class="form-group">
						<label class="control-label col-sm-2">Username</label>
						<div class="col-sm-8">
							<input type="text" name="username" placeholder="Enter Username"
								class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">Password</label>
						<div class="col-sm-8">
							<input type="password" name="password"
								placeholder="Enter Password" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<center>
							<input type="submit" class="btn btn-primary" />&nbsp;<input
								class="btn btn-warning" type="reset" />
						</center>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>