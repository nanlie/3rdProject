<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<meta charset="UTF-8">
<title>for味</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- Favicon -->
<link href="resources/img/favicon.ico" rel="icon">

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






<style>
#calendar {
	display: flex;
	justify-content: center;
}

#position {
	text-align: center;
}

.container2 {
	margin: 10px;
	padding: 10px;
	background-color: #b5c1dc57;
	border-radius: 8px;
}

.draggable.dragging {
	opacity: 0.5;
}

#side {
	position: relative;
	left: 48px;
	top: 00px;
	float: left;
	display: inline;
	z-index: 1;
}

#sss {
	position: relative;
}

#move {
	display: inline-block;
	padding: 10px;
}

#calendar th {
	text-align: center;
}

#abc {
	font-size: larger;
	font-weight: bolder;
	color: red;
	text-align: center;
	padding: 5px 10px;
	caption-side: top;
}

#table {
	width: 100%;
	height: 100%;
}

#table, #table th, #table td {
	border: 1px solid #bcbcbc;
}

#table td {
	width: 150px;
	height: 70px;
}
</style>



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
	<jsp:include page="/WEB-INF/views/include_h.jsp"/>
	<!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">나의 味</h1>
         	<ol class="breadcrumb">
          		<li class="breadcrumb-item"><p class="text-white"></p></li>
            </ol>
            <nav aria-label="breadcrumb animated slideInDown">
               <ol class="breadcrumb">
                    <li class="breadcrumb-item"><<a class="text-white" href="UpdateOK.do">회원 정보 수정</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="MyList.do">결제내역 보러 가기</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page"><strong>나의 식단 보러 가기</strong></li>
                    <li class="breadcrumb-item"><a class="text-white" href="DeleteOK.do">회원 탈퇴</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

	<!-- <div id="side"
		class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
		data-wow-delay="0.3s">
		<div class="rounded overflow-hidden">
			<h5 class="lh-base mb-0">
				<table>
					<tr>
						<td><a href="UpdateOK.do">회원 정보 수정</a></td>
					</tr>
					<tr>
						<td><a href="DeleteOK.do">회원 탈퇴</a></td>
					</tr>
					<tr>
						<td><a href="MyList.do">결제내역 보러 가기</a></td>
					</tr>
					<tr>
						<td><a href="MyMe.do">나의 식단 보러 가기</a></td>
					</tr>

				</table>
		</div>
	</div> -->



	<!-- 메뉴 뿌리기 시작 -->
	<div class="container-xxl py-5" style="display: flex;">
		<div class="container">
			<div class="section-title text-center" id="sss">
				<h1 class="display-5 mb-5">나의 식단 일정</h1>
			</div>
			<div>
				<div class="border border-5 border-light border-top-0 p-4"
					id="position">
					<h5 class="lh-base mb-0">

						<div id="calendar"></div>
						<div id="move">
							<button onClick="prevCalendar()" value="이전 달">이전 달</button>
							<button onClick="nextCalendar()" value="다음 달">다음 달</button>
						</div>
				</div>
			</div>
			<script>
			window.onload = function () { buildCalendar(); } 
			
		
			
			
			
			
			var date = new Date();
			
			// 달력 연도
			var calendarYear = date.getFullYear();
			// 달력 월
			var calendarMonth = date.getMonth() + 1;
			// 달력 일
			var calendarToday = date.getDate();
			
			 function buildCalendar() {
			
				 window.open("http://localhost:8080/me/MyMeSuport.do","popup","width=650, height=300,left=200,top=0");
				 
				 
			var monthLastDate = new Date(calendarYear, calendarMonth, 0);
			
			// 달력 월의 마지막 일
			var calendarMonthLastDate = monthLastDate.getDate();
			
			var monthStartDay = new Date(calendarYear, date.getMonth(), 1);
			
			// 달력 월의 시작 요일
			var calendarMonthStartDay = monthStartDay.getDay();
			
			// 주 카운트
			var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7);
			
			var html = "";
			html += "<table id='table'>";
			html += "<caption id='abc'\">" + calendarYear + "년 " + calendarMonth +"월 </caption>";
			html += "<thead>";
			html += "<tr>";
			html += "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
			// 위치
			var calendarPos = 0;
			// 날짜
			var calendarDay = 0;
			for (var index1 = 0; index1 < calendarWeekCount; index1++) {
				html += "<tr>";
				for (var index2 = 0; index2 < 7; index2++) {
					
					html += "<td id='"+calendarYear+"-"+calendarMonth+"-"+(calendarDay+1)
					+ "'  class='container2' calss='button' style=\"padding: 10px 10px; text-align: center;\">";
					
					if (calendarMonthStartDay <= calendarPos && calendarDay < calendarMonthLastDate) {
						calendarDay++;
						html += "<span style=\"display: block; padding: 10px 10px;\">" + calendarDay + "</span>";
					}
					
					
					html += "<c:forEach var='mList' items='${mymeList }'>";
					if('${fn:substring(mList.deliDate,5,7)}' == calendarMonth && '${fn:substring(mList.deliDate,8,10)}' ==calendarDay && 
							'${fn:substring(mList.deliDate,0,4)}' ==calendarYear	)  {
						
						html += "<button id='target${mList.myNum}' class='draggable' draggable='true' "+
						"onClick='changeDeliDate(${mList.myNum} , \"${fn:substring(mList.startDate,0,10)}\")'>"
						+"${mList.menuName}</button>";
					}
					
					
					html += "</c:forEach></td>";
					calendarPos++;
					
					if(calendarDay ==31){
						calendarDay=32;
					}
				}
				html += "</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			$("#calendar").html(html);
			
			const draggables = document.querySelectorAll(".draggable");
			const containers = document.querySelectorAll(".container2");

			draggables.forEach(draggable => {
			  draggable.addEventListener("dragstart", () => {
			    draggable.classList.add("dragging");
			  });

			  draggable.addEventListener("dragend", () => {
			    draggable.classList.remove("dragging");
			  });
			});

			containers.forEach(container => {
			  container.addEventListener("dragover", e => {
			    e.preventDefault();
			    const afterElement = getDragAfterElement(container, e.clientX);
			    const draggable = document.querySelector(".dragging");
			    if (afterElement === undefined) {
			      container.appendChild(draggable);
			    } else {
			      container.insertBefore(draggable, afterElement);
			    }
			  });
			});

			function getDragAfterElement(container, x) {
			  const draggableElements = [
			    ...container.querySelectorAll(".draggable:not(.dragging)"),
			  ];

			  return draggableElements.reduce(
			    (closest, child) => {
			      const box = child.getBoundingClientRect();
			      const offset = x - box.left - box.width / 2;
			      // console.log(offset);
			      if (offset < 0 && offset > closest.offset) {
			        return { offset: offset, element: child };
			      } else {
			        return closest;
			      }
			    },
			    { offset: Number.NEGATIVE_INFINITY },
			  ).element;
			}
			
			 }
			// 이전달 버튼 클릭
	        function prevCalendar() {
	        	date = new Date(date.getFullYear(), date.getMonth() - 1, date.getDate());
	        	calendarYear = date.getFullYear();
				// 달력 월
				 calendarMonth = date.getMonth() + 1;
				// 달력 일
				 calendarToday = date.getDate();
	        	
	        	buildCalendar();    // 달력 다시 생성
	        }
	        // 다음달 버튼 클릭
	        function nextCalendar() {
	        	date = new Date(date.getFullYear(), date.getMonth() +1, date.getDate());
				
	        	calendarYear = date.getFullYear();
				// 달력 월
				 calendarMonth = date.getMonth() + 1;
				// 달력 일
				 calendarToday = date.getDate();
	        	
	        	buildCalendar();     // 달력 다시 생성
	        }
	        
	        function changeDeliDate(myNum, origin) {
				
	        	const contentSelector = document.querySelector("#target"+myNum);
	        	

	        	const parentElement = contentSelector.parentNode;
	        	const parentId = parentElement.id;

	        	
				$.ajax({
					url:"changeDeliDate.do",
							type: "POST",
							dataType: "",
							data:{
								myNum: myNum,
								deliDate: parentId,
								origin: origin
								
							},
							success: function () {
								console.log("날짜 변경됨");
								alert("배달 날짜 변경 성공");
								
								location.href = "MyMe.do";
								 
							},
							error: function () {
								console.log("날짜 변경 불가")
								alert("배송일로 3일 이전에 상품 혹은 배송일로 부터 2주 이후로는 배송일 변경이 불가능합니다.")
								
								location.href = "MyMe.do";
							}
				})
				
			}
	        
		</script>

			<div class='container2' calss='button'></div>


		</div>
	</div>







	<!-- 메뉴 뿌리기 끝 -->




	<!-- Footer 인클루드 -->
	<jsp:include page="include_f.jsp" />

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