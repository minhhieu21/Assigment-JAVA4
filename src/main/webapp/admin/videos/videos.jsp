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


<div class="col mt-3">

	<jsp:include page="/common/inform.jsp"></jsp:include>

	<ul class="nav nav-tabs pt-3" id="myTab" role="tablist">
		<li class="nav-item"><a class="nav-link active"
			id="videoEditing-tab" data-toggle="tab" href="#videoEditing"
			role="tab" aria-controls="videoEditing" aria-selected="true">Video
				Editing</a></li>
		<li class="nav-item"><a class="nav-link" id="videoList-tab"
			data-toggle="tab" href="#videoList" role="tab"
			aria-controls="videoList" aria-selected="false">Video List</a></li>
	</ul>
	<div class="tab-content pb-5" id="myTabContent">
		<div class="tab-pane fade show active" id="videoEditing"
			role="tabpanel" aria-labelledby="videoEditing-tab">
			<form action="" method="post" enctype="multipart/form-data">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-3">
								<div class="border p-3">
									<img
										src="${video.poster != null? video.poster: 'images/nokia-x60-600x600.jpg' }"
										alt="" class="img-fluid">

									<div class="input-group mb-3 mt-3">
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="cover" name="cover" /> 
											<label for="cover">
												<span class="input-group-text">Upload</span>
											</label>
										</div>
									</div>

								</div>
							</div>
							<div class="col-9">
								<div class="form-group">
									<label for="youtubeId">Youtube ID</label> <input type="text"
										class="form-control" name="videoId" id="videoId"
										value="${video.videoId }" aria-describedby="youtubeHelpId"
										placeholder="Youtube ID"> <small id="youtubeHelpId"
										class="form-text text-muted">Youtube ID is required</small>
								</div>
								<div class="form-group">
									<label for="videoTitle">Video Title</label> <input type="text"
										class="form-control" name="title" id="title"
										value="${video.title }" aria-describedby="videoTileHelpId"
										placeholder="Video Title"> <small id="videoTileHelpId"
										class="form-text text-muted">Video required !</small>
								</div>
								<div class="form-group">
									<label for="viewCount">View Count</label> <input type="number"
										class="form-control" name="views" id="views"
										value="${video.views }" aria-describedby="viewCountHelpId"
										placeholder="View Count"> <small id="viewCountHelpId"
										class="form-text text-muted">View count required !</small>
								</div>
								<div class="form-check form-check-inline">
									<label class="mr-2"><input type="radio"
										class="form-check-input"
										value="true" name="active" id="status" ${video.active? 'checked':'' } > 
										Active
									</label> 
										
									<label>
										<input type="radio" class="form-check-input" value="false"
										name="active" id="status" ${ !video.active? 'checked':'' }> 
										UnActive
									</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label for="description">Description</label>
								<textarea name="description" id="description" cols="30" rows="5" 
								 class="form-control">${video.description}</textarea>
							</div>
						</div>
					</div>
					<div class="card-footer text-muted text-center">
						<button class="btn btn-primary"
							formaction="Admin/VideosManagement/create">Create</button>
						<button class="btn btn-warning"
							formaction="Admin/VideosManagement/update">Update</button>
						<button class="btn btn-danger"
							formaction="Admin/VideosManagement/delete">Delete</button>
						<button class="btn btn-info"
							formaction="Admin/VideosManagement/reset">Reset</button>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="videoList" role="tabpanel"
			aria-labelledby="videoList-tab">
			<table class="table table-strip">
				<tr>
					<td>Youtube ID</td>
					<td>Video Title</td>
					<td>View Count</td>
					<td>Status</td>
					<td>&nbsp;</td>
				</tr>
				<c:forEach var="item" items="${videos }">
				<tr>
					<td>${item.videoId }</td>
					<td>${item.title }</td>
					<td>${item.views }</td>
					<td>${item.active? 'Active': 'UnActive' }</td>
					<td>
						<a href="Admin/VideosManagement/edit?videoId=${item.videoId }"><i class="fa fa-edit" aria-hidden="true"></i>
							Edit</a>
						<a href="Admin/VideosManagement/delete?videoId=${item.videoId }"><i class="fa fa-trash" aria-hidden="true"></i>
							Delete</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	</div>
	