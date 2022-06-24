<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
h6 {
	color: gray;
}

.icon a {
	color: white;
}

.icon a :hover {
	color: #FFA1C9;
}

.list-unstyled a, p {
	color: #FAEEE7;
	text-decoration: none;
}

.list-unstyled a:hover {
	color: #FF6464;
	text-decoration: none;
}

.top-bar {
	background: #FF8243;
}

.top-bar a {
	color: white;
	font-size: 1.1rem;
	text-decoration: none;
}

article p {
	color: #325288;
}
/*-- Fixed Background Image --*/
.fixed-background {
	position: relative;
	width: 100%;
	z-index: 1000 !important;
	padding: 10rem 0;
}

.fixed-wrap {
	clip: rect(0, auto, auto, 0);
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -999 !important;
}

.fixed {
	background-image: url('images/matrix.jpg');
	position: fixed;
	z-index: -999 !important;
	display: block;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-size: cover;
	background-position: center center;
	-webkit-transform: translateZ(0);
	transform: translateZ(0);
	will-change: transform;
}
</style>

<article>
	<div class="col-12 text-center mt-3">
		<h1 class="text-dark pt-4">Danh sách video</h1>
		<div class="border-top border-primary w-25 mx-auto my-3"></div>
		<p class="lead">Cập nhật danh sách video mới nhất hằng ngày</p>
	</div>
	<jsp:include page="/common/inform.jsp"></jsp:include>

	<!-- Three colums Section -->
	<div class="container">
		<form method="get" class="new row my-5 ">

			<c:forEach var="item" items="${videos}">

				<div class=" col-md-4 my-4">
					<a href="Detail?videoId=${item.videoId }"> 
					<img
						src="${ empty item.poster? 'images/nokia-x60-600x600.jpg': item.poster }"
						alt="" class="w-50">
					</a>

					<h4 class="my-4">${item.title }</h4>
					<p>${item.description }</p>


					<a href="LikeVideo?videoId=${item.videoId}"
						class="btn btn-outline-success btn-md">LIKE</a> 
						
					<a href="ShareVideo?videoId=${item.videoId }"
						class="btn btn-outline-info btn-md">SHARE</a>
				</div>

			</c:forEach>

		</form>
		<div class="row">
			<div class="col">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<li class="page-item disabled"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<div class="fixed-background">
		<div class="row text-light py-5">
			<div class="col-12 text-center">
				<h1>LẬP TRÌNH ỨNG DỤNG JAVA</h1>
				<h3 class="py-4">See what's on the other side.</h3>

				<a href="#" class="btn btn-danger btn-sm mr-2">Xem chi tiết</a> <a
					href="#" class="btn btn-primary btn-sm ml-2">Bỏ qua</a>
			</div>
		</div>
		<div class="fixed-wrap">
			<div class="fixed"></div>
		</div>
	</div>

	<div class="container my-5">
		<div class="end row py-4">
			<div class="col-lg-4 mb-4 my-lg-auto">
				<h1 class="text-dark font-weight-bold mb-3">Lập trình JAVA 4</h1>
				<p class="mb-4">Lorem ipsum dolor sit amet consectetur,
					adipisicing elit. Adipisci quisquam eius cumque ducimus rerum
					tenetur quae ea ipsum consectetur culpa consequatur enim dolores
					cupiditate unde, vero magni cum omnis perferendis.</p>
				<a href="#" class="btn btn-outline-dark">Xem thêm</a>
			</div>

			<div class="col-lg-8">
				<img src="images/code.jpg" alt="" class="w-100">
			</div>
		</div>
	</div>
</article>