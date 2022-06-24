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
			id="userEditing-tab" data-toggle="tab" href="#userEditing" role="tab"
			aria-controls="userEditing" aria-selected="true">User Editing</a></li>
		<li class="nav-item"><a class="nav-link" id="userList-tab"
			data-toggle="tab" href="#userList" role="tab"
			aria-controls="userList" aria-selected="false">User List</a></li>
	</ul>
	<div class="tab-content pb-5" id="myTabContent">
		<div class="tab-pane fade show active" id="userEditing"
			role="tabpanel" aria-labelledby="userEditing-tab">
			<form action="" method="post">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<div class="form-group">
									<label for="username">Username</label> <input type="text"
										class="form-control" name="username" id="username"
										value="${user.username }" aria-describedby="usernamHelpId"
										placeholder="Username"> <small id="usernamHelpId"
										class="form-text text-muted">Username required !</small>
								</div>

								<div class="form-group">
									<label for="fullname">Fullname</label> <input type="text"
										class="form-control" name="fullname" id="fullname"
										value="${user.fullname }" aria-describedby="fullnameHelpId"
										placeholder="Fullname"> <small id="fullnameHelpId"
										class="form-text text-muted">Fullname required !</small>
								</div>
									
									<label for="admin">Role :</label > <br>
									
									<div class="form-check form-check-inline">
									<label class="mr-2"><input type="radio"
										class="form-check-input"
										value="false" name="admin" id="status" ${!user.admin? 'checked':'' } > 
										User
									</label> 
									
									<label>
										<input type="radio" class="form-check-input" value="true"
										name="admin" id="status" ${ user.admin? 'checked':'' }> 
										Admin
									</label>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="password">Password</label> <input type="password"
										class="form-control" name="password" id="password"
										value="${user.password }" aria-describedby="passwordHelpId"
										placeholder="Password"> <small id="passwordHelpId"
										class="form-text text-muted">Pass required !</small>
								</div>

								<div class="form-group">
									<label for="email">Email</label> <input type="email"
										class="form-control" name="email" id="email"
										value="${user.email }" aria-describedby="emailHelpId"
										placeholder="Email"> <small id="emailHelpId"
										class="form-text text-muted">Email required !</small>
								</div>
								
							</div>
						</div>

					</div>
					<div class="card-footer text-muted text-center">
						<button formaction="Admin/UsersManagement/create"
							class="btn btn-primary">Create</button>
						<button formaction="Admin/UsersManagement/update"
							class="btn btn-warning">Update</button>
						<button formaction="Admin/UsersManagement/delete"
							class="btn btn-danger">Delete</button>
						<button formaction="Admin/UsersManagement/reset"
							class="btn btn-info">Reset</button>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="userList" role="tabpanel"
			aria-labelledby="userList-tab">
			<table class="table table-strip">
				<tr>
					<td>Username</td>
					<td>Fullname</td>
					<td>Email</td>
					<td>Role</td>
					<td>&nbsp;</td>
				</tr>

				<c:forEach var="item" items="${users }">
					<tr>
						<td>${item.username }</td>
						<td>${item.fullname }</td>
						<td>${item.email }</td>
						<td>${item.admin? 'Admin': 'User' }</td>

						<td><a
							href="Admin/UsersManagement/edit?username=${item.username }"><i
								class="fa fa-edit" aria-hidden="true"></i>Edit</a> <a
							href="Admin/UsersManagement/delete?username=${item.username }"><i
								class="fa fa-trash" aria-hidden="true"></i>Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>