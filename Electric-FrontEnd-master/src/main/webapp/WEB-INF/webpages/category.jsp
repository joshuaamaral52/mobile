<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
<link href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="/resources/bootstrap-3.3.7-dist/Scripts/bootstrap.min.js"></script>
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<div class="well well-sm">
					<h3 class="text-center">Category Edit Page</h3>
				</div>
				<br />
				<form:form method="post"
					action="${pageContext.request.contextPath}/SaveCategory"
					modelAttribute="category" class="form-horizontal">
					<div class="form-group hidden">
						<form:label path="catid" class="control-label col-sm-2">ID</form:label>
						<div class="col-sm-8">
							<form:input path="catid" readonly="true" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="catName" class="control-label col-sm-2">Name</form:label>
						<div class="col-sm-8">
							<form:input path="catName" placeholder="Category Name"
								class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="catDesc" class="control-label col-sm-2">Description</form:label>
						<div class="col-sm-8">
							<form:input path="catDesc" placeholder="Description"
								class="form-control" />
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
			<div class="table-responsive">
				<table class="table table-hover table-condessed">
					<thead>
						<tr>
							<th>Category ID</th>
							<th>Category Name</th>
							<th>Category Description</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach items="${catList}" var="catitem">
						<tr>
							<td>${catitem.catid}</td>
							<td>${catitem.catName}</td>
							<td>${catitem.catDesc}</td>
							<td><a href="UpdateCategory${catitem.catid}">Update</a></td>
							<td><a href="DeleteCategory${catitem.catid}">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>