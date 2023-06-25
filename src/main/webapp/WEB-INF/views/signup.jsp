<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>For味</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
    
	</script>
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
    
    <!-- 회원가입 관련 script -->
   	<script src="resources/js/signup.js"></script>
    <style>
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}
    </style>
    <script>
    var auth = "";
    var mailChkCnt = 0;
    function mailAuth(frm) {
    	let email = "";
    	const checkInput = $('#certification');
    	let isEmail = $('#emailId').val();
    	let isDomain = $('#textEmail').val();
    	if(isEmail == "" || isDomain == "") {
    		alert("메일주소를 입력하세요");
    		return;
    	}
		    	
    	if(frm.domain.value == 'directly' || frm.domain.value == 'select'){
			let directly = document.getElementById("textEmail").value
			email = frm.email1.value + "@" + frm.directly.value;
		} else if (frm.email1.value != "" && frm.domain.value != 'directly') {
			email = frm.email1.value + "@" + frm.domain.value;
		}
    	$.ajax({
			type : 'get',
			url : '<c:url value ="mailUseCheck.do?email="/>'+email,
			success : function (data) {
				code = data;
				auth = code;
				console.log(data);
				if(data == "0"){
					alert("이미 사용중인 이메일 입니다.");
					mailChkCnt = 0;
				} else {
					alert('인증번호가 전송되었습니다.');
					mailChkCnt = 1;
				}
			}			
		}); // end ajax

    }
	function registerGo(frm) {
		let email = "";
		let pwd1 = $("#pwd1").val();
    	let pwd2 = $("#pwd2").val();
    	let reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$/
		let firstForm = document.forms[0];
    	let hpLength = firstForm.elements[7].value.trim().length;
		console.log(firstForm.elements);
	 	for (let i = 0; i < 20; i++) {
	 		if(firstForm.elements[i].value.trim() == "성별"
	 				|| firstForm.elements[i].value.trim() == "년"
	 				|| firstForm.elements[i].value.trim() == "월"
	 				|| firstForm.elements[i].value.trim() == "일"){
	 			firstForm.elements[i].focus();
	 			alert(firstForm.elements[i].title + " 입력하세요");
				return;
				}
			if (firstForm.elements[i].value.trim() == "") {
				if ( i == 1 || i == 3 || i == 5 || i == 12 || i == 14) continue;
				firstForm.elements[i].focus();
				alert(firstForm.elements[i].title + " 입력하세요");
				return;
			}
		}  
	 	if(!reg.test(pwd1)){
	 		alert("비밀번호를 양식에 맞춰 입력하세요");
	 		document.getElementById("pwd1").focus();
	 		return;
	 	}
	 	if(pwd1 != pwd2){
	 		alert("동일한 비밀번호를 입력하세요");
	 		document.getElementById("pwd2").focus();
	 		return;
	 	}
		if(frm.domain.value == 'directly' || frm.domain.value == 'select'){
			let directly = document.getElementById("textEmail").value
			email = frm.email1.value + "@" + frm.directly.value;
			frm.email.value = email;
		} else if (frm.email1.value != "" && frm.domain.value != 'directly') {
			email = frm.email1.value + "@" + frm.domain.value;
			frm.email.value = email;
		}
		if (frm.yy.value != "년" && frm.mm.value != "월" && frm.dd.value != "일") {
	    	let birth = frm.yy.value + frm.mm.value + frm.dd.value;
    		frm.birth.value = birth;
		}
		if(frm.firstAaddress.value != ""){
			let address = frm.firstAaddress.value + " " + frm.detailAddress.value;
    		frm.address.value = address;
		}
		if(idChkCnt == 0){
			alert("아이디 중복체크를 해주세요");
			document.getElementById("idChk").focus();
			return;
		}
		if(idChkbool == false){
			alert("유효한 아이디를 입력하세요");
			document.getElementById("idChk").focus();
			return;
		}
		if(hpLength < 13){
			alert("휴대폰번호를 확인해주세요");
			document.getElementById("hp").focus();
			return;
		}
		if(auth === "0"){
    		alert("이메일 인증을 진행해 주세요");
    		return;
    	}
    	const inputCode = $('#certification').val();
    	if(inputCode !== auth) {
			alert('인증번호가 불일치 합니다. 다시 확인해주세요.');
			document.getElementById("certification").focus();
			return;
		}
    	if(mailChkCnt == 0){
    		alert("이메일 인증을 진행해 주세요");
    		return;
    	}
		document.getElementById("id").removeAttribute('disabled');
		frm.action = "register.do"
		frm.method = "post";
		frm.submit();
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">회원가입</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <!-- <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Free Quote</li>
                </ol> -->
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- 회원가입 Start -->
    <div class="container-fluid bg-light overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container quote px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 ps-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute img-fluid w-100 h-100" src="resources/img/signup.jpg" style="object-fit: cover;" alt="">
                    </div>
                </div>
                <div class="col-lg-6 quote-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                        <div class="section-title text-start">
                            <h1 class="display-5 mb-4">회원가입</h1>
                        </div>
                        <p class="mb-4 pb-2"></p>
                        <form method="post" autocomplete="off">
                            <div class="row g-3">
                                <div class="col-12 col-sm-6">
                                    <input type="text" id="id" name="id" class="form-control border-0" placeholder="아이디  6~12자리" onkeydown="chkSpace()" title="아이디 " maxlength="12" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="button" id="idChk" value="아이디 중복체크" onclick="idChkGo()" class="btn btn-primary w-100 py-3" placeholder="아이디"  style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="password" id="pwd1" name="password" class="form-control border-0" onkeydown="chkSpace()" placeholder="패스워드 영문, 숫자  6~12자리" title="패스워드 영문, 숫자  6~12자리" maxlength="12" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="text" id="pwdChk1" name="pwdChk1" class="form-control border-0 bg-light" value="" style="height: 55px;" disabled="disabled">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="password" id="pwd2" name="pwd2" class="form-control border-0" onkeydown="chkSpace()" placeholder="패스워드확인" title="패스워드확인" maxlength="12" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="text" id="pwdChk2" name="pwdChk2" class="form-control border-0 bg-light" value="" style="height: 55px;" disabled="disabled">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="text" name="name" class="form-control border-0" placeholder="이름" onkeydown="chkSpace()" style="height: 55px;" title="이름">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="text" id="hp" name="hp" class="form-control border-0" oninput="autoHyphen2(this)" maxlength="13" placeholder="휴대폰 번호" title="휴대폰 번호"  style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-2">
                                    <select id="gender" name="gender" class="form-select border-0" title="성별" style="height: 55px;">
                                        <option title="성별" selected disabled="disabled">성별</option>
                                        <option title="성별" value="m">남자</option>
                                        <option title="성별" value="w">여자</option>
                                    </select>
                                </div>
                                <div class="col-12 col-sm-3">
                                	<select name="yy" class="form-select border-0" style="height: 55px;" id="year" title="생년월일">
                                		<option selected disabled="disabled">년</option>
                                	</select>
                                </div>
                                <div class="col-12 col-sm-2">
                                	<select name="mm" class="form-select border-0" style="height: 55px;" id="month" title="생년월일">
                                		<option selected disabled="disabled">월</option>
                                	</select>
                                </div>
                                <div class="col-12 col-sm-2">
                                	<select name="dd" class="form-select border-0" style="height: 55px;" id="day" title="생년월일">
                                		<option selected disabled="disabled">일</option>
                                	</select>
                                </div>
                                <div class="col-12 col-sm-3">
                                	 <input type="text" class="form-control border-0" disabled="disabled" placeholder="성별 / 생년월일"  style="height: 55px;">
                                 </div>
                                <div class="col-12 col-sm-6">
                                	 <input type="text" class="form-control border-0" id="postcode" disabled="disabled" placeholder="우편번호" title="주소"  style="height: 55px;">
                                 </div>
                                 <div class="col-12 col-sm-6">
                                	 <input type="button" class="btn btn-primary w-100 py-3" onclick="execDaumPostcode()" value="우편번호 찾기" style="height: 55px;" >
                                 </div>
                                <div class="col-12">
									<input type="text" name="firstAaddress" class="form-control border-0" id="firstAaddress" readonly placeholder="주소" title="주소"  style="height: 55px;">
                                </div>
                                <div class="col-12">
									<input type="text" name="detailAddress" class="form-control border-0" id="detailAddress" placeholder="상세주소" title="상세주소" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-5">
                                     <input type="text" name="email1" class="form-control border-0" id="emailId" value="" onkeydown="chkSpace()" placeholder="이메일 입력" title="이메일" style="height: 55px;"> 
                                </div>
                                <div class="col-12 col-sm-1" >
                                	<input type="text" name="at" class="form-control border-0 bg-light" value="@" disabled="disabled" style="height: 55px; font-size: 0.8em;">
                                </div>
                                <div class="col-12 col-sm-3">
									<input id="textEmail" name="directly" class="form-control border-0" placeholder="이메일을 선택하세요." onkeydown="chkSpace()" autocomplete="off" title="이메일" style="height: 55px;">
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
								</div>
								<div class="col-12 col-sm-6" >
				                    <input type="button" class="btn btn-primary w-100 py-3" onclick="mailAuth(this.form)" value="메일 인증번호 받기">
				                </div>
		                        <div class="col-12 col-sm-6" >
				                    <input type="number" id="certification" class="form-control border-0" onclick="chkSpace()" value="" placeholder="인증번호 입력" style="height: 55px;">
				                </div>
		                        <div class="col-12" >
		                        	<input type="hidden" id="address" name="address" value="">
		                        	<input type="hidden" id="email" name="email" value="">
		                        	<input type="hidden" id="birth" name="birth" value="">
		                            <input type="button" class="btn btn-primary w-100 py-3" onclick="registerGo(this.form)" value="가입">
		                        </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 회원가입 End -->
        

	<!-- Footer 인클루드 -->
	<jsp:include page="/WEB-INF/views/include_f.jsp"/>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i class="bi bi-arrow-up"></i></a>
	
	<!-- 다음 우편번호 시작 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="resources/js/address.js"></script>
	<!-- 다음 우편번호 끝 -->

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