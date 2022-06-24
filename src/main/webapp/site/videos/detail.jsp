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
</style>




<div class="row">
	<div class="col-8">
		<div class="card text-center mt-3 mb-3">
			<div class="card-body">
				<input type="hidden" name="videoId" value="${videoId }" />
				<div class="row">
					<img
						src="${video.poster != null? video.poster: 'images/nokia-x60-600x600.jpg' }"
						class="img-fluid w-50 rounded mx-auto d-block">
				</div>
				<div class="row p-2">
					<h3>${video.title }</h3>
				</div>
				<div class="row p-2">
					<b>${video.description }</b>
				</div>
			</div>
			<div class="card-footer text-right">

				<a href="LikeVideo?videoId=${item.videoId }"
					" class="btn btn-success">Like</a>
					
				<a
					href="ShareVideo?videoId=${item.videoId }" 
					class="btn btn-info">Share</a>

			</div>
		</div>
	</div>
	<div class="col-4">
		<div class="row mt-3 mb-3">
			<c:forEach var="item" items="${videos }">
				<div class="col-3">
				<a href="Detail?videoId=${item.videoId }"><img
						src="${ empty item.poster? 'images/nokia-x60-600x600.jpg': item.poster }"
						class="img-fluid w-70"></a>
					
				</div>
				<div class="col-8 border-left p-3 mb-2 bg-secondary text-white">${item.title }</div>
			</c:forEach>
		</div>
	</div>
</div>