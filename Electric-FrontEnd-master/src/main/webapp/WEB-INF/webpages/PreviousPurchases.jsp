<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Previous Purchases</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<div class="well well-sm">
					<h3 class="text-center">Delivered Items</h3>
				</div>
				<c:choose>
					<c:when test="${not empty orderlist}">
						<div class="table-responsive">
							<table class="table table-hover table-condessed">
								<thead>
									<tr>
										<th>OrderID</th>
										<th>Order Date</th>
										<th>Shipping Address</th>
										<th>Total Amount</th>
										<th>Transaction Type</th>
										<th>Username</th>
									</tr>
								</thead>
								<c:forEach items="${orderlist}" var="order">
									<tr>
										<td><a href="ViewOrder${order.orderId}">${order.orderId}</a></td>
										<td>${order.orderDate}</td>
										<td>${order.shippingAddress}</td>
										<td>${order.totalAmount}</td>
										<td>${order.transactionType}</td>
										<td>${order.username}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</c:when>
					<c:when test="${empty orderlist}">
						<div class="alert alert-danger text-center">
							<strong>Failure!</strong>&nbsp;No Orders made yet.
						</div>
					</c:when>
				</c:choose>

			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>