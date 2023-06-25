<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>ForME : Notice</title>
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
	table{margin-left: 3%; margin-right: 3%; text-align: center;  width: 70%; font-size: 1rem; } 
	th, td{ padding: 2px 2px;}
	th{background-color: #B68559;}
	textarea{border: none; resize: none;}
	#title{width: 100%; font-size: 1rem; background-color: #B68559; border: none;}
	.texts:focus{outline: none;}
	.content{border: 1px solid #B68559;}
</style>
<script>
window.onload=function() { //관리자여부 확인
	$('.editable').each(function(){ //위지윅에디터
	    this.contentEditable = false;
	});
}
</script>
<body>
    <!-- Page Header Start -->
    <div>
            <h1 style="text-align:center;">공지사항</h1>
    </div>
    <!-- Page Header End -->

    <!-- Projects Start -->
    <div>
        <div>
            <div>
                <div>
                	<form action="noticePopup" method="get">
                	<table>
                		<tr>
                			<th class="title"><input type="text" name="noticeTitle" class="texts" id="title" readonly="readonly" value=" ${noticeOne.noticeTitle }"></th>
                			<th>${noticeOne.name }</th>
                			<th colspan="3">${fn:substring(noticeOne.notiDate,0,11)}</th>
                		</tr>
                		<tr>
                			<td class="content" colspan="6"><div class="editable" contenteditable="true">${noticeOne.notiContent }</div></td>
                		</tr>
						<tr>
							<td colspan="4" class="buttonGroup" id="buttonGroup2">
							</td>
                		</tr>
                	</table>
                	</form>
                </div>
            </div>
            </div>
        </div>
    <!-- Projects End -->
        
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