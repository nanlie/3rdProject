<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>viewDetail</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

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
</head>
<style>
.bar-container {//회색바
width: 100%;
background-color: #f1f1f1;
text-align: center;
color: white;
border-radius: 5px;
}
.bar {//색깔 바
height: 20px;
background-color: #2196F3;
border-radius: 5px;
}
.info{
	padding : 3%;
	background-color: #FFF7EA;
	width: 80%;
	height: 120px;
}
.circle{
	background-color: antiquewhite;
	border-radius: 50%;
	width: 20%;
	padding-bottom: 20%;
	position: relative;
	float: right;
	transform: translate(-20%, -75%);
}
.percent{
	position: absolute;
	left: 21%;
	bottom: 20%;
	font-size: 2em;
	text-align: center;
	transform: translate(-10%, 10%);
}
.progress-bar{
    width: 100%;
    background-color: #dedede;
    border-radius: 10px;
    font-weight: 600px;
    font-size: .8rem;
}
.progress-bar-progress {
    padding: 6px;
    text-align: center;
    background-color: #FAD19D;
    color: #111; 
}
tr{
	height: 30px;
}
</style>

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
            <h1 class="display-3 text-white mb-3 animated slideInDown">메뉴상세보기</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="threeSub.do">3일구독</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="fiveSub.do">5일구독</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Quote Start -->
    <div class="container-fluid bg-light overflow-hidden px-lg-0" >
        <div class="container quote px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 ps-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100 menuImage">
                        <img class="show-img" src="resources/forMeImg/큰/${ viewDetail.menuImg}"style="object-fit: cover;" alt="">
                    </div>
                </div>
                <div class="col-lg-6 quote-text py-5 wow fadeIn" >
                    <div class="p-lg-5 pe-lg-0">
                        <div class="section-title text-start">
                            <h3 class="display-5 mb-4">${viewDetail.menuName}</h3>
                        </div>
                        <p class="mb-4 pb-2" style ="font-size:20px; font-weight:bold;">${viewDetail.mComment }</p>
                            <div class="row g-3">
                                	<div class = "info" >
                                		<h5 style ="font-weight: bold">味 영양정보</h5>
                                		<p> </p>
                                		 1일 섭취 권장 기준인 2,000kcal 중 <br>
										${viewDetail.calories } kcal 섭취할 수 있어요
										<div class = "circle">
										</div>
                                	</div>
                                	<div>
										<p>*개인의 성별, 연령, 체중, 활동량에 따라 차이가 있을 수 있습니다.</p>
										<div class = "progress-bar" id = "carbohydrate"></div>
										<div class = "progress-bar" id = "protein"></div>
										<div class = "progress-bar" id = "fat"></div>
										<div class = "progress-bar" id = "natrium"></div>
										</div>
									</div>
                            </div>
                    </div>
                </div>
            </div>
   	</div>
	<div  style = " text-align: center; display:inline-block; margin-left:34%; margin-top:5%;">
	 	<h1>${viewDetail.menuName}</h1><br>
	 	 <img src="resources/forMeImg/큰/${ viewDetail.menuImg}" alt="메뉴이미지" style = "width:400px; height:400px;">
		<p>*상기 이미지는 연출컷으로 실제와 다를 수 있습니다.</p><br>
		<table style = "table-layout: fixed; ">
			<tr style = "border-top: 1px solid #ddd; ">
				<th >칼로리</th>
				<th>중량</th>
			</tr>	
			<tr>
				<td>${ viewDetail.calories}</td>
				<td>${viewDetail.weight } </td>
			</tr>	
			<tr  style = "border-top: 1px solid #ddd; ">
				<th colspan="2">알레르기</th>
			</tr>	
			<tr>
				<td colspan="2">${viewDetail.allergy }</td>
			</tr>	
			<tr> </tr>
			<tr  style = "border-top: 1px solid #ddd; ">
				<th colspan="2">취식방법</th>
			</tr>	
			<tr>
				<td colspan="2">${viewDetail.recipe }</td>
			</tr>	
		</table>
		<br>
		<input type="button" class="btn btn-primary w-100 py-3" onclick="javascript:history.back()" value="뒤로가기">
	</div>				

    <!-- Quote End --> 
	<script>
		let kcal = Math.ceil(${viewDetail.calories}/2000*100);
		let carbo = Math.ceil(${viewDetail.carbohydrate }/324*100);
		let pro = Math.ceil(${viewDetail.protein }/54*100);
		let fat = Math.ceil(${viewDetail.fat }/55*100);
		let nat =Math.ceil(${viewDetail.natrium }/2000*100);
		
		let kcalE = '<h2 class = "percent">'+kcal+'%</h2>';
		
		let carboE = '<div class = "progress-bar-progress " Style = "width:'+carbo+'%"></div>';
		let carboP = '<span>탄수화물['+${viewDetail.carbohydrate }+'/324g]</span>';
		carboP += '<span style = "float:right">'+carbo+'%</span>';
		
		let proE =  '<div class = "progress-bar-progress " Style = "width:'+pro+'%"></div>';
		let proP =  '<span>단백질['+${viewDetail.protein }+'/54g]</span>';
		proP += '<span style = "float:right">'+pro+'%</span>';
		
		let fatE =  '<div class = "progress-bar-progress " Style = "width:'+fat+'%"></div>';
		let fatP = '<span>지방['+${viewDetail.fat }+'/55g]</span>';
		fatP+='<span style = "float:right">'+fat+'%</span>';
		
		let natE = '<div class = "progress-bar-progress " Style = "width:'+nat+'%"></div>';
		let natP = '<span>나트륨['+${viewDetail.natrium }+'/2000mg]</span>';
		natP+='<span style = "float:right">'+nat+'%</span>';
		
		 document.querySelector('.circle').insertAdjacentHTML('beforeend', kcalE);
		 document.querySelector('#carbohydrate').insertAdjacentHTML('beforeend', carboE);
		 document.querySelector('#carbohydrate').insertAdjacentHTML('beforebegin', carboP); 
		 document.querySelector('#protein').insertAdjacentHTML('beforeend', proE);
		 document.querySelector('#protein').insertAdjacentHTML('beforebegin', proP);
		 document.querySelector('#fat').insertAdjacentHTML('beforeend', fatE);
		 document.querySelector('#fat').insertAdjacentHTML('beforebegin', fatP);
		 document.querySelector('#natrium').insertAdjacentHTML('beforeend', natE);
		 document.querySelector('#natrium').insertAdjacentHTML('beforebegin', natP);
	</script>
        

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