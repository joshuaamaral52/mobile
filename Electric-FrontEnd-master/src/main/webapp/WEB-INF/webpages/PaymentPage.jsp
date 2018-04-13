<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
				<div class="well well-sm">
					<h3 class="text-center">Payment Page</h3>
				</div>
				<c:choose>
					<c:when test="${not empty oid}">
						<div class="alert alert-success text-center">
							<strong>Success!</strong>&nbsp;Payment Confirmed. Your Order ID
							is ${oid}.<br /> Thank You for shopping with us!!
						</div>
					</c:when>
				</c:choose>
				<br />
				<c:if test="${empty oid}">
					<div class="table-responsive">
						<table class="table table-hover table-condessed">
							<thead>
								<tr>
									<th>Cart Item ID</th>
									<th>Product Name</th>
									<th>Quantity</th>
									<th>Total</th>
								</tr>
							</thead>
							<c:forEach items="${cartItems}" var="cartItem">
								<tr>
									<td>${cartItem.cartItemId}</td>
									<td><c:forEach items="${prodItems}" var="prodItem">
											<c:if test="${prodItem.key==cartItem.productId}">
										${prodItem.value}
									</c:if>
										</c:forEach></td>
									<td>${cartItem.quantity}</td>
									<td>${cartItem.subtotal}</td>
								</tr>
							</c:forEach>
							<tr>
								<td>Total</td>
								<td></td>
								<td>${quantity}</td>
								<td>${price}</td>
							</tr>
						</table>
					</div>
					<div>
						<form action="ConfirmPayment" method="post"
							class="form-horizontal">
							<div class="form-group">
								<label class="radio-inline"><input type="radio"
									name="paymode" value="cod" required>Cash on Delivery</label> <label
									class="radio-inline"><input type="radio" name="paymode"
									value="cc" required>Credit Card</label> <label
									class="radio-inline"><input type="radio" name="paymode"
									value="nb" required>Net Banking</label>
							</div>
							<div class="form-group">
								<div class="col-sm-8">
									<input type="text" name="bname"
										placeholder="Company Name/Building Name" class="form-control"
										required>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8">
									<input type="text" name="area"
										placeholder="Area/Locality/Landmark" class="form-control"
										required>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8">
									<input type="text" name="street" placeholder="Street"
										class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8">
									<input type="text" name="city" placeholder="City/District"
										class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8">
									<input type="text" name="state" placeholder="State"
										class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8">
									<input type="text" name="pincode" placeholder="Pincode"
										class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8">
									<input type="submit" class="btn btn-primary"
										value="Confirm Payment" />&nbsp; <input
										class="btn btn-warning" type="reset" value="Clear" />
								</div>
							</div>
						</form>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>