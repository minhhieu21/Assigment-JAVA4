<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<style>
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

<section class="pt-5">
	<div class="container">
		<div class="head pb-5">
			<div class="container py-5">
				<div class="card">
					<div class="card-body">
						<h1 class="font-weight-light text-center py-3">THAY ĐỔI MẬT
							KHẨU</h1>
							
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
								<form action="ChangePassword" method="post">
									<div class="row">
										<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
											<label>Tên đăng nhập</label> <input type="text"
												class="form-control" name="username" id="username"
												value = "${username }"
												placeholder="Tên đăng nhập"
												aria-describedby="usernameHelpId"> <small
												id="userHelpId" class="form-text text-muted">Usernaem
												required !</small>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
											<label>Mật khẩu cũ :</label> <input type="password"
												class="form-control" name="password" id="password"
												placeholder="Mật khẩu cũ" aria-describedby="passwordHelpId">
											<small id="passwordHelpId" class="form-text text-muted">Password
												required !</small>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
											<label>Mật khẩu mới :</label> <input type="password"
												class="form-control" name="currentPassword"
												id="currentPassword" placeholder="Mật khẩu mới" required
												aria-describedby="currentPasswordHelpId"> <small
												id="currentPasswordHelpId" class="form-text text-muted">Current
												password required !</small>
										</div>

										<div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
											<label>Xác nhận lại mật khẩu : </label> <input
												type="password" class="form-control" name="confirmPassword"
												id="confirmPassword" minlength="3" maxlength="30"
												placeholder="Xác nhận mật khẩu" required
												aria-describedby="confirmPasswordHelpId"> <small
												id="confirmPasswordHelpId" class="form-text text-muted">Confirm
												password required !</small>
										</div>
									</div>

									<div class="row ">
										<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12 ">
											<input type="checkbox"> <label for=" ">I'm
												not a robot</label>
											<button class="btn btn-primary float-right">Đổi mật
												khẩu</button>
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
