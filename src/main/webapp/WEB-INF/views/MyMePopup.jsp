<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="resources/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">
</head>
<style>
table {
	margin-left: 3%;
	margin-right: 3%;
	width: 70%;
	font-size: 1rem;
}

th, td {
	padding: 2px 2px;
}

th {
	background-color: #B68559;
}

textarea {
	border: none;
	resize: none;
}

#title {
	width: 100%;
	font-size: 1rem;
	background-color: #B68559;
	border: none;
}

.texts:focus {
	outline: none;
}

.content {
	border: 1px solid #B68559;
}
</style>
<script>
	
</script>
<body>
	<!-- Page Header Start -->
	<div>
		<h1 style="text-align: center;">MyMe 사용법 안내</h1>
	</div>
	<!-- Page Header End -->

	<!-- Projects Start -->
	<div>
		<div>
			<div>
				<div>
					<form action="noticePopup" method="get">
						<table style="margin: 0 auto;">
							<tr>
								<th class="title"><input type="text" name="noticeTitle"
									class="texts" id="title" readonly="readonly"
									value=" ${noticeOne.noticeTitle }"></th>
								<th colspan="3"></th>
							</tr>
							<tr>
								<td class="content" colspan="6"><div class="editable"
										contenteditable="true">
										<ul>
											<li>메뉴를 바꾸고 싶은 배송일로 변경하십시오. (단, 현재 날짜가 배송일로 부터 3일 전이거나,
												변경전 배송일로 부터 2주내로만 변경하 실 수 있습니다.)</li>
											<li>원하시는 날짜로 메뉴를 드래그해서 옮긴 후 메뉴를 클릭하면 해당 날짜로 배송일이 변경됩니다.</li>
											<li>변경하고자 하는 배송일이 다음달이신 경우 하단의 공간에 메뉴를 드래그해놓은신 후 다음 달로
												달력을 넘기고 위에 과정을 반복하시면 됩니다.</li>
										</ul>
									</div></td>
							</tr>
							<tr>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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