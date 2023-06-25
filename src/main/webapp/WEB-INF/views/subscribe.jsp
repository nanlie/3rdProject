<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>${day}일구독</title>
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
    <style>
    	.menuBox{
    		height: 400px; 
    		width: 300px;
    	}
    </style>
    <script>
    function checkId(price){
    	let id = '${user.id}';
		if(id == ''){
			alert("로그인 후 구독 가능 합니다.");
			location.href = "loginGo.do?";
		}else{
			location.href='choiceMenu.do?day=${day}&subType='+price;
		}
    }
	//Ajax 요청처리에 의해 데이터 가져와서 화면에 표시
	window.onload = function(){
		menuType(6000,'Good 메뉴');
	}
	function menuType(price,name){
		$("#menuName").html(name);
		
		var type = "";
		let url = "getJsonMenuType.do?menuType="+price;

		$.ajax(url,{
			type: "get",
			dataType: "json", // 응답받을 데이터 타입
			success: function(respData){
				type = respData
				console.log(type);
				let dispHtml = "";
     				$.each(respData, function(index, menu){
     					dispHtml += "<div class='col-lg-3 col-md-6 wow fadeInUp' >";
     					dispHtml += "<div class='team-item'>";
     					dispHtml += "<div class='overflow-hidden position-relative text-center border border-5 border-light p-4 menuBox'>";
     					dispHtml += "<a href ='viewDetail.do?menuId="+this.menuId+"'><img class='img-fluid' src='resources/forMeImg/작은/"+this.thumbnail+"'> </a>";
     					dispHtml += "<div class='text-center' style=''>";
     					dispHtml += "<h5 class='mb-0'><br>"+this.menuName+"</h5>";
     					dispHtml += "</div>";
     					dispHtml += "</div>";
     					dispHtml += "</div>";
     					dispHtml += "</div>";
     				});
     					dispHtml += " <button class='btn btn-primary py-3 px-5' onclick= 'checkId("+price+")' >메뉴 고르러 가기&nbsp;&nbsp;=͟͟͞͞Ꙭ̮</button>";
     				$("#menuType").html(dispHtml);
			},
			error: function(){
				alert("실패");
			}
		});
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">${day}일 구독</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb">
                	<!--뭐 넣을까-->
<!--                     <li class="breadcrumb-item"><a class="text-white" href="#">3일 구독</a></li> -->
                    <li class="breadcrumb-item" style = "font-size:30px;"><a class="text-white" href="subscribe.do?day=${oDay }&oDay=${day}"  >${oDay }일 구독</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    <!-- 3일구독 -->
<div class="container-xxl py-5">
        <div class="container">
            <h1  style = "font-size:40px;">${day }일구독</h1>
            <c:set var="6000" value="${menuThumSix }" />
            <c:if test="${day eq 3 }">
             <a href="javascript:menuType(6000,'Good 메뉴')" class="btn btn-primary py-3 px-5">Good 메뉴&nbsp;&nbsp;(18,000원)</a>
             <a href="javascript:menuType(8000,'Awesome 메뉴')" class="btn btn-primary py-3 px-5">Awesome 메뉴&nbsp;&nbsp;(24,000원)</a>
             <a href="javascript:menuType(10000,'Excellent 메뉴')" class="btn btn-primary py-3 px-5">Excellent 메뉴&nbsp;&nbsp;(30,000원)</a>
             </c:if>
            <c:if test="${day eq 5 }">
             <a href="javascript:menuType(6000,'Good 메뉴')" class="btn btn-primary py-3 px-5">Good 메뉴&nbsp;&nbsp;(29,000원)</a>
             <a href="javascript:menuType(8000,'Awesome 메뉴')" class="btn btn-primary py-3 px-5">Awesome 메뉴&nbsp;&nbsp;(39,000원)</a>
             <a href="javascript:menuType(10000,'Excellent 메뉴')" class="btn btn-primary py-3 px-5">Excellent 메뉴&nbsp;&nbsp;(49,000원)</a>
             </c:if>
             <div class="container-xxl py-5">
        <div class="container">
            <div class="section-title text-center">
                <h1 class="display-5 mb-5" id="menuName">6000원 메뉴</h1>
            </div>
            <!--1 -->
            <div class="row g-4" id="menuType">
            <!-- 메뉴 넣기 -->
                
            <!-- 메뉴 넣기 -->
            <!--1 -->
       	 </div>
    </div>
  </div>
 </div>
 </div>
    <!-- Service End -->


   

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