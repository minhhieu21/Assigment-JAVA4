<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>
	<base href="/Assigment/">
    <title>${page.title }</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Link icon -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <!-- Fontawesome -->
    <link rel="stylesheet" href="fontawesome-free-6.0.0-beta3-web/css/all.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

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
    
    .list-unstyled a,
    p {
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

<body>
    <main class="container-fluid">
        <div class="row top-bar">
            <div class="col-6 text-left pt-2">

                <p><i class="fas fa-map-marked-alt"></i>ONLINE ENTERTAMENT</p>
            </div>
            <div class="col-6 text-right pt-2">
                <p>
                    <a href="https://ap.poly.edu.vn/"><i class="fas fa-globe-asia"></i>  https://ap.poly.edu.vn/</a>
                </p>
            </div>
        </div>
        <nav class="row">
            <nav class="navbar navbar-expand-sm navbar-light bg-light col">
                <a class="navbar-brand" href="HomeServlet">Administration</a>
                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="HomeServlet"><i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Admin/VideosManagement"><i class="fa fa-info" aria-hidden="true"></i> Videos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Admin/UsersManagement"><i class="fa fa-id-card" aria-hidden="true"></i> Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ReportManagement"></i><i class="fa fa-comments" aria-hidden="true"></i> Reports</a>
                        </li>
                    </ul>
                     <ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="LogoffAdmin"></i><i class="fa fa-long-arrow-alt-right" aria-hidden="true"></i> Log-out</a></li>
					</ul>	
                </div>
            </nav>
        </nav>
        
        <section>
            <jsp:include page="${page.contentUrl }"></jsp:include>
        </section>
        
        <footer class="page-footer bg-dark">
            <div class="icon bg-info">
                <div class="container">
                    <div class="row py-4 d-flex align-items-center">
                        <div class="col-md-12 text-center">
                            <a href="#"><i class="fas fa-envelope mr-5 fa-2x"></i></a>
                            <a href="#"><i class="fab fa-facebook-square mr-5 fa-2x"></i></a>
                            <a href="#"><i class="fab fa-instagram mr-5 fa-2x"></i></i></a>
                            <a href="#"><i class="fab fa-twitter mr-5 fa-2x"></i></i></a>
                            <a href="#"><i class="fas fa-phone mr-5 fa-2x"></i></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container text-center text-md-left mt-5">
                <div class="row">
                    <div class="col-md-3 mx-auto mb-4">
                        <h6 class="text-uppercase">FPOLY POLYTECHNICH</h6>
                        <hr class="bg-success mb-4 mt-0 d-inline-block mx-auto" style="width: 168px; height: 2px;">
                        <p class="mt-2"> Delectus blanditiis ipsam nulla saepe asperiores voluptates reprehenderit, mollitia in nobi!</p>
                        <a href="#"><img src="images/logo.png" class="w-75"></a>

                    </div>

                    <div class="col-md-3 mx-auto mb-4">
                        <h6 class="text-uppercase">GIỚI THIỆU CÔNG TY</h6>
                        <hr class="bg-success mb-4 mt-0 d-inline-block mx-auto" style="width: 183px; height: 2px;">
                        <ul class="list-unstyled">
                            <li class="my-2">
                                <a href="#">Tuyển dụng </a>
                            </li>
                            <li class="my-2">
                                <a href="#">Gửi góp ý, khiếu nại</a>
                            </li>
                            <li class="my-2">
                                <a href="#">Quan hệ với nhà đầu tư</a>
                            </li>
                            <li class="my-2">
                                <a href="#">Nhận diện thương hiệu</a>
                            </li>
                            <li class="my-2">
                                <a href="#">Lorem ipsum dolor sit amet</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-3 mx-auto mb-4">
                        <h6 class="text-uppercase">Các liên kết khác</h6>
                        <hr class="bg-success mb-4 mt-0 d-inline-block mx-auto" style="width: 150px; height: 2px;">
                        <ul class="list-unstyled">
                            <li class="my-2">
                                <a href="#">Điều hành tác nghiệp</a>
                            </li>
                            <li class="my-2">
                                <a href="#">Hệ thống học tập LMS</a>
                            </li>
                            <li class="my-2">
                                <a href="#">Thư viện</a>
                            </li>
                            <li class="my-2">
                                <a href="#">Email</a>
                            </li>
                            <li class="my-2">
                                <a href="#">Hợp tác doanh nghiệp</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-3 mx-auto mb-4">
                        <h6 class="text-uppercase">Liên hệ</h6>
                        <hr class="bg-success mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; height: 2px;">
                        <ul class="list-unstyled">
                            <li class="my-2">
                                <a href="#"><i class="fas fa-home mr-2"></i>137 Nguyễn Thị Thập, Thanh Khê</a>
                            </li>
                            <li class="my-2">
                                <a href="#"><i class="fas fa-envelope mr-2"></i>caodangFPTpoly@gmail.com</a>
                            </li>
                            <li class="my-2">
                                <a href="#"><i class="fas fa-phone mr-2"></i>0236 3710 999</a>
                            </li>
                            <li class="my-2">
                                <a href="#"><i class="fas fa-fax mr-2"></i>00228718739878</a>
                            </li>
                            <li class="my-2">
                                <a href="https://ap.poly.edu.vn/"><i class="fas fa-globe-asia mr-2"></i>ap.poly.edu.vn/</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright text-center py-3">
                <h5>&copy; Copyright
                    <a href="ap.poly.edu.vn">ap.poly.edu.vn</a></h5>
                <p>Design by Minh Hieu </p>
            </div>
        </footer>
    </main>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	<c:if test="${not empty page.scriptUrl }">
		<jsp:include page="${page.scriptUrl }"></jsp:include>
	</c:if>
    <script>
        $('#myTab a').on('click', function(e) {
            e.preventDefault()
            $(this).tab('show')
        })
    </script>
</body>

</html>