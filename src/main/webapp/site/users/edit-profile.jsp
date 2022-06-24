<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<!doctype html>
<html lang="en">

<head>
<title>Edit profile</title>
<!-- Link icon -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<!-- Fontawesome -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style>
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
</head>

<body>

	<section class="pt-5">
		<div class="container">
			<div class="head pb-5">
				<div class="container py-5">
					<div class="card">
						<div class="card-body">
							<h1 class="font-weight-light text-center py-3">EDIT PROFILE</h1>
							
								<jsp:include page="/common/inform.jsp"></jsp:include>

							<div class="row">
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<di v class="row pt-3">
									<div class="col-lg-10 col-md-9 col-sm-9 col-9">
										<img src="images/shutterstock_1214717467-900x506.jpg"
											class="img-fluid" alt="">
									</div>
									</di>

									<div class="row pt-3">
										<div class="col-lg-1 offset-1 col-md-2 col-sm-2 col-2">
											<span style="font-size: 25px; color: aquamarine;"><i
												class="fas fa-location-crosshairs"></i></span>
										</div>

										<div class="col-lg-10 col-md-9 col-sm-9 col-9">
											<h3 class="font-weight-light">ONLINE ENTERTAIMENT</h3>
											<p class="text-info">
												Trường cao đẳng Foly Polytechnich Đà Nẵng <br> +47 736
												8129 812 <br> (0236) 3710 999
											</p>
										</div>
									</div>
								</div>

								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<form action="EditProfile" method="post">
										<div class="row">
											<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
												<label>Tên đăng nhập</label> <input type="text"
													class="form-control" name="username" id="username"
													value="${user.username }" placeholder="Tên đăng nhập"
													aria-describedby="usernameHelpId"> <small
													id="userHelpId" class="form-text text-muted">Username
													required !</small>
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
												<label>Mật khẩu :</label> <input type="password"
													class="form-control" name="password" id="password"
													value="${user.password }" placeholder="Mật khẩu"
													aria-describedby="passwordHelpId"> <small
													id="passwordHelpId" class="form-text text-muted">Password
													required !</small>
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
												<label>Địa chỉ email :</label> <input type="email"
													class="form-control" name="email" id="email"
													value="${user.email }" placeholder="Email" required
													aria-describedby="emaildHelpId"> <small
													id="emailHelpId" class="form-text text-muted">Email
													required !</small>
											</div>

											<div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
												<label>Họ và tên : </label> <input type="text"
													class="form-control" name="fullname" id="fullname"
													value="${user.fullname }" placeholder="Họ và tên" required
													aria-describedby="fullnamedHelpId"> <small
													id="fullnameHelpId" class="form-text text-muted">Fullname
													required !</small>
											</div>
										</div>

										<div class="row ">
											<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12 ">
												<input type="checkbox"> <label for=" ">I'm
													not a robot</label>
												<button class="btn btn-primary float-right">Thay
													đổi</button>
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12 ">
												<a href="Login">Click here to login</a>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<style>
.btn {
	border: none;
	outline: none;
	height: 50px;
	width: 60%;
	background-color: black;
	color: white;
	border-radius: 4px;
	font-weight: bold;
}
</style>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js "
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo "
		crossorigin="anonymous "></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js "
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1 "
		crossorigin="anonymous "></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js "
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM "
		crossorigin="anonymous "></script>
</body>

</html>