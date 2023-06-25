<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script>
function popup(){
	window.open("http://localhost:8080/me/noticePopup.do?noticeNum=22","popup","width=650, height=700,left=200,top=0");
	//window.open("noticePopup.do?noticeNum=22","popup","width=650, height=700,left=200,top=0");
	//window.open("http://localhost:8080/me/noticeCon.do?noticeNum=22","popup","width=650, height=700,left=200,top=0");
}
</script>
</head>

<body onload="popup()">
    <!-- Spinner Start
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    Spinner End -->

<!-- 탑바, 네비바 인클루드 -->
<jsp:include page="./include_h.jsp"/>
    <!-- 슬라이드 Start -->
    <div class="container-fluid p-0 pb-5">
        <div class="owl-carousel header-carousel position-relative">
            <div class="owl-carousel-item position-relative">
                <img class="img-fluid" src="resources/img/carousel-1.jpg" alt="">
                <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(53, 53, 53, .7);">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-12 col-lg-8 text-center">
                                <h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome To for 味</h5>
                                <h1 class="display-3 text-white animated slideInDown mb-4">For Me 를  위한 For 味</h1>
                                <p class="fs-5 fw-medium text-white mb-4 pb-2">소중한 나만을 위한 건강하고 든든한 한 끼 식사 <br>편하게 그리고 새롭게.</p>
                                <a href="#menu" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">메뉴 보기</a>
                                <a href="#day" class="btn btn-light py-md-3 px-md-5 animated slideInRight">설명 보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="owl-carousel-item position-relative">
                <img class="img-fluid" src="resources/img/carousel-2.jpg" alt="">
                <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(53, 53, 53, .7);">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-12 col-lg-8 text-center">
                                <h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome To for 味</h5>
                                <h1 class="display-3 text-white animated slideInDown mb-4">For Me 를  위한 For 味</h1>
                                <p class="fs-5 fw-medium text-white mb-4 pb-2">건강한 식단과 맛까지 신경쓰는 For Me를 위해.</p>
                                <a href="#menu" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">메뉴 보기</a>
                                <a href="#day" class="btn btn-light py-md-3 px-md-5 animated slideInRight">설명 보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="owl-carousel-item position-relative">
                <img class="img-fluid" src="resources/img/carousel-3.jpg" alt="">
                <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(53, 53, 53, .7);">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-12 col-lg-8 text-center">
                                <h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome To for 味</h5>
                                <h1 class="display-3 text-white animated slideInDown mb-4">이 달의 For 味</h1>
                                <p class="fs-5 fw-medium text-white mb-4 pb-2">언제나 옳은 마성의 단짠 조합<br>연탄 바싹불고기 덮밥.</p>
                                <a href="#menu" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">메뉴 보기</a>
                                <a href="#day" class="btn btn-light py-md-3 px-md-5 animated slideInRight">설명 보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 슬라이드 End -->
    <!-- 메뉴 뿌리기 시작 -->
    <div class="container-xxl py-5">
    <a id="menu"></a>
        <div class="container">
            <div class="text-center">
                <h1 class="display-5 mb-5">이 달의 추천 menu❤️</h1>
            </div>
            <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    <ul class="list-inline mb-5" id="portfolio-flters">
                        <li class="mx-2 active" data-filter=".six">For 味  good</li>
                        <li class="mx-2" data-filter=".eight">For 味 awesome</li>
                        <li class="mx-2" data-filter=".ten">For 味 excellent</li>
                    </ul>
                </div>
            </div>
             <!-- 메뉴 뿌리기 시작 -->
            <div class="row g-4 portfolio-container">
                <div class="col-lg-4 col-md-6 portfolio-item six wow fadeInUp" data-wow-delay="0.1s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden border border-5 border-light p-4" style="height: 550px; width: 400px;">
                            <img class="img-fluid w-100" src="resources/forMeImg/thumb/N0021.jpg" alt="">
                            
                            <p class="text-primary fw-medium mb-2"><br>훈제오리주물럭덮밥</p>
                            <h5 class="lh-base mb-0">오리의 불포화지방산 몸에 얼마나 좋게요?</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item six wow fadeInUp" data-wow-delay="0.3s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden border border-5 border-light p-4" style="height: 550px; width: 400px;">
                            <img class="img-fluid w-100" src="resources/forMeImg/thumb/N0031.jpg" alt="">
                            <p class="text-primary fw-medium mb-2"><br>포크 소보루 나시고랭</p>
                            <h5 class="lh-base mb-0">포실포실 스크램블과 불 맛나는 돼지고기의 만남</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item six wow fadeInUp" data-wow-delay="0.5s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden border border-5 border-light p-4" style="height: 550px; width: 400px;">
                            <img class="img-fluid w-100" src="resources/forMeImg/thumb/C041.jpg" alt="">
                            <p class="text-primary fw-medium mb-2"><br>큐브 닭가슴살 샐러드(바질 오레인탈 드레싱)/블루베리 베이글 샌드</p>
                            <h5 class="lh-base mb-0">향긋한 바질드레싱으로 산뜻하게</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item eight wow fadeInUp" data-wow-delay="0.1s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden border border-5 border-light p-4" style="height: 550px; width: 400px;">
                            <img class="img-fluid w-100" src="resources/forMeImg/thumb/N0091.jpg" alt="">
                            <p class="text-primary fw-medium mb-2"><br>티아시아 키마 커리 덮밥</p>
                            <h5 class="lh-base mb-0">고기가 왜 이리 많아? 소스 반 고기 반이네?</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item eight wow fadeInUp" data-wow-delay="0.3s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden border border-5 border-light p-4" style="height: 550px; width: 400px;">
                            <img class="img-fluid w-100" src="resources/forMeImg/thumb/N0121.jpg" alt="">
                            <p class="text-primary fw-medium mb-2"><br>중화풍 유니짜장밥</p>
                            <h5 class="lh-base mb-0">부드러운 짜장 어떠세요?</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item eight wow fadeInUp" data-wow-delay="0.5s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden border border-5 border-light p-4" style="height: 550px; width: 400px;">
                            <img class="img-fluid w-100" src="resources/forMeImg/thumb/C061.jpg" alt="">
                            <p class="text-primary fw-medium mb-2"><br><br>허니리코타치즈 랩</p>
                            <h5 class="lh-base mb-0">산뜻한 치즈로 맛있는 한 끼 되세요</h5>
                        </div>
                    </div>
                </div>     
                <div class="col-lg-4 col-md-6 portfolio-item ten wow fadeInUp" data-wow-delay="0.1s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden border border-5 border-light p-4" style="height: 550px; width: 400px;">
                            <img class="img-fluid w-100" src="resources/forMeImg/thumb/N0181.jpg" alt="">
                            <p class="text-primary fw-medium mb-2"><br>소불고기 규동</p>
                            <h5 class="lh-base mb-0">불맛나는 규동으로 든든한 한 끼 되세요!</h5>
                        </div>
                    </div>
                </div>                                           
                <div class="col-lg-4 col-md-6 portfolio-item ten wow fadeInUp" data-wow-delay="0.3s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden border border-5 border-light p-4" style="height: 550px; width: 400px;">
                            <img class="img-fluid w-100" src="resources/forMeImg/thumb/N0201.jpg" alt="">
                            <p class="text-primary fw-medium mb-2"><br>한돈 곤드레나물 덮밥</p>
                            <h5 class="lh-base mb-0">돼지고기 하면 한돈! 믿고 든든한 한 끼 되세요</h5>
                        </div>
                    </div>
                </div>                                           
                <div class="col-lg-4 col-md-6 portfolio-item ten wow fadeInUp" data-wow-delay="0.5s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden border border-5 border-light p-4" style="height: 550px; width: 400px;">
                            <img class="img-fluid w-100" src="resources/forMeImg/thumb/C121.jpg" alt="">
                            <p class="text-primary fw-medium mb-2"><br>새우파마산샐러드</p>
                            <h5 class="lh-base mb-0">새우에 고소한 파마산을 넣어 가벼운 한 끼</h5>
                        </div>
                    </div>
                </div>                                           
            </div>
        </div>
    </div>
    <!-- 메뉴 뿌리기 끝 -->
    
    <!-- 일일별 식단 설명 보여주기 -->
    <a id="day"></a>
    <div class="container-xxl py-5">
    	<div class="container position-relative h-100">
	    	<div class="text-center">
	    		<h3 class="display-5 mb-5">요일 구성🎁</h3>
	    	</div>
	    	<div class="container" style="text-align: center;">
    		<a href="menuView.do">
    			<img src="resources/img/select_menu.jpg" style="margin : 0 auto;">
    		</a>
	    	</div>
    	</div>
    </div>
    <!-- 일일별 식단 설명 끝내기 -->


    <!-- 후기 뿌리기 시작 -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="text-center">
                <h1 class="display-5 mb-5">味 담🎉</h1>
            </div>
            <div class="owl-carousel testimonial-carousel">
            	<c:forEach var="review" items="${reviewsList}">
                <div class="testimonial-item text-center">
                    <div class="testimonial-text text-center p-4">
                    <p>후기:</p>
                        <p>${review.comments}</p>
                        <h5 class="mb-1">${review.name } 님</h5>
                        <span class="fst-italic">${review.menuname }</span> 
                    </div>
                </div>
	           </c:forEach>
            </div>
        </div>
    </div>
    <!-- 후기 뿌리기 끝 -->
    
	<!-- Footer 인클루드 -->
	<jsp:include page="./include_f.jsp"/>

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