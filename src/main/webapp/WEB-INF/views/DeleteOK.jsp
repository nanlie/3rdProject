<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
<meta charset="UTF-8">
<title>for味</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="resources/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">


<style>
#position {
	margin: 0 auto;
}

#side {
	position: relative;
	left: 48px;
	top: 00px;
	float: left;
	display: inline;
	z-index: 1;
}

#sss {
	position: relative;
}
</style>


</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Spinner End -->
	<!-- 탑바, 네비바 인클루드 -->
	<jsp:include page="/WEB-INF/views/include_h.jsp"/>
	<!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">나의 味</h1>
         	<ol class="breadcrumb">
          		<li class="breadcrumb-item"><p class="text-white"></p></li>
            </ol>
            <nav aria-label="breadcrumb animated slideInDown">
               <ol class="breadcrumb">
                    <li class="breadcrumb-item"><<a class="text-white" href="UpdateOK.do">회원 정보 수정</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="MyList.do">결제내역 보러 가기</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="MyMe.do">나의 식단 보러 가기</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page"><strong>회원 탈퇴</strong></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


	<!-- <div id="side"
		class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
		data-wow-delay="0.3s">
		<div class="rounded overflow-hidden">
			<h5 class="lh-base mb-0">
				<table>
					<tr>
						<td><a href="UpdateOK.do">회원 정보 수정</a></td>
					</tr>
					<tr>
						<td><a href="DeleteOK.do">회원 탈퇴</a></td>
					</tr>
					<tr>
						<td><a href="MyList.do">결제내역 보러 가기</a></td>
					</tr>
					<tr>
						<td><a href="MyMe.do">나의 식단 보러 가기</a></td>
					</tr>

				</table>
		</div>
	</div> -->


	<!-- 메뉴 뿌리기 시작 -->
	<div class="container-xxl py-5" style="display: flex;">
		<div class="container">
			<div class="section-title text-center" id="sss">
				<h1 class="display-5 mb-5">회원 탈퇴</h1>
			</div>


			<div id="position"
				class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
				data-wow-delay="0.3s">
				<div class="rounded overflow-hidden">
					<div class="position-relative overflow-hidden"></div>
					<div class="border border-5 border-light border-top-0 p-4"
						style="overflow: hidden;">
						<h5 class="lh-base mb-0">
							<form action="Delete.do" method="post">
								<ul>
									<h4>회원탈퇴를 위한 비밀번호를 입력해주세요.</h4>
									<input type="text" name="password">
								</ul>
								<button type="submit" style="float: right;">회원탈퇴</button>
							</form>
					</div>
				</div>
			</div>
			<div></div>
		</div>
	</div>
	</div>
	<!-- 메뉴 뿌리기 끝 -->




	<!-- Footer 인클루드 -->
	<jsp:include page="include_f.jsp" />

	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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