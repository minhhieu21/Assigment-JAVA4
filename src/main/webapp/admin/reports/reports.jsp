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
</style>


<ul class="nav nav-tabs pt-5" id="myTab" role="tablist">
	<li class="nav-item"><a class="nav-link active" id="favorites-tab"
		data-toggle="tab" href="#favorites" role="tab"
		aria-controls="favorites" aria-selected="true">Favorites</a></li>
	<li class="nav-item"><a class="nav-link" id="favoritesUser-tab"
		data-toggle="tab" href="#favoritesUser" role="tab"
		aria-controls="favoritesUser" aria-selected="false">Favorites User</a>
	</li>
	<li class="nav-item"><a class="nav-link" id="shareFriends-tab"
		data-toggle="tab" href="#shareFriends" role="tab"
		aria-controls="shareFriends" aria-selected="false">Share Friends</a></li>
</ul>
<div class="tab-content pb-5" id="myTabContent">
	<div class="tab-pane fade show active" id="favorites" role="tabpanel"
		aria-labelledby="favorites-tab">
		<table class="table table-border mt-3">
			<tr>
				<td>Video Title</td>
				<td>Favorites Count</td>
				<td>Lasted Date</td>
				<td>Oldest Date</td>
			</tr>
			<c:forEach var="item" items="${favList}">
				<tr>
					<td>${item.videoTitle}</td>
					<td>${item.favoriteCount}</td>
					<td>${item.newesDate}</td>
					<td>${item.oldesDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div class="tab-pane fade" id="favoritesUser" role="tabpanel"
		aria-labelledby="favoritesUser-tab">
		<form method="get">
			<div class="row mt-3">
				<div class="col">
					<div class="form-inline">
						<div class="form-group">
							<label>Video Title <select name="videoUserId"
								id="videoUserId" class="form-control ml-3">
									<c:forEach var="item" items="${vidList}">
										<option value="${item.videoId }"
										 ${item.videoId == videoUserId? 'selected':'' }>${item.title }</option>
									</c:forEach>
							</select>
							</label>
							<button class="btn btn-info ml-2">Report</button>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col mt-3">
					<table class="table table-bordered">
						<tr>
							<td>Username</td>
							<td>Fullname</td>
							<td>Email</td>
							<td>Favorites Date</td>
						</tr>

						<c:forEach var = "item" items = "${favUserList }">
							<tr>
								<td>${item.username }</td>
								<td>${item.fullname }</td>
								<td>${item.email }</td>
								<td>${item.likeDate }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</form>
	</div>

	<div class="tab-pane fade" id="shareFriends" role="tabpanel"
		aria-labelledby="shareFriends-tab">
		<form action="" method="post">
			<div class="row mt-3">
				<div class="col">
					<div class="form-inline">
						<div class="form-group">
							<label>Video Title <select name="" id=""
								class="form-control ml-3">
									<option value="">Java Programming</option>
							</select>
							</label>
							<button class="btn btn-info ml-2">Report</button>
							</form-group>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col mt-3">
					<table class="table table-bordered">
						<tr>
							<td>Sender Name</td>
							<td>Sender Email</td>
							<td>Receiver Email</td>
							<td>Send Date</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>