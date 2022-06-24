<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>



<section class="row">
	<article class="col-9">
		<div class="jumbotron mt-2">
			<h1 class="display-4">FRONT-END FRAMEWORK</h1>
			<p class="lead">Lorem ipsum dolor sit amet consectetur
				adipisicing elit. Adipisci voluptatibus quisquam dolor similique
				laboriosam impedit veniam. Omnis accusantium repellendus soluta, ea
				voluptatibus a rerum vel cum praesentium quia voluptatum iste.</p>
			<hr class="my-2">
			<p>More info</p>
			<p class="lead">
				<a class="btn btn-primary " href="#" role="button">Xem thêm...</a>
			</p>
		</div>


		<div class="row">
			<div class="col pt-4 pb-4">
				<div id="demo" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="images/la.jpg" alt="Los Angeles" width="1100"
								height="500">
							<div class="carousel-caption">
								<h3>Los Angeles</h3>
								<p>We had such a great time in LA!</p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="images/chicago-1791002_1280.jpg" alt="Chicago"
								width="1100" height="500">
							<div class="carousel-caption">
								<h3>Chicago</h3>
								<p>Thank you, Chicago!</p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="images/paris.jpg" alt="Paris" width="1100" height="500">
							<div class="carousel-caption">
								<h3>PARIS</h3>
								<p>We love the Big Apple!</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev " href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
				</div>

			</div>
		</div>



	</article>
	<aside class="col-3">
		<div class="poly-card mt-2">
			<div id="accordion">

				<div class="card">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapseOne">
							<i class="fas fa-list-ul"></i> Chủng loại
						</a>
					</div>
					<div id="collapseOne" class="collapse show"
						data-parent="#accordion">
						<div class="list-group">
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between ">Apple<span
								class="badge badge-primary badge-pill">14</span></a> <a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between ">Samsung<span
								class="badge badge-primary badge-pill">9</span></a> <a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between ">Nokia<span
								class="badge badge-primary badge-pill">20</span></a> <a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between ">Oppo<span
								class="badge badge-primary badge-pill">10</span></a> <a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between ">Lenovo<span
								class="badge badge-primary badge-pill">5</span></a> <a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between ">Black
								Berry<span class="badge badge-primary badge-pill">8</span>
							</a>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link" data-toggle="collapse"
							href="#collapseTwo"> <i class="far fa-list-alt"></i> Nhà cung
							cấp
						</a>
					</div>
					<div id="collapseTwo" class="collapse" data-parent="#accordion">
						<div class="list-group">
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Apple</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Samsung</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Nokia</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">GL</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Sony
								Ericson</a> <a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Dell</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Acer</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">HP</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Toshiba</a>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link" data-toggle="collapse"
							href="#collapseThree"> <i class="fas fa-star"></i> Hàng đặc
							biệt
						</a>
					</div>
					<div id="collapseThree" class="collapse" data-parent="#accordion">
						<div class="list-group">
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Apple</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Samsung</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Nokia</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">GL</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Sony
								Ericson</a> <a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Dell</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Acer</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">HP</a>
							<a href="#"
								class="list-group-item list-group-item-action d-flex justify-content-between">Toshiba</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</aside>
</section>