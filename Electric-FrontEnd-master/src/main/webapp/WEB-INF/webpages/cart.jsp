<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Page</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<div class="well well-sm">
					<h3 class="text-center">Cart Page</h3>
				</div>
				<c:choose>
					<c:when test="${not empty delci}">
						<div class="alert alert-success text-center">
							<strong>Success!</strong>&nbsp;${delci}
						</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${not empty cartItems}">
				<div class="table-responsive">
					<table class="table table-hover table-condessed">
						<thead>
							<tr>
								<th>Product Name</th>
								<th>Quantity</th>
								<th>Total</th>
								<th>Delete</th>
							</tr>
						</thead>
						<c:forEach items="${cartItems}" var="cartItem">
							<tr>
								<td><c:forEach items="${prodItems}" var="prodItem">
										<c:if test="${prodItem.key==cartItem.productId}">
										${prodItem.value}
									</c:if>
									</c:forEach></td>
								<td>${cartItem.quantity}</td>
								<td>${cartItem.subtotal}</td>
								<td><a href="DeleteCartItem${cartItem.cartItemId}">Delete</a></td>
							</tr>
						</c:forEach>
						<tr>
							<td>Total</td>
							<td>${quantity}</td>
							<td>${price}</td>
							<td><a href="Pay" class="btn btn-info">Buy Now!</a></td>
						</tr>
					</table>
				</div>
				</c:when>
					<c:when test="${empty orderlist}">
						<div class="alert alert-danger text-center">
							<strong>Failure!</strong>&nbsp;No Items in Cart.
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
