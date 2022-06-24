<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

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

.head {
	background-image: url('images/office-865091_1280.jpg');
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

<section class="pt-5">
	<div class="container">
		<div class="head pb-5">
			<div class="container py-5">
				<div class="card">
					<div class="card-body">
						<h1 class="font-weight-light text-center py-3">ĐĂNG KÍ TÀI
							KHOẢN</h1>
						<br>

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
								<form action="" method="post">
									${Routes.SITE_REGISTRATION_SHOW }






									<div class="row">
										<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
											<label>Họ và tên</label> <input type="text"
												class="form-control" name="fullname" id="fullname"
												value="${user.fullname }" placeholder="Họ và tên"
												aria-describedby="fullnameHelpId">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
											<label>Tên đăng nhập</label> <input type="text"
												class="form-control" name="username" id="username"
												placeholder="Tên đăng nhập" required
												aria-describedby="usernameHelpId"> <small
												id="usernameHelpId" value="${user.username } class="
												form-texttext-muted">Username required !</small>
										</div>

										<div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
											<label>Mật khẩu</label> <input type="password"
												class="form-control" name="password" id="password"
												minlength="3" maxlength="30" placeholder="Mật khẩu" required
												aria-describedby="passwordHelpId"> <small
												id="passwordHelpId" class="form-text text-muted">Password
												required !</small>
										</div>
									</div>


									<div class="row">
										<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
											<label>Email</label> <input type="email" class="form-control"
												name="email" id="email" placeholder="Email"
												aria-describedby="emailHelpId"> <small
												id="emailHelpId" value="${user.email } class=" form-texttext-muted">Email
												required !</small>
										</div>
									</div>

									<div class="row ">
										<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12 ">
											<input type="checkbox"> <label for=" ">I'm
												not a robot</label>
											<button class="btn btn-primary float-right">Đăng kí</button>
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

