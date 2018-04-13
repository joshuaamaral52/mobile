<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplier</title>
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
				<h3 class="text-center">Supplier Edit Page</h3>
				</div>
				<br />
				<form:form method="post"
					action="${pageContext.request.contextPath}/SaveSupplier"
					modelAttribute="supplier" class="form-horizontal">
					<div class="form-group hidden">
						<form:label path="supplierId" class="control-label col-sm-2">ID</form:label>
						<div class="col-sm-8">
							<form:input path="supplierId" readonly="true"
								class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="supplierName" class="control-label col-sm-2">NAME</form:label>
						<div class="col-sm-8">
							<form:input path="supplierName" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="supplierDesc" class="control-label col-sm-2">DESCRIPTION</form:label>
						<div class="col-sm-8">
							<form:textarea path="supplierDesc" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<center>
							<input type="submit" class="btn btn-primary" />&nbsp;<input
								type="reset" class="btn btn-warning" />
						</center>
					</div>
				</form:form>
			</div>
			<div class="table-responsive">
				<table class="table table-hover table-condessed">
					<thead>
						<tr>
							<th>Supplier ID</th>
							<th>Supplier Name</th>
							<th>Supplier Description</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach items="${suplist}" var="supitem">
						<tr>
							<td>${supitem.supplierId}</td>
							<td>${supitem.supplierName}</td>
							<td>${supitem.supplierDesc}</td>
							<td><a href="UpdateSupplier${supitem.supplierId}">Update</a></td>
							<td><a href="DeleteSupplier${supitem.supplierId}">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>