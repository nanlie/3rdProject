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
    input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
    </style>
    <script>
    var auth = "";
    function chkSpace(){
    	var kcode = event.keyCode;
    	if(kcode == 32) {
    		event.returnValue = false;
    	}
    }
    function searchIdGo(frm) {
    	let email = "";
    	const checkInput = $('#certification')
    	let isName = $('#name').val();
    	let isEmail = $('#emailName').val();
    	let isDomain = $('#textEmail').val();
    	if(isName == ""){
    		alert("이름을 입력하세요");
    		return;
    	}
    	if(isEmail == "" || isDomain == "") {
    		alert("메일주소를 입력하세요");
    		return;
    	}
		    	
    	if(frm.domain.value == 'directly' || frm.domain.value == 'select'){
			let directly = document.getElementById("textEmail").value
			email = frm.emailName.value + "@" + frm.directly.value;
			frm.email.value = email;
		} else if (frm.emailName.value != "" && frm.domain.value != 'directly') {
			email = frm.emailName.value + "@" + frm.domain.value;
			frm.email.value = email;
		}
    	$.ajax({
			type : 'get',
			url : '<c:url value ="mailCheck.do?email="/>'+email,
			success : function (data) {
				code =data;
				auth = code;
				console.log(auth)
				alert('인증번호가 전송되었습니다.');
			}			
		}); // end ajax

    }
   
    function next(frm) {
    	if(auth === ""){
    		alert("이메일 인증을 진행해 주세요");
    		return;
    	}
    	const inputCode = $('#certification').val();
    	if(inputCode === auth){
			alert('인증번호가 일치합니다.');
			frm.submit()
		}else{
			alert('인증번호가 불일치 합니다. 다시 확인해주세요.');
			document.getElementById("certification").focus();
			return;
		}
    }
    
  //메일
    $(function() {
	    $('#select').change(function() {
	        if ($('#select').val() == 'directly') {
	            $('#textEmail').attr("disabled", false);
	            $('#textEmail').val("");
	            $('#textEmail').focus();
	        } else {
	            $('#textEmail').val($('#select').val());
	            $('#textEmail').attr("disabled", true);
	        }
	    })
	});
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">아이디 찾기</h1>
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
                            <h1 class="display-5 mb-4">아이디 찾기</h1>
                        </div>
                        <p class="mb-4 pb-2"></p>
                        <form action="searchIdOk.do" method="post" autocomplete="off">
                        <div class="row g-3">
	                        <div class="col-12 col-sm-4">
	                     	   <input type="text" class="form-control border-0 bg-light" value="이름 " readonly style="height: 55px; text-align: center; font-weight: bold; font-size: 1.3em;">
	                        </div>
	                        <div class="col-12 col-sm-8">
	                     	   <input type="text" id="name" name="name" class="form-control border-0" placeholder="이름 " onkeydown="chkSpace()" title="이름 " maxlength="12" style="height: 55px;">
	                        </div>
	                       
	                        <div class="col-12 col-sm-5">
                                     <input type="text" name="emailName" class="form-control border-0" id="emailName" value="" onkeydown="chkSpace()" placeholder="이메일 입력" title="이메일" style="height: 55px;"> 
                                </div>
                                <div class="col-12 col-sm-1" >
                                	<input type="text" name="at" class="form-control border-0 bg-light" value="@" disabled="disabled" style="height: 55px; font-size: 0.8em;">
                                </div>
                                <div class="col-12 col-sm-3">
									<input id="textEmail" name="directly" class="form-control border-0" placeholder="이메일 입력" onkeydown="chkSpace()" title="이메일" style="height: 55px;">
								</div>
                                <div class="col-12 col-sm-3">
									<select id="select" name="domain" class="form-select border-0" style="height: 55px;">
							            <option value="select" disabled selected>E-Mail 선택</option>
							            <option value="naver.com" id="naver.com">naver.com</option>
							            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
							            <option value="gmail.com" id="gmail.com">gmail.com</option>
							            <option value="nate.com" id="nate.com">nate.com</option>
							            <option value="directly" id="textEmail">직접 입력하기</option>
							        </select>
							        <input type="hidden" id="email" name="email" value="">
								</div>
							<div class="col-12 col-sm-12">
	                            <input type="text" class="form-control border-0 bg-light" value="본인확인 이메일 주소와 가입시 입력한 이메일 주소가 같아야 합니다. " readonly style="height: 55px;  text-align: center; font-weight: bold; font-size: 1.1em;">
	                        </div>
	                        <div class="col-12 col-sm-6" >
			                    <input type="button" class="btn btn-primary w-100 py-3" onclick="searchIdGo(this.form)" value="인증번호 받기" style="height: 60px; font-weight: bold; font-size: 1.5em;">
			                </div>
	                        <div class="col-12 col-sm-6" >
			                    <input type="number" id="certification" class="form-control border-0" onclick="chkSpace()" value="" placeholder="인증번호 입력" style="height: 60px;">
			                </div>
	                        <div class="col-12" >
			                    <input type="button" class="btn btn-primary w-100 py-3" onclick="next(this.form)" value="다음" style="height: 80px; font-weight: bold; font-size: 1.5em;">
			                </div>
                        </div>
                        </form>
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