<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MEMBER LIST</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
    <link href="resources/css/style2.css" rel="stylesheet">
     <script src="https://kit.fontawesome.com/28346e854f.js" crossorigin="anonymous"></script>
     <script type="text/javascript">
     	function searchFunction() {
     		$.ajax("getJsonMemberList.do?searchName="+$("#searchName").val(), {
     			type: "get",
     			dataType: "json",
     			success: function(respData) {
     				console.log(respData);
     				let dispHtml = "<ul class='menu-list'>"	
     				$.each(respData, function(index, member){
     					dispHtml += "<a href='adminGetMember.do?id="+ this.id +"'><li class='member-item'>";
     					if(this.gender == "m") {
     						dispHtml += '<p class="man"><i class="fa-solid fa-user"></i></p>'
     					} else if (this.gender == "w") {
     						dispHtml += '<p class="woman"><i class="fa-solid fa-user"></i></p>'
     					}
     					dispHtml += "<p>이름 : " + this.name + "</p>";
     					dispHtml += "<p>성별 : " + this.gender + "</p>";
     					dispHtml += "<p>생년월일 : " + this.birth + "</p>";
     					dispHtml += "<p>전화번호 : " + this.hp + "</p>";
     					dispHtml += "<p>가입날짜 : " + this.regDate + "</p>";
     					dispHtml += "</li></a>";
     				});
     				dispHtml += "</ul>";
     				$("#dispData").html(dispHtml);
     			},
     			error: function() {
     				alert("받아오기 실패");
     			}
     		});
     	}
     	window.onload = function () {
     		searchFunction();
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">회원 관리</h1>
           <!--<nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="display-6 text-white" href="insertMenu.do">메뉴등록 <i class="fa-solid fa-pen-to-square"></i></a></li>
                     <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Our Team</li> 
                </ol>
            </nav> -->
        </div>
    </div>
    <!-- Page Header End -->
    

	
    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="section-title text-center">
                <h1 class="display-5 mb-5">MEMBER LIST</h1>
            </div>
            <div class="search-box">
	            <div class="search-container">
					<input type="text" id="searchName"  size="30" placeholder="이름" onkeyup="searchFunction()"/>
					<button class="btn-search" onclick="searchFunction()"><i class="fa-solid fa-magnifying-glass"></i></button>
	            </div>
			</div>
            <div class="menu-container" id="dispData">
            <%-- <c:forEach var="menu" items="${menuList }">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item">
                        <div class="overflow-hidden position-relative">
                            <img class="img-fluid" src="resources/img/team-1.jpg" alt="">
                           <div class="team-social">
                                <a class="btn btn-square " href="">C&emsp;${menu.carbohydrate}</a>
                                <a class="btn btn-square " href="">P&emsp;${menu.protein }</a>
                                <a class="btn btn-square " href="">F&emsp;${menu.fat}</a>
                            </div>
                        </div>
                        <div class="text-center border border-5 border-light border-top-0 p-4">
                            <h5 class="mb-0">${menu.menuName}</h5>
                            <small>${menu.mComment}</small>
                        </div>
                    </div>
                </div>
            </c:forEach> --%>
            </div>
        </div>
    </div>
    <!-- Team End -->
        

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