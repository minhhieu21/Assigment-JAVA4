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



<div class="offset-1 col-10 pt-3 pb-3">
	<div class="head pb-5 ">
		<div class="container py-5 ">
			<div class="card">
				<div class="card-body">
					<h1 class="font-weight-light text-center py-3">Send Video to
						Your Friends</h1>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<di v class="row pt-3">
							<div class="col-lg-1 offset-1 col-md-2 col-sm-2 col-2">
								<span style="font-size: 25px; color: red;"><i
									class="fas fa-map-pin"></i></span>
							</div>

							<div class="col-lg-10 col-md-9 col-sm-9 col-9">
								<h3 class="font-weight-light">Chia sẻ video đến bạn bè</h3>
								<p class="text-info">Lorem ipsum dolor sit amet consectetur
									adipisicing elit. Reprehenderit veniam ratione incidunt dolores
									esse natus.</p>
							</div>
							</di>

							<div class="row pt-3">
								<div class="col-lg-1 offset-1 col-md-2 col-sm-2 col-2">
									<span style="font-size: 25px; color: aquamarine;"><i
										class="fas fa-phone"></i></span>
								</div>

								<div class="col-lg-10 col-md-9 col-sm-9 col-9">
									<h3 class="font-weight-light">Dịch vụ</h3>
									<p class="text-info">
										Onlie Entertaiment<br> +47 736 8129 812 <br> (0236)
										3710 999
									</p>
								</div>
							</div>
						</div>

						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<form action="ShareVideo" method="post">
							<input type="hidden" name="videoId" value="${videoId }"/>
							
							<jsp:include page="/common/inform.jsp"></jsp:include>
							
								<div class="form-row">
									<div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
										<label>Họ và tên</label> <input type="text" name="fullname" id="fullname"
											class="form-control" placeholder="Họ và tên">
									</div>

									<div class="form-group col-lg-6 col-md-12 col-sm-12 col-12">
										<label>Số điện thoại</label> <input type="number" name="sdt"
											class="form-control" placeholder="Số điện thoại">
									</div>
								</div>

								<div class="form-row">
									<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
										<label>Email</label> <input type="email" class="form-control"
											name="email" id="email" aria-describedby="emailHelperId"
											placeholder="Địa chỉ email"> <small
											id="emailHelperId" class="form-text text-muted">Email
											is required !</small>
									</div>
								</div>

								<div class="form-row">
									<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
										<label>Lời nhắn</label>
										<textarea class="form-control mb-3"
											name="content" placeholder="Lời nhắn của bạn" id="" cols="10" rows="5"></textarea>
									</div>
								</div>

								<div class="form-row">
									<div class="form-group col-lg-12 col-md-12 col-sm-12 col-12">
										<input type="checkbox"> <label for="">I'm not
											a robot</label>
										<button class="btn btn-success float-right">Send
											Message</button>
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