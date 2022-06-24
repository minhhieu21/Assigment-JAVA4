<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>


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

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.head {
	background-image: url('/images/office-865091_1280.jpg');
	background-size: 100% 100%;
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



<div class="col">
	<div class="row p-2">
	
	<jsp:include page="/common/inform.jsp"></jsp:include>
	
	<input type="hidden" name="favoriteId" value="${favoriteId }"/>
	
		<c:forEach var="item" items="${myList }">
		
			<div class="col-3 mt-2">
				<div class="card">
					<div class="card-header p-3 mb-2 bg-dark text-white">${item.title }</div>
					<div class="card-body">
						<img src="${item.poster }" alt=""
							class="img-fluid">
						<div class="row">
							<p class="text-secondary" >${item.description }</p>
						</div>
					</div>
					<div class="card-footer text-muted">
						<a href="/Assigment/LikeVideo?videoId=${item.videoId}" class="btn btn-primary">Unlike</a> 
						
						<a href="ShareVideo?videoId=${item.videoId }" class="btn btn-info">Share</a>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>
	<div class="row">
		<div class="col">
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item active"><a class="page-link" href="#">&lt;</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>