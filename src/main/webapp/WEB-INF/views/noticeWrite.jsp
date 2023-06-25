<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
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
	table{margin-left: 10%; text-align: center; width: 70%;} 
	th, td{ padding: 5px 5px;}
	.title{width: 80%; text-align: left; font-size: 1.2rem;}
	.sideText{text-align: left; font-size: 1.2rem;}
</style>

<script>
	window.onload=function() {
		if ('${noticeVO.noticeNum}' != 0) {
			$('#title' ).attr( 'value', '${noticeVO.noticeTitle}' );
			$('#insert').attr('style', "display:none;");
		}else {
			$('#update').attr('style', "display:none;");
		}
	}
	
	function noticeWriteOK(frm) { //입력완료
		if (validate() == false)return false;//유효성검사
		
		alert("입력되었습니다.");
		frm.action = "noticeWtireOK.do";
		frm.submit();
	}
	
	function updateOK(frm) { //수정완료
		if (validate() == false)return false;//유효성검사
		
		alert("수정 완료되었습니다.");
		frm.action = "updateOK.do";
		frm.submit();
	}
	
	function validate() { //유효성검사 함수
		if (!document.write.noticeTitle.value) { //제목 미입력
			alert("제목을 입력하세요.");
			return false;
		}
		if (!editor.getData()) { //내용 미입력
			alert("내용을 작성하세요.");
			return false;
		}
	
		if(editor.getData().length > 800) {
			var msg = "등록오류\n등록가능한 글자수를 초과하였습니다.";
			alert(msg);
			return false;
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
            <h1 class="display-3 text-white mb-3">공지사항 작성</h1>
            <nav aria-label="breadcrumb animated slideInDown">
              <!--   <ol class="breadcrumb">
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
            <div class="text-center">
					<div>
	                	<div>
	                		<form name="write">
	                		<table>
	                			<tr>
	                				<th class="sideText">제목</th>
	                			</tr>
	                			<tr>
	                				<th class="title"><input type="text" size="70" name="noticeTitle" id="title" maxlength="21 placeholder="제목을 입력하세요" ></th>
	                			</tr>
	                			<tr>
	                				<th class="sideText">본문</th>
                				</tr>
                				<tr>
	                				<td class="title"><textarea rows="20" cols="70" name="notiContent" id="editor" placeholder="내용을 입력하세요">
	                				<c:if test="${noticeVO.noticeTitle ne null}">
	                					${noticeVO.notiContent}
	                				</c:if>
	                				</textarea></td>
	                			</tr>
	                			<tr><td colspan="2">
	                				<input type="hidden" name="noticeNum" value="${noticeVO.noticeNum }">
	                				<input type="button" id="insert" value="작성완료" class="btn btn-primary" onclick="noticeWriteOK(this.form)"> 
	                				<input type="button" id="update" value="수정완료" class="btn btn-primary" onclick="updateOK(this.form)"> 
	                				<input type="button" value="뒤로가기" class="btn btn-primary" onclick="history.back(-1)"></td></tr>
	                		</table>
	                		</form>
					
						<!-- 위지윅에디터 -->
						<script>
							let editor;
							ClassicEditor.create(document.querySelector('#editor'), {
								language : "ko"	,
							   	toolbar: {
				                    items: [
				                        'selectAll', 'heading', 'bold', 'italic', '|',
				                        'bulletedList', 'numberedList',  '|', 'outdent', 'indent', '|', 'undo', 'redo', '|', 
				                        'link', 'insertTable', 'mediaEmbed' 
				                    ],
				                    shouldNotGroupWhenFull: true
				                }
							})
							.then(newEditor => {
									editor = newEditor;
							})
							
						</script>
					</div>
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