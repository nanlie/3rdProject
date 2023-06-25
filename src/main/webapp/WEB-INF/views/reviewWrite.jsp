<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>for味</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="resources/img/favicon.ico" rel="icon">

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
</head>

<style>
	.md-3{width:1140px;}
	#myform{
		width: 1000px;
		margin: 0px auto;
		padding: 50px 0;
		text-align: center;
		padding-bottom: 240px;
	}
	#myform input[type=radio]{display: none;}
	#myform label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	    margin:0;
	}
	#myform label:hover{text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);}
	#myform label:hover ~ label{ text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);}
	#myform input[type=radio]:checked ~ label{text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);}
	#myform>div{padding-bottom: 50px;}
	
	#myform fieldset{
	    display: inline-block;
	    direction: rtl;
	    border:0;
	}
	#myform fieldset legend{text-align: right;}
	#reviewContents {
	    width: 50%;
	    height: 150px;
	    padding: 10px;
	    box-sizing: border-box;
	    border: solid 1.5px #D3D3D3;
	    border-radius: 5px;
	    font-size: 16px;
	    resize: none;
	}
	.text-bold{ font-size: 1.5rem;}
	.butt{background-color: #B68559; border: none; color: white; width: 100px; height: 50px; font-size: 2rem}
	.img{width: 130px; height: 130px;}
	table {margin-left: 23%;  width: 60%; border-collapse: collapse; font-size: 1.3rem; }
</style>

<script>

	
	function wriRevOK() {
		let points = reviewData.points.value;
		let comments = reviewData.comments.value;
		let reviewNum = ${reviewsList.reviewNum};
		let myNum = ${reviewsList.myNum};
		
		if (points == "") {
			alert("별점을 선택해주세요");
			return;
		}
		if (comments == "") {
			alert("내용을 입력해주세요");
			return;
		}
		if (comments.length > 200) {
			alert("200자 이내로 작성해 주세요");
			return;
		}
		
		alert("작성되었습니다.");
		location.href="wriRevOK.do?points="+points+"&comments="+comments+"&reviewNum="+reviewNum+"&myNum="+myNum;
	}
	
</script>

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
            <h1 class="display-3 text-white mb-3 animated slideInDown">리뷰 쓰기</h1>
         	<ol class="breadcrumb">
          		<li class="breadcrumb-item"><p class="text-white"></p></li>
            </ol>
            <nav aria-label="breadcrumb animated slideInDown">
                <!-- <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">review</li>
                </ol> -->
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
	<form class="md-3" name="reviewData" id="myform" method="post">
 	<table>
 		<tr>
	 		<td rowspan="2" class="text-bold"><img alt="이미지" src="resources/forMeImg/thumb/${reviewsList.thumbnail }" class="img"></td>
	 		<td class="text-bold"><h3>${reviewsList.menuname }</h3></td>
 		</tr>
 		<tr>
	 		<td>
		<fieldset name="points">
			<input type="radio" name="points" value="5" id="rate1"><label
				for="rate1">★</label>
			<input type="radio" name="points" value="4" id="rate2"><label
				for="rate2">★</label>
			<input type="radio" name="points" value="3" id="rate3"><label
				for="rate3">★</label>
			<input type="radio" name="points" value="2" id="rate4"><label
				for="rate4">★</label>
			<input type="radio" name="points" value="1" id="rate5"><label
				for="rate5">★</label>
			<br>
		</fieldset>
	 		</td>
 		</tr>
 	</table>
		<div>
			<textarea class="col-auto" name="comments"  id="reviewContents" placeholder="좋은 리뷰를 남겨주시면 큰 힘이 됩니다!">${reviewsVO.comments }</textarea>
		</div>
		<div>
			<input type="button" class="butt" onclick="wriRevOK()" value="작성">	
			<input type="button" class="butt" onclick="history.back()" value="취소" />
		</div>
	</form>	

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