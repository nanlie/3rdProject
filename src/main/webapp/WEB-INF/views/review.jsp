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
	table{margin-left: 10%;  width: 70%; border-collapse: collapse; font-size: 1.3rem;}
	.center{width: 10%;}
	.sub {width: 50%;}
	.img{width: 100px; height: 100px;}
	ul{list-style: none; margin-left: 45%;}
	li{float: left;}
	.buttLine{text-align: right;}
	.button{color: #B68559; background-color:white; border: none; font-weight: bold;}
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
		frm.action = "revPageGo.do";
		frm.submit();
	}
	function writeRev() { //내리뷰보기
		location.href='wriRev.do?id='+'${user.id}';
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">리뷰 게시판</h1>
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
		<table>
			<tr>
				<th colspan="2"></th>
				<th colspan="3" class="buttLine">
					<c:if test="${not empty user.id && user.id ne 'admin'}" >
						<input type="button" class="btn btn-primary" value="내 리뷰 보기" onclick="myRevClick()">
						<input type="button" class="btn btn-primary" value="전체 리뷰 보기" onclick="location.href='review.do'">
						<input type="button" class="btn btn-primary" value="리뷰쓰기" onclick="writeRev()">
					</c:if>
				</th>
			</tr>
			<tr>
				<th colspan="5"><hr></th>
			</tr>
			<tr>
				<!-- <th class="center">번호</th> -->
				<th class="center"></th>
				<th class="center sub">내용</th>
				<th class="center">작성자</th>
				<th class="center">별점</th>
				<th class="center">작성일</th>
			</tr>
			<tr>
				<th colspan="5"><hr></th>
			</tr>
		</table>
		<c:forEach var="review" items="${reviewsList}">
	    <form>
		<table>
			<tr>
				<%-- <td class="center" rowspan="2">${review.reviewNum }</td> --%>
				<td class="center" rowspan="2"><a href="viewDetail.do?menuId=${review.menuId }"><img alt="이미지" src="resources/forMeImg/thumb/${review.thumbnail }" class="img"></a></td>
				<th class="center sub"><a href="viewDetail.do?menuId=${review.menuId }">${review.menuname }</a></th>
				<td class="center" rowspan="2">${review.name }</td>
				<td class="center" rowspan="2">
					<c:forEach begin="1" end="${review.points }" step="1">★</c:forEach>
				</td>
				<td class="center">${fn:substring(review.writeDate,0,11)}</td>
			</tr>	
			<tr>
				<td>${review.comments} </td>
				<c:set var="id" value="${review.id}" />
				<c:if test="${user.id eq review.id || user.id eq 'admin'}" >
					<td>
						<input type="hidden" name="menuId" value="${review.menuId }">
						<input type="hidden" name="menuname" value="${review.menuname }">
						<input type="hidden" name="thumbnail" value="${review.thumbnail }">
						<input type="hidden" name="reviewNum" value="${review.reviewNum }">
						<input type="hidden" name="comments" value="${review.comments}">
					<c:if test="${user.id eq review.id}">
						<input type="button" class="button" value="수정" onclick="upRev(this.form)">
					</c:if>
						<input type="button" class="button" value="삭제" onclick="delRev(${review.reviewNum})">
					</td>
				</c:if>
			</tr>
			<tr>
				<th colspan="5"><hr></th>
			</tr>	
		</table>
		</form>
		</c:forEach>
		<table>
			<tr>
				<td colspan="3">
					<ul>
					<%-- [이전으로]--%>
						<c:if test="${pVO.beginPage == 1 }">
							<li>이전</li>
						</c:if>
						<c:if test="${pVO.beginPage != 1 }">
							<li><a href="review.do?cPage=${pVO.beginPage - 1 }">이전</a></li>
						</c:if>
					<%-- [이전으로 끝]--%>
					<%-- 블록 --%>
						<c:forEach var="pageNo" begin="${pVO.beginPage }" end="${pVO.endPage }">
							<c:if test="${pVO.nowPage == pageNo }">
								<li> &nbsp; ${pageNo } &nbsp; </li>
							</c:if>
							<c:if test="${pVO.nowPage != pageNo }">
								<li><a href="review.do?cPage=${pageNo }"> &nbsp; ${pageNo } &nbsp; </a></li>
							</c:if>
						</c:forEach>
					<%--블록 끝 --%>
					<%-- [다음으로 끝] --%>
						<c:if test="${pVO.endPage >= pVO.totalPage }">
							<li>다음</li>
						</c:if>
						<c:if test="${pVO.endPage < pVO.totalPage }">
							<li><a href="review.do?cPage=${pVO.endPage + 1 }">다음</a></li>
						</c:if>
					<%-- [다음으로 끝] --%>
					</ul>
				</td>
			</tr>
		</table>
		<br>

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