<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<style>

.row.no-gutters{
	background: white;
	border-radius: 10px;
	box-shadow: 10px 10px 22px gray;
}
.form-row p{
	color : black;
}
img {
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
}

.btn1 {
	border: none;
	outline: none;
	height: 50px;
	width: 100%;
	background-color: black;
	color: white;
	border-radius: 4px;
	font-weight: bold;
}

.btn1:hover {
	background: white;
	border: 1px solid;
	color: black;
}
</style>
<div class="container">
        <section class="Form my-4 mr-5">
            <div class="row no-gutters">
                <div class="col-lg-5">
                    <img src="images/online-quiz-test-concept-vector.jpg" class="img-fluid" alt="">
                </div>
                <div class="offset-1 col-lg-6 px-5 pt-5">
                    <h1 class="font-weight-bold py-3">LOGIN TO SYSTEM</h1>
                    <h4>Sign into your account</h4>
                    
                    <jsp:include page="/common/inform.jsp"></jsp:include>
                    
                    <form action="/Assigment/Login" method="POST">
                        <div class="form-row">
                            <div class="col-lg-8">
                                <label for="username">Username :</label>
                                <input type="text" placeholder="Tên đăng nhập" class="form-control" name="username" id="username" aria-describedby="usernameHelpId" required>
                                <small id="usernameHelpId" class="form-text text-muted">Username required !</small>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-8">
                                <label class="mt-2" for="password">Password :</label>
                                <input type="password" placeholder="Mật khẩu" class="form-control" minlength="3" maxlength="30" aria-describedby="passwordHelpId" name="password" id="password" required>
                                <small id="passwordHelpId" class="form-text text-muted">Password required !</small>
                            </div>
                        </div>
                        <div class="form-check form-check-inline">
                            <label><input class="form-check-input mt-3" name="remember" type="checkbox"> Remember me ?</label>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-8">
                                <button type="submit" class="btn1 mt-3 mb-3">Login</button>
                                <a href="#" data-toggle="modal" data-target="#quenmk">Quên mật khẩu ?</a>
                                <p>Don't have an account ? <a href="Registration">Đăng kí tài khoản</a></p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Modal quenmk-->
            <div class="modal fade" id="quenmk" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Quên mật khẩu</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group ">
                                <label for="">Email :</label>
                                <input type="email" class="form-control" name="email" id="email" placeholder="Nhập địa chỉ email!" aria-describedby="emailHelpId" required>
                                <small id="emailHelpId" class="form-text text-muted">Email required !</small>
                            </div>
                            <div class="form-group ">
                                <label for="">Username :</label>
                                <input type="text" class="form-control" name="username" id="username" placeholder="Nhập tên đăng nhập của bạn!" aria-describedby="usernameHelpId" required>
                                <small id="usernameHelpId" class="form-text text-muted">Username required !</small>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">Xác nhận</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>