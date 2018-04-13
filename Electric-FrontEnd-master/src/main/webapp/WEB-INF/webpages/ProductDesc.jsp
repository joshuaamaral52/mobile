<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Description</title>
<link href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="/resources/bootstrap-3.3.7-dist/Scripts/bootstrap.min.js"></script>
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container jumbotron">
		<div class="row">
			<div class="col-lg-12">
				<div class="well well-sm">
					<h3 class="text-center">Product Description</h3>
				</div>
				<c:choose>
					<c:when test="${not empty addcart}">
						<div class="alert alert-success text-center">
							<strong>Success!!</strong>&nbsp;${addcart}
						</div>
					</c:when>
				</c:choose>
				<div class="thumbnail">
					<form action="${pageContext.request.contextPath}/AddToCart"
						method="post" class="form-horizontal">
						<table>
							<tr>
								<td width="50%"><img src="resources/images/${product.productId}.jpg"
									class="img-responsive img-rounded img-thumbnail pull-left" height="50%" width="50%" /></td>
								<td width="50%">
									<div class="form-group hidden">
										<label class="control-label col-sm-4">ID:</label><input
											type="text" name="prodId" value="${product.productId}"
											readonly="readonly" /><br />
									</div>
									<div class="form-group">
										<label class="control-label col-sm-4">${product.prodName}</label>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-4">${product.productDesc}</label>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-4">${product.price}</label>
									</div>
									<div class="form-group">
										<select name="quantity" class="form-control">
											<c:forEach var="i" begin="1" end="${product.quantity}">
												<option value="<c:out value='${i}'/>"> ${i} </option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-primary"
											value="Add to Cart" />&nbsp;<input type="reset"
											class="btn btn-warning" />
									</div>
								</td>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>