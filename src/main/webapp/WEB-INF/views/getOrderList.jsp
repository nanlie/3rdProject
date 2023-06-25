<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>ORDER LIST</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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
    <link href="resources/css/style2.css" rel="stylesheet">
     <script src="https://kit.fontawesome.com/28346e854f.js" crossorigin="anonymous"></script>
     <script type="text/javascript">
     	function searchFunction() {
     		
     		function today() {
     		   let d = new Date();
     		   return getDateStr(d);
     		}
     		
     		function prevMonth(month) {
     		   let d = new Date();
     		   let monthOfYear = d.getMonth();
     		   d.setMonth(monthOfYear - month);
     		   return getDateStr(d);
     		}
     		
     		function getDateStr(myDate){
     		   let year = myDate.getFullYear();
     		   let month = ("0"+(myDate.getMonth()+1)).slice(-2);
     		   let day = ("0"+myDate.getDate()).slice(-2);
     		   return ( year + '-' + month + '-' + day );
     		}
     		
     	/* 	let today = new Date();   
     		let year = today.getFullYear(); // 년도
     		let month = today.getMonth() + 1;  // 월
     		let date = today.getDate();  // 날짜
     		let day = today.getDay();  // 요일 */
     		
     	/* 	console.log(year + '-' + month + '-' + date); */
     		if($("input:radio[name=chk_date]:checked").val() == "오늘"){
     			$("#searchBeginDate").val(today());
	     		console.log('$("#searchBeginDate").val() : ' + $("#searchBeginDate").val());
	     		$("#searchEndDate").val(today());
	     		console.log('$("#searchEndDate").val() : ' + $("#searchEndDate").val());
     		} else if($("input:radio[name=chk_date]:checked").val() == 1){
     			console.log("1개월 선택");
     			console.log("prevMonth(1) : " + prevMonth(1));
     			$("#searchBeginDate").val(prevMonth(1));
	     		console.log('$("#searchBeginDate").val() : ' + $("#searchBeginDate").val());
	     		$("#searchEndDate").val(today());
	     		console.log('$("#searchEndDate").val() : ' + $("#searchEndDate").val());
     		} else if($("input:radio[name=chk_date]:checked").val() == 6){
     			console.log("6개월 선택");
     			console.log("prevMonth : " + prevMonth(6));
     			$("#searchBeginDate").val(prevMonth(6));
	     		console.log('$("#searchBeginDate").val() : ' + $("#searchBeginDate").val());
	     		$("#searchEndDate").val(today());
	     		console.log('$("#searchEndDate").val() : ' + $("#searchEndDate").val());
     		/* 	console.log("sixMonthAgo : " + sixMonthAgo);
     			$("#searchBeginDate").val(year + '-' + (("00"+sixMonthAgo.toString()).slice(-2))+"-"+(("00"+day.toString()).slice(-2)));
	     		console.log('$("#searchBeginDate").val() : ' + $("#searchBeginDate").val());
	     		$("#searchEndDate").val(year + '-' + (("00"+month.toString()).slice(-2))+"-"+(("00"+day.toString()).slice(-2)));
	     		console.log('$("#searchEndDate").val() : ' + $("#searchEndDate").val()); */
     			
     		}
     		 if($("#searchBeginDate").val() > $("#searchEndDate").val()) {
     			 alert("시작일이 종료일을  초과 할 수 없습니다.");
     			$("#searchBeginDate").focus();
     		 } 
     		$.ajax("getJsonOrderList.do?searchBeginDate="+$("#searchBeginDate").val() 
     				 + "&searchEndDate="+$("#searchEndDate").val() + "&deliOk=" + $("#deliOk").val() + "&orderKeyword=" + $("#orderKeyword").val(), {
     			type: "get",
     			dataType: "json",
     			success: function(respData) {
     				console.log(respData);
     				let dispHtml = "";
     				$.each(respData, function(index, order){
	     				dispHtml += "<tr>";
     					dispHtml += "<td>" + this.myNum + "</td>";
     					dispHtml += "<td>" + this.id + "</td>";
     					dispHtml += "<td>" + this.menuname + "</td>";
     					if(this.subType == 6000) {
	     					dispHtml += "<td>GOOD</td>";
     					}else if(this.subType == 8000) {
	     					dispHtml += "<td>AWESOME</td>";
     					}else if(this.subType == 10000) {
	     					dispHtml += "<td>EXCELLENT</td>";
     					}
     					dispHtml += "<td>" + this.subDate + "</td>";
     					dispHtml += "<td>" + this.deliAddress + "</td>";
     					dispHtml += "<td>" + this.deliDate + "</td>";
     					dispHtml += "<td>" + this.turn + "</td>";
     					if(this.deliOk == "배송 완료") {
     						dispHtml += '<td id="deliok"><i class="fa-solid fa-circle-check"></i></td>';
     					} else if (this.deliOk == "배송 미완료") {
     						dispHtml += "<td id='deliNok'>" + this.deliOk 
     										  + '<button class="btn-deliok" onclick="updateDeliOk('+ this.myNum +')"><i class="fa-solid fa-truck"></i></button></td>';
     					}
	     				dispHtml += "</tr>";
     				});
     				$("#dispData").html(dispHtml);
     			},
     			error: function() {
     				alert("받아오기 실패");
     			}
     		});
     	}
     	
     	function updateDeliOk (myNum) {
     		console.log("myNum : " + myNum);
     		$.ajax("UpdateDeliOk.do?myNum="+ myNum +"&deliOk=배송 완료", {
    			type: "get",
    			success: function(respData) {
    				searchFunction();
    			},
    			error: function() {
     				alert("받아오기 실패");
     			}
     		});
     	}
     	
     	 $(function(){
     	 	$("input:radio[name=chk_date]").on('click', function() {
         	    var valueCheck = $("#selfInput:checked").val(); // 체크된 Radio 버튼의 값을 가져옵니다.
         	   if ( valueCheck == '직접입력' ) {
         	        $('.date-bar').attr('disabled', false);
         	    } else {
         	        $('.date-bar').val(''); 
         	        $('.date-bar').attr('disabled', true); 
         	    }
         	});
   		 });
     	 
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">주문내역관리</h1>
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
    <div class="container-fluid bg-light overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container quote px-lg-0">
           <div class="row g-0 mx-lg-0">
           <!--  
                <div class="col-lg-6 quote-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0"> -->
                            <div class="row g-3 order-box" >
	                            <div class="order-radio-search">
                            			<input type="radio" class="order-radio-btn"  id="today" name="chk_date" value="오늘" placeholder="오늘">
	                            		<label class="order-radio" for="today">오늘</label>
	                            		<span>|</span>
	                            		<input type="radio" class="order-radio-btn" id="oneMonth" name="chk_date" value="1">
	                            		<label class="order-radio" for="oneMonth">1개월</label>
	                            		<span>|</span>
	                            		<input type="radio" class="order-radio-btn" id="sixMonth" name="chk_date" value="6">
	                            		<label class="order-radio" for="sixMonth">6개월</label>
	                            		<span>|</span>
	                            		<input type="radio" class="order-radio-btn" id="selfInput" name="chk_date" value="직접입력">
	                            		<label class="order-radio" for="selfInput">직접입력</label>
	                            </div>
	                            <div class="date-choice">
	                                	<input disabled="disabled" type="date" class="date-bar" id="searchBeginDate" name="searchBeginDate" data-placeholder="시작일" required aria-required="true" />
	                                	<input disabled="disabled" type="date" class="date-bar" id="searchEndDate" name="searchEndDate" data-placeholder="종료일" required aria-required="true"/>
	                                	 <select class="date-bar-deli"  id="deliOk" name="deliOk">
		                                        <option selected value="배송">배송상태 </option>
		                                        <option value="배송 완료">배송 완료</option>
		                                        <option value="배송 미완료">배송 미완료</option>
	                                 </select>
	                            </div>
	                            <div class="order-container">
									<input type="text" id="orderKeyword"  size="30" placeholder="배송지" onkeyup="searchFunction()"/>
									<button class="btn-search" onclick="searchFunction()"><i class="fa-solid fa-magnifying-glass"></i></button>
					            </div>
                                	<table class="order-list">
				     				<thead>
					     				<tr>
						     				<th>주문번호</th>
						     				<th>아이디</th>
						     				<th>메뉴</th>
						     				<th>구독타입</th>
						     				<th>구독날짜</th>
						     				<th>배송주소</th>
						     				<th>배송날짜</th>
						     				<th>회차</th>
						     				<th>배송확인</th>
					     				</tr>
				     				</thead>
				     				<tbody id="dispData">
				     				</tbody>
	     						</table>
                            </div>
<!--                     </div>
                </div>
                -->
            </div> 
        </div>
    </div>
    <!-- Quote End -->
        

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