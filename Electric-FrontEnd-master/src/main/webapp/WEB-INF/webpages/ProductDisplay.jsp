<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Display</title>
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<script src="resources/bootstrap-3.3.7-dist/Scripts/bootstrap.min.js"></script>
<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container jumbotron">
		<div class="row">
			<div class="col-lg-12">
			<div class="well well-sm">
					<h3  class="text-center">Product View Page</h3>
				</div>
				<c:forEach items="${prodList}" var="proditem">
					<div class="thumbnail">
						<p class="text-center">${proditem.prodName}</p>
						<a href="ProductDescription${proditem.productId}"><img src="resources/images/${proditem.productId}.jpg" height="300"
							width="150" class="img-responsive img-rounded" /></a>
						<p class="text-center">${proditem.productDesc}<br /> &#x20B9 ${proditem.price}/-
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>