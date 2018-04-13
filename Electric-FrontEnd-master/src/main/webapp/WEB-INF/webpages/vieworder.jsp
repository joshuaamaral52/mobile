<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Order</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<div class="well well-sm">
					<h3 class="text-center">View Order Page</h3>
				</div>
				<div class="table-responsive">
					<table class="table table-hover table-condessed">
						<thead>
							<tr>
								<th>OrderID</th>
								<th>ProductID</th>
								<th>Product Name</th>
								<th>Quantity</th>
								<th>Username</th>
							</tr>
						</thead>
						<c:forEach items="${cartList}" var="cartItem">
							<tr>
								<td>${cartItem.orderId}</td>
								<td>${cartItem.productId}</td>
								<td><c:forEach items="${prodList}" var="prodItem">
										<c:if test="${prodItem.key==cartItem.productId}">
									${prodItem.value}
								</c:if>
									</c:forEach></td>
								<td>${cartItem.quantity}</td>
								<td>${cartItem.username}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>