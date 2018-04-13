<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consumer Cart</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<div class="well well-sm">
					<h3 class="text-center">Pending Items</h3>
				</div>
				<div class="table-responsive">
					<table class="table table-hover table-condessed">
						<tr>
							<th>OrderID</th>
							<th>Username</th>
							<th>OrderDate</th>
							<th>Shipping Address</th>
							<th>Total Amount</th>
							<th>Transaction Type</th>
							<th></th>
						</tr>
						<c:forEach items="${pending}" var="order">
							<tr>
								<td><a href="ViewOrder${order.orderId}">${order.orderId}</a></td>
								<td>${order.username}</td>
								<td>${order.orderDate}</td>
								<td>${order.shippingAddress}</td>
								<td>${order.totalAmount}</td>
								<td>${order.transactionType}</td>
								<td><a href="dispatchOrder${order.orderId}">Dispatch</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="jumbotron">
				<div class="well well-sm">
					<h3 class="text-center">Dispatched Items</h3>
				</div>
				<div class="table-responsive">
					<table class="table table-hover table-condessed">
						<tr>
							<th>OrderID</th>
							<th>Username</th>
							<th>OrderDate</th>
							<th>Shipping Address</th>
							<th>Total Amount</th>
							<th>Transaction Type</th>
							<th></th>
						</tr>
						<c:forEach items="${dispatched}" var="order">
							<tr>
								<td><a href="ViewOrder${order.orderId}">${order.orderId}</a></td>
								<td>${order.username}</td>
								<td>${order.orderDate}</td>
								<td>${order.shippingAddress}</td>
								<td>${order.totalAmount}</td>
								<td>${order.transactionType}</td>
								<td><a href="orderComplete${order.orderId}">Delivery
										Complete</a></td>
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