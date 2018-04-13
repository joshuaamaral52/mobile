<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>The Electronic Store</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">

				<div class="item active">
					<img src="resources/CarouselImages/001.jpg" alt="Los Angeles"
						style="width: 100%;">
					<div class="carousel-caption">
						<h3>Blue</h3>
						<p>This image is blue!</p>
					</div>
				</div>

				<div class="item">
					<img src="resources/CarouselImages/002.jpg" alt="Chicago"
						style="width: 100%;">
					<div class="carousel-caption">
						<h3>Scenery</h3>
						<p>The black part maybe a stone!</p>
					</div>
				</div>

				<div class="item">
					<img src="resources/CarouselImages/005.jpg" alt="New York"
						style="width: 100%;">
					<div class="carousel-caption">
						<h3>Green Apple</h3>
						<p>We love the Big Green Apple!</p>
					</div>
				</div>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>