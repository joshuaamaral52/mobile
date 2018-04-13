<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="resources/bootstrap-3.3.7-dist/Scripts/bootstrap.min.js"></script>
<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<div class="well well-sm">
					<h3  class="text-center">Product Edit Page</h3>
				</div>
				<br />
				<form:form method="post"
					action="${pageContext.request.contextPath}/SaveProduct"
					enctype="multipart/form-data" modelAttribute="product"
					class="form-horizontal">
					<div class="form-group hidden">
						<form:label path="productId" class="control-label col-lg-2">ID</form:label>
						<div class="col-lg-8">
							<form:input path="productId" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="prodName" class="control-label col-lg-2">Name</form:label>
						<div class="col-lg-8">
							<form:input path="prodName" class="form-control"
								placeholder="Product Name" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="productDesc" class="control-label col-lg-2">Description</form:label>
						<div class="col-lg-8">
							<form:input path="productDesc" class="form-control"
								placeholder="Product Description" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="price" class="control-label col-lg-2">Price</form:label>
						<div class="col-lg-8 input-group">
							<span class="input-group-addon">&#8377</span>
							<form:input path="price" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="catid" class="control-label col-lg-2">Category Name</form:label>
						<div class="col-lg-8">
							<form:select path="catid" class="form-control">
								<form:option value="0">--Select--</form:option>
								<c:forEach var="catitem" items="${catList}">
									<form:option value="${catitem.key}"
										label="${catitem.key}. ${catitem.value}" />
								</c:forEach>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<form:label path="supplierid" class="control-label col-lg-2">Supplier Name</form:label>
						<div class="col-lg-8">
							<form:select path="supplierid" class="form-control">
								<form:option value="0" label="--Select--" />
								<c:forEach var="supitem" items="${supList}">
									<form:option value="${supitem.key}"
										label="${supitem.key}. ${supitem.value}" />
								</c:forEach>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<form:label path="quantity" class="control-label col-lg-2">Quantity</form:label>
						<div class="col-lg-8">
							<form:input path="quantity" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="image" class="control-label col-lg-2">Image</form:label>
						<div class="col-lg-8">
							<form:input type="file" path="image" class="file" />
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
							<th>Product ID</th>
							<th>Product Name</th>
							<th>Product Image</th>
							<th>Product Description</th>
							<th>Price</th>
							<th>Category</th>
							<th>Supplier</th>
							<th>Quantity</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach items="${prodList}" var="proditem">
						<tr>
							<td>${proditem.productId}</td>
							<td>${proditem.prodName}</td>
							<td><img src="resources/images/${proditem.productId}.jpg"
								title="${proditem.prodName}"
								class=" img-thumbnail img-responsive img-rounded" width="150" height="300" /></td>
							<td>${proditem.productDesc}</td>
							<td>&#x20B9 ${proditem.price}</td>
							<td>${proditem.catid}</td>
							<td>${proditem.supplierid}</td>
							<td>${proditem.quantity}</td>
							<td><a href="UpdateProduct${proditem.productId}">Update</a></td>
							<td><a href="DeleteProduct${proditem.productId}">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp"%>
</body>
</html>