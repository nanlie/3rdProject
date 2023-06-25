<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	table{margin-left: 20%;  width: 60%; border-collapse: collapse; font-size: 1.3rem;}
	.empty{margin-left: 35%}
	.backButt{margin-left: 70%}
	.center{width: 20%;}
	.sub {width: 40%;}
	.img{width: 100px; height: 100px;}
</style>

<script>
	function myRevClick() { //내리뷰보기
		location.href='reviewMe.do?id='+'${user.id}';
	}
	
	function delRev(revNum) { //리뷰삭제
		let result = confirm("삭제하시겠습니까?");
		if (result == true) {
			alert("삭제되었습니다.");
		location.href='delRev.do?reviewNum=' + revNum;
		}else {
			return;
		}
	}
	function upRev(frm) { //리뷰수정
		frm.action = "wriRev.do";
		frm.submit();
	}
	function writeRev(frm) { //리뷰쓰기
		frm.action = 'revPageGo.do';
		frm.submit();
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
 	<div class="text-center">
    	<br>
    </div>	
    
    <c:if test="${empty reviewsList}">
    	<div class="empty"><h2>리뷰 작성 가능한 상품이 없습니다</h2></div>
    </c:if>
	<c:forEach var="review" items="${reviewsList}">
    <form>
		<table>
			<thead>
				<tr>
					<th colspan="5"><hr></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="hidden" name="myNum" value="${review.myNum }">
					<input type="hidden" name="menuname" value="${review.menuname }">
					<input type="hidden" name="thumbnail" value="${review.thumbnail }"></td>
					<td class="center"><img alt="이미지" src="resources/forMeImg/thumb/${review.thumbnail }" class="img"></td>
					<td class="sub" >${review.menuname }</td>
					<td class="center">${fn:substring(review.delidate,0,11)} 배송</td>
					<td class="center"><input type="button" class="btn btn-primary" value="리뷰 작성하기" onclick="writeRev(this.form)"></td>
				</tr>	
				<tr>
					<td colspan="5"><hr></td>
				</tr>	
				<tr>
					<td colspan="4"></td>
				</tr>	
			</tbody>	
		</table>
		</form>
		</c:forEach>
					<div class="backButt"><input type="button" class="btn btn-primary" onclick="history.back()" value="뒤로가기" /></div> 

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