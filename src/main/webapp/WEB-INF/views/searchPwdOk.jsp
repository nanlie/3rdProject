<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>For味</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
    <style>
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}
    </style>
    <script>
    window.onload = function(){
    	let pwd = '${memberVO.password}';
    	let email = '${memberVO.email}';
    	console.log("email : " + email);
     	let fail = '${fail}';
     	if(pwd == ""){
     		document.getElementById("getPwd").value = '입력하신 정보가 올바르지 않습니다.';
     		return;
     	}
     	if(pwd != ""){
     		document.getElementById("getPwd").value = '가입 시 입력하신 이메일로 패스워드 정보를 발송하였습니다.';
     		$.ajax({
    			type : 'get',
    			url : "mailPwdCheck.do?email="+email+"&pwd="+pwd,
    			success : function (data) {
    				code =data;
    				auth = code;
    				console.log(auth)
    				alert('패스워드가 전송되었습니다. : ' + code);
    			}			
    		});
     	}
    }
    function searchPwdGo() {
    	location.href="searchPwd.do";
    }
    function searchIdGo() {
    	location.href="searchId.do";
    }
    function login(){
    	location.href="loginGo.do";
    }
    </script>
    
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


<!-- 탑바, 네비바 인클루드 -->
<jsp:include page="/WEB-INF/views/include_h.jsp"/>

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">패스워드 확인</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- 로그인 폼 시작 -->
    <div class="container-fluid bg-light overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container feature px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 feature-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 ps-lg-0">
                        <div class="section-title text-start">
                            <h1 class="display-5 mb-4">패스워드 확인</h1>
                        </div>
                        <p class="mb-4 pb-2"></p>
                        <div class="row g-3">
	                        <div class="col-12 col-sm-3">
	                     	   <input type="text" class="form-control border-0 bg-light" value="패스워드 " readonly style="height: 55px; text-align: center; font-weight: bold; font-size: 1.3em;">
	                        </div>
	                        <div class="col-12 col-sm-9">
	                     	   <input type="text" id="getPwd" class="form-control border-0" value="" readonly style="height: 55px; font-weight: bold; font-size: 0.9em;">
	                        </div>
	                        <div class="col-12" >
			                    <input type="button" class="btn btn-primary w-100 py-3" onclick="login()" value="로그인" style="height: 80px; font-weight: bold; font-size: 1.5em;">
			                </div>
			                <div class="col-12 col-sm-6" >
			                    <input type="button" class="btn btn-primary w-100 py-3" onclick="searchIdGo()" value="아이디 찾기" style="font-weight: bold;">
			                </div>
	                        <div class="col-12 col-sm-6" >
			                    <input type="button" class="btn btn-primary w-100 py-3" onclick="searchPwdGo()" value="패스워드찾기" style="font-weight: bold;">
			                </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 pe-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute img-fluid w-100 h-100" src="resources/img/carousel-1.jpg" style="object-fit: cover;" alt="">
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <!-- 로그인 폼 끝 -->
        

 	<!-- Footer 인클루드 -->
	<jsp:include page="/WEB-INF/views/include_f.jsp"/>


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/lib/wow/wow.min.js"></script>
    <script src="resources/lib/easing/easing.min.js"></script>
    <script src="resources/lib/waypoints/waypoints.min.js"></script>
    <script src="resources/lib/counterup/counterup.min.js"></script>
    <script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="resources/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="resources/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="resources/js/main.js"></script>
</body>

</html>