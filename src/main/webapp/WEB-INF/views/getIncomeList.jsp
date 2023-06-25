<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>INCOME LIST</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="resources/js/getIncomeList_date.js" defer="defer"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
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
<link href="resources/css/style2.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/28346e854f.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" defer="defer">
	function searchFunction() {
		let getChart = document.querySelector('#chart_div');
		console.log("getChart : " + getChart);
		while (getChart.childElementCount >= 1) {
			getChart.removeChild(getChart.lastChild);
		}
		console.log('$("#incomeYear option:selected").val() : '
				+ $("#incomeYear option:selected").val());
		console.log('$("#incomeMonth option:selected").val() : '
				+ $("#incomeMonth option:selected").val());
		if ($("#incomeYear").val() == null) {
			alert("년도를 선택해주세요.");
			$("#incomeYear").focus();
		}

		if ($("#incomeYear option:selected").val() != null
				&& $("#incomeMonth option:selected").val() == 0) {
			$.ajax("getJsonIncome.do?incomeYear="
					+ $("#incomeYear option:selected").val(), {
				type : "get",
				dataType : "json",
				success : function(respData) {
					console.log("respData : " + respData);
					google.charts.load('current', {
						'packages' : [ 'bar' ]
					});
					google.charts.setOnLoadCallback(drawChart);

					function drawChart() {
						var data = google.visualization.arrayToDataTable([
								[ 'MONTH', 'Sale' ], [ '1월', respData.m1 ],
								[ '2월', respData.m2 ], [ '3월', respData.m3 ],
								[ '4월', respData.m4 ], [ '5월', respData.m5 ],
								[ '6월', respData.m6 ], [ '7월', respData.m7 ],
								[ '8월', respData.m8 ], [ '9월', respData.m9 ],
								[ '10월', respData.m10 ],
								[ '11월', respData.m11 ],
								[ '12월', respData.m12 ] ]);

						var options = {
							chart : {
								title : 'Company Performance',
								subtitle : 'Year : '
										+ $("#incomeYear option:selected")
												.val() + ' total : '
										+ respData.total.toLocaleString(),
							},
							bars : 'vertical',
							vAxis : {
								format : 'decimal'
							},
							height : 400,
							colors : [ '#1b9e77', '#d95f02', '#7570b3' ]
						};

						var chart = new google.charts.Bar(document
								.getElementById('chart_div'));

						chart.draw(data, google.charts.Bar
								.convertOptions(options));
					}
				},
				error : function() {
					/* alert("받아오기 실패"); */
				}
			});
		} else if ($("#incomeYear option:selected").val() != null
				&& $("#incomeMonth option:selected").val() != 0) {
			$.ajax("getJsonIncomeList.do?incomeYear="
					+ $("#incomeYear option:selected").val() + "&incomeMonth="
					+ $("#incomeMonth option:selected").val(), {
				type : "get",
				dataType : "json",
				success : function(respData) {
					let dataLength = Object.keys(respData).length;
					let total = 0;
					console.log("respData : " + respData);
					console.log("Object.keys(respData) : "
							+ Object.keys(respData));
					console.log("dataLength : " + dataLength);
					console.log("respData[0].menuId.toString() : "
							+ respData[0].menuId.toString())
					google.charts.load('current', {
						'packages' : [ 'bar' ]
					});
					google.charts.setOnLoadCallback(drawChart);

					function drawChart() {
						var data = new google.visualization.DataTable();
						data.addColumn('string', 'MENU');
						data.addColumn('number', 'Sale');
						arr = [];
						for (var i = 0; i < dataLength; i++) {
							arr.push([ respData[i].menuname,
									respData[i].subType ]);
							total += respData[i].subType
							// years, months, days, weights에 나열한 데이터를 가지고 arr를 생성한다.
							// arr = [new Date(연, 월, 일), 체중기록]
							// arr에 담긴 데이터가 그래프에 반영되도록 한다.
						}
						console.log("arr : " + arr);
						data.addRows(arr);
						/*  var data = google.visualization.arrayToDataTable([
						     ['MENU', 'Sales'],
						     [respData[i].menuId, respData[i].subType]
						   ]); */

						var options = {
							chart : {
								title : 'Company Performance',
								subtitle : 'Year : '
										+ $("#incomeYear option:selected")
												.val()
										+ ' Month : '
										+ $("#incomeMonth option:selected")
												.val() + ' total : '
										+ total.toLocaleString(),
							},
							bars : 'vertical',
							vAxis : {
								format : 'decimal'
							},
							height : 400,
							colors : [ '#1b9e77', '#d95f02', '#7570b3' ]
						};

						var chart = new google.charts.Bar(document
								.getElementById('chart_div'));

						chart.draw(data, google.charts.Bar
								.convertOptions(options));
					}
				},
				error : function() {
					/* alert("받아오기 실패"); */
				}
			});
		}
	} /* Function End */
		window.onload = function() {
			searchFunction();
		}
</script>
</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Spinner End -->


	<!-- 탑바, 네비바 인클루드 -->
	<jsp:include page="/WEB-INF/views/include_h.jsp" />


	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-5">
		<div class="container py-5">
			<h1 class="display-3 text-white mb-3 animated slideInDown">매출내역관리</h1>
			<!-- <nav aria-label="breadcrumb animated slideInDown">
                 <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Free Quote</li>
                </ol>
            </nav> -->
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Quote Start -->
	<div class="container-fluid bg-light overflow-hidden px-lg-0"
		style="margin: 6rem 0;">
		<div class="container quote px-lg-0">
			<div class="row g-0 mx-lg-0 order-box">
				<div class="row g-3 order-box">
					<div class="income-container">
						<select class="date-bar-income" id="incomeYear" name="deliOk">
							<!-- <option disabled selected value="0">년</option> -->
						</select> 
						<select class="date-bar-income" id="incomeMonth" name="deliOk">
							<option selected value="0">월</option>
							<c:forEach var="i" begin="1" end="12">
								<option value="${i}">${i}월</option>
							</c:forEach>
						</select>
						<button class="btn-search-income" onclick="searchFunction()">매출조회</button>
					</div>
					<div id="chart_div"></div>


				</div>
			</div>
			<!--                     </div>
                </div>
                -->
		</div>
	</div>
	<!-- Quote End -->


	<!-- Footer 인클루드 -->
	<jsp:include page="/WEB-INF/views/include_f.jsp" />

	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i
		class="bi bi-arrow-up"></i></a>


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