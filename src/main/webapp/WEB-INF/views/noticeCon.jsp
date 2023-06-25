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
	table{margin-left: 10%;  width: 80%; font-size: 1.2rem; } 
	th, td{ padding: 5px 5px;}
	th{background-color: #B68559;}
	.title{width: 80%; font-size: 1.7rem; background-color: #B68559; border: none;}
	.title:focus{outline: none; resize: none;}
	.content{border: 1px solid #B68559; resize: none;}
	.button{color: #B68559; border: none; height: 30px; background-color: white; font-weight: bold;}
	.editable {width: 100%; height: auto; overflow-y: auto;}
	.bar{width: 20%;}
	
</style>
<script>
	window.onload=function() { //관리자여부 확인
		$('.editable').each(function(){ //위지윅에디터
    	    this.contentEditable = false;
    	});
		if ("${user.id}" != 'admin') { //관리자 아닐때
			$('.update').attr('style', "display:none;");
		}else {
			return;
		}
	}

	function update(frm) { //수정 시작
		alert("수정하세요.");
		frm.action = "noticeWrite.do";
		frm.submit();
	}
	
	function deleteOK(frm) { //삭제 실행
		let result = confirm("삭제 하시겠습니까?");
		if(result == true){
			alert("삭제 되었습니다.");
			frm.action = "deleteOK.do";
			frm.submit();
		}else {
			return;
		}
	}
</script>
<body>
    <!-- Spinner Start -->
<!--     <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
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
            <h1 class="display-3 text-white mb-3">공지사항 상세보기</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            <!--     <ol class="breadcrumb">
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
                	<form>
                	<table>
                		<tr>
                			<th><input type="hidden" name="noticeNum" value="${noticeOne.noticeNum }">
                				<input type="hidden" name="notiContent" id="notiContent" value="${noticeOne.notiContent }"></th>
                			<th class="title" colspan="2"><input type="text" name="noticeTitle" class="title" readonly="readonly" value="${noticeOne.noticeTitle }"></th>
                			<th colspan="3" class="bar">${fn:substring(noticeOne.notiDate,0,11)}</th>
                		</tr>
                		<tr>
                			<td class="content" colspan="6"><div class="editable" contenteditable="true">${noticeOne.notiContent }</div></td>
                		</tr>	
                		<tr>
                			<td colspan="3"></td>
							<td>
								<input class="button update" type="button" value="수정" onclick="update(this.form)">
							</td>
							<td>
								<input class="button update" type="button" value="삭제" onclick="deleteOK(this.form)">
							</td>
							<td>
								<input class="button" type="button" value="목록" onclick="location.href='notice.do'">
							</td>
						</tr>
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