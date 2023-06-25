<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	table{margin-left: 10%; text-align: center; width: 80%; border-collapse: collapse; font-size: 1.5rem;} 
	.button{color: #B68559; background-color:white; border: none; font-weight: bold;}
	.searchButton{color: white; background-color: #B68559; border: none; font-weight: bold;}
	.text{text-align: right;}
	.btnRight{text-align: right;}
	tbody{ border: 1px solid #B68559; }
	th, td{ padding: 5px 5px; margin: 0px;}
	th{background-color: #B68559;}
	.title{width: 60%}
	ul{list-style: none; margin-left: 35%;}
	li{float: left;}
</style>

<script>
	function NotReload(){ //새로고침 막기
	    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
	        event.keyCode = 0;
	        event.cancelBubble = true;
	        event.returnValue = false;
	    } 
	}
	document.onkeydown = NotReload;
	
	window.onload=function() { //관리자여부 확인
		if ("${user.id}" != 'admin') { //관리자 아닐때
			$('#write').attr('style', "display:none;");
		}
	}
	
</script>

<body>
    <!-- Spinner Start -->	
  <!--   <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div> -->
    <!-- Spinner End -->

<!-- 탑바, 네비바 인클루드 -->
<jsp:include page="/WEB-INF/views/include_h.jsp"/>

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3">공지사항</h1>
            <nav aria-label="breadcrumb animated slideInDown">
               <!--  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Project</li>
                </ol> -->
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Projects Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div>
                <div>
               		<form action="notice.do" method="get">
                	<table>
                		<thead>
	                		<tr>
	                			<td colspan="2"></td>
	                			<td class="text"><input type="text" size="5px" name="noticeTitle" >
	                			<button class="searchButton" onclick="searchFunction()"><i class="fas fa-search"></i></button></td>
	                		</tr>
                		</thead>
                		<tbody>
	                		<tr>
	                			<th class="title"> 제목</th>
	                			<th>글쓴이</th>
	                			<th>작성일자</th>
	                		</tr>
	                		<c:forEach var="notice" items="${noticeList}">
	                		<tr>
	                			<td><a href="noticeCon.do?noticeNum=${notice.noticeNum }">${notice.noticeTitle }</a></td>
	                			<td>${notice.name }</td>
	                			<td>${fn:substring(notice.notiDate,0,11)}</td>
	                		</tr> 
	                		</c:forEach>
               			</tbody>
						<tfoot>
                			<tr>
                				<td colspan="2" />	
               					<td class="btnRight"><input type="button" value="공지 작성" class="button" id="write" onclick="location.href='noticeWrite.do'"></td>
                			</tr>
							<tr>
								<td colspan="3">
									<ul>
									<%-- [이전으로]--%>
										<c:if test="${pVO.beginPage == 1 }">
											<li>이전</li>
										</c:if>
										<c:if test="${pVO.beginPage != 1 }">
											<li><a href="notice.do?cPage=${pVO.beginPage - 1 }">이전</a></li>
										</c:if>
									<%-- [이전으로 끝]--%>
									<%-- 블록 --%>
										<c:forEach var="pageNo" begin="${pVO.beginPage }" end="${pVO.endPage }">
											<c:if test="${pVO.nowPage == pageNo }">
												<li> &nbsp; ${pageNo } &nbsp; </li>
											</c:if>
											<c:if test="${pVO.nowPage != pageNo }">
												<li><a href="notice.do?cPage=${pageNo }"> &nbsp; ${pageNo } &nbsp; </a></li>
											</c:if>
										</c:forEach>
									<%--블록 끝 --%>
									<%-- [다음으로 끝] --%>
										<c:if test="${pVO.endPage >= pVO.totalPage }">
											<li>다음</li>
										</c:if>
										<c:if test="${pVO.endPage < pVO.totalPage }">
											<li><a href="notice.do?cPage=${pVO.endPage + 1 }">다음</a></li>
										</c:if>
									<%-- [다음으로 끝] --%>
									</ul>
								</td>
							</tr>
						</tfoot>
					</table>
                	</form>
                </div>
            </div>
            </div>
        </div>
    <!-- Projects End -->
        
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