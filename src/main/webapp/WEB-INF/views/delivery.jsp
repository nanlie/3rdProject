<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>For味</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
    
	</script>
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
    
    <!-- 회원가입 관련 script -->
   	<script src="resources/js/signup.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <style>
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}
		.delButton {
			height: 70px; font-weight: bold; font-size: 1.5em;
		}
		.delInput{
		
		}
		.delInputName{
			height: 55px; text-align: center; font-weight: bold; font-size: 1.1em;
		}
    </style>
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">구독신청</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
        <script >
                 $(document).ready(function(){
			                 const modal = document.getElementById("modal")
			                 function modalOn() {
			                     modal.style.display = "flex"
			                 }
			                 function isModalOn() {
			                     return modal.style.display === "flex"
			                 }
			                 function modalOff() {
			                     modal.style.display = "none"
			                 }
			                 const btnModal = document.getElementById("btn-modal")
			                 btnModal.addEventListener("click", e => {
			                     modalOn()
			                 })
			                 const closeBtn = modal.querySelector(".close-area")
			                 closeBtn.addEventListener("click", e => {
			                     modalOff()
			                 })
			                 modal.addEventListener("click", e => {
			                     const evTarget = e.target
			                     if(evTarget.classList.contains("modal-overlay")) {
			                         modalOff()
			                     }
			                 })
			                 let btnCancel = document.getElementById("btnCancle")
			                 btnCancel.addEventListener("click", e => {
			                     modalOff()
			                 })
			                 let btnConfirm = document.getElementById("btnConfirm")
			                 btnConfirm.addEventListener("click", e =>{
			                	 let recipient = document.getElementById("Recipient");
			                	 let recipientV = recipient.value;
			                	 
			                	 let firstAaddress = document.getElementById("firstAaddress");
			                	 let firstAaddressV = firstAaddress.value;
			                	 
			                	 let detailAddress = document.getElementById("detailAddress");
			                	 let detailAddressV = detailAddress.value;
			                	 
			                	 let firstHpV =$("#firstHp").val();
			                	 
			                	 let newHp = document.getElementById("newHp");
			                	 let newHpV = newHp.value;
			                	 
			                	 let sumAddress = firstAaddressV+' '+detailAddressV;
			                	 let sumHp = firstHpV+newHpV; 
			                	 
			                	 let name = document.getElementById("name");
			                	 let address  = document.getElementById("address");
			                	 let hp = document.getElementById("hp");
			                	 
			                	 if(recipientV===''){
			                		 alert("받는분 성함을 입력해주세요")
			                	 }else if(firstAaddressV === '' || detailAddressV ===''){
			                		 alert("주소를 입력해주세요")
			                	 }else if(firstHpV ==='' || newHpV === ''){
			                		 alert("받는분 연락처를 입력해주세요")
			                	 }else{
				                	 name.value = recipientV;
				                	 address.value = sumAddress;
				                	 hp.value = sumHp;
				                	 modalOff()
			                	 }
			                 })
			                 window.addEventListener("keyup", e => {
			                     if(isModalOn() && e.key === "Escape") {
			                         modalOff()
			                     }
			                 })
                 });
                 </script>

    <!-- 회원가입 Start -->
     <div class="container-fluid bg-light overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container quote px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-5 ps-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute img-fluid w-100 h-100" src="resources/img/signup2.jpg" style="object-fit: cover;" alt="">
                    </div>
                </div>
                <div class="col-lg-7 quote-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                 <!--주문정보-->
                 <div class="position-relative h-100">
                 <div>
                 <form action = "okOrder.do" method = "post" id = "okOrder">
                 <div class="row g-3">
                    <h4 class="display-7 mb-4">주문자 정보</h4>
                    
               		<div class="col-12 col-sm-4">
                         <input type="text" class="form-control border-0 bg-light delInputName" value="이름 " readonly>
                    </div>
               		<div class="col-12 col-sm-8">
                         <input type="text" class="form-control border-5 bg-light delInputName" value="${orderInfo.name} " readonly>
                    </div>
               		<div class="col-12 col-sm-4">
                         <input type="text" class="form-control border-0 bg-light delInputName" value="전화번호 " readonly>
                    </div>
               		<div class="col-12 col-sm-8">
                         <input type="text" class="form-control border-5 bg-light delInputName" value="${orderInfo.hp } " readonly>
                    </div>
               		<div class="col-12 col-sm-4">
                         <input type="text" class="form-control border-0 bg-light delInputName" value="이메일 " readonly>
                    </div>
               		<div class="col-12 col-sm-8">
                         <input type="text" class="form-control border-5 bg-light delInputName" value="${orderInfo.email } " readonly>
                    </div>
                    <hr>
                    <h4 class="display-7 mb-4">배송지 정보</h4>
               		<div class="col-12 col-sm-4">
                         <input type="text" class="form-control border-0 bg-light delInputName" value="받는 분 " readonly>
                    </div>
               		<div class="col-12 col-sm-8">
                         <input type="text" class="form-control border-5 bg-light delInputName" name="name" value="${orderInfo.name } "  id = "name"readonly>
                    </div>
               		<div class="col-12 col-sm-4">
                         <input type="text" class="form-control border-0 bg-light delInputName" value="배송 주소 " readonly>
                    </div>
               		<div class="col-12 col-sm-8">
                         <input type="text" class="form-control border-5 bg-light delInputName" name="deliAddress" value="${orderInfo.address } " id = "address"readonly>
                    </div>
               		<div class="col-12 col-sm-4">
                         <input type="text" class="form-control border-0 bg-light delInputName" value="배송 연락처 " readonly>
                    </div>
               		<div class="col-12 col-sm-8">
                         <input type="text" class="form-control border-5 bg-light delInputName" name="hp" value="${orderInfo.hp } " id = "hp"readonly>
                    </div>
                    <input type="button" class="btn btn-primary w-100 py-3 delButton" id="btn-modal" value="배송지 변경">
                    <hr>
                    <h4 class="display-7 mb-4">주문상품 / 배송일</h4>
                    <div class="row g-4" id="orderInfo"></div>
			        <hr>   
					<h4 class="display-7 mb-4">결제 수단</h4>
               		<div class="col-12 col-sm-3" style="text-align: center; font-weight: bold; font-size: 1.1em;">
               			 <label><input type = "checkbox" value = "kg" name="payment" >&nbsp;&nbsp;&nbsp;계좌이체</label>
                    </div>	
               		<div class="col-12 col-sm-3" style="text-align: center; font-weight: bold; font-size: 1.1em;">
               			 <label><input type = "checkbox" value = "kakao" name="payment">&nbsp;&nbsp;&nbsp;카카오페이</label>
                    </div>	
               		<div class="col-12 col-sm-3" style="text-align: center; font-weight: bold; font-size: 1.1em;">
               			 <label><input type = "checkbox" value = "toss" name="payment">&nbsp;&nbsp;&nbsp;신용카드</label>
                    </div>	
					<script>
                 				/*결제수단*/
                 			 $(document).ready(function() {
							   	 $("input[name=payment]:checkbox").click(function() {
							     		$("input[name=payment]:checkbox").not(this).prop('checked', false);
							     		console.log("payment: "+$("input[name=payment]:checkbox:checked").val());
							    });
							  });
                 	</script>
                 	<input type = "hidden" value ="${day  }" name ="day">
                 	<input type = "hidden" value ="${id  }" name ="id">
                 	<c:if test="${day eq '3' && subType eq '6000'}"><input type = "hidden" value ="6000" name ="subPrice"></c:if>
         			<c:if test="${day eq '3' && subType eq '8000'}"><input type = "hidden" value ="8000" name ="subPrice"></c:if>
         			<c:if test="${day eq '3' && subType eq '10000'}"><input type = "hidden" value ="10000" name ="subPrice"></c:if>
         			<c:if test="${day eq '5' && subType eq '6000'}"><input type = "hidden" value ="5800" name ="subPrice"></c:if>
         			<c:if test="${day eq '5' && subType eq '8000'}"><input type = "hidden" value ="7800" name ="subPrice"></c:if>
         			<c:if test="${day eq'5' && subType eq '10000'}"><input type = "hidden" value ="9800" name ="subPrice"></c:if>
         			<input type = "hidden" value =${subType } name = "subType" id = "subType">
         			<input type = "hidden" value =${menuId } name = "menuId" id = "menuId">
         			<input type = "hidden" value =${deliveryDate } name = "deliDate" id = "deliDate">
                 	<hr>
                 	</div>	
	                 <!--결제정보 및 결제버튼-->
	                 	<div class="row g-4">
	                 	<div class="col-12 col-sm-6">
	                		<input type="text" class="form-control border-0 bg-light" value="결제금액" readonly style="height: 55px; text-align: center; font-weight: bold; font-size: 1.2em;">
	            		</div>
	            		
	                 	<div class="col-12 col-sm-6">
	                		<span class="form-control border-5 bg-light" id = "subscribePrice" style="height: 55px; text-align: center; font-weight: bold; font-size: 1.1em;">
	            					<c:if test="${day eq '3' && subType eq '6000'}">18,000원</c:if>
	            					<c:if test="${day eq '3' && subType eq '8000'}">24,000원</c:if>
	            					<c:if test="${day eq '3' && subType eq '10000'}">30,000원</c:if>
	            					<c:if test="${day eq '5' && subType eq '6000'}">29,000원</c:if>
	            					<c:if test="${day eq '5' && subType eq '8000'}">39,000원</c:if>
	            					<c:if test="${day eq'5' && subType eq '10000'}">49,000원</c:if>
	            			</span>
	            		<br>
	            		</div>
	            		<div class="col-12 col-sm-12 center" style="font-weight: bold; font-size: 1.1em;">
	            			<p>&nbsp;&nbsp;&nbsp;(필수)처리위탁 및 3자 제공 동의 </p>
	            			<p>&nbsp;&nbsp;&nbsp;(필수)결제대행서비스 이용 동의 </p>
	            			<p>&nbsp;&nbsp;&nbsp;(필수)개인정보 수집 및 이용 동의 </p>
	            			<label><input type = "checkbox" value = "confirm" id = "confirm" >&nbsp;&nbsp;&nbsp;상기 필수약관을 확인하였으며 결제에 동의합니다. </label>
	            			<br><br>
	            			<input class="btn btn-primary w-100 py-3 delButton" type="button" id ="finalPayment" value="결제하기">
	            		</div>
	            		</div>
					</form>
                 	
                 	<div id="modal" class="modal-overlay">
        				<div class="modal-window">
            			<div class="title">
                			<h2>배송지수정</h2>
			            </div>
			            <div class="close-area">X</div>
			            <div class="content">
			            		<p>받는분 <input type = "text" name="Recipient" id = "Recipient"></p>
			            		<span><input type="text" class="form-control border-0" id="postcode" disabled="disabled" placeholder="우편번호" title="주소"  style="height: 55px;"></span>
			            		<span><input type="button" class='btn btn-primary py-3 px-5'  onclick="execDaumPostcode()" value="우편번호 찾기" style="height: 55px;" ></span>
			            		<p><input type="text" name="firstAaddress" class="form-control border-0" id="firstAaddress" readonly placeholder="주소" title="주소"  style="height: 55px;"></p>
			            		<p><input type="text" name="detailAddress" class="form-control border-0" id="detailAddress" placeholder="상세주소" title="상세주소" style="height: 55px;"></p>
			            		<p>휴대전화 
			            		<select name = "firstHp" id = "firstHp">
			            			<option value = "010" selected="selected">010</option>
			            			<option value = "011">011</option>
			            			<option value = "016">016</option>
			            			<option value = "017">017</option>
			            			<option value = "018">018</option>
			            			<option value = "019">019</option>
			            		</select>
			            			<input type ="text" name = "newHp" id = "newHp">
			            		</p>
			            		<button class='btn btn-primary py-3 px-5'  id="btnConfirm">저장</button>
			            		 <button class='btn btn-primary py-3 px-5'  id="btnCancle"> 취소 </button> 
           				 </div>
       			 </div>
       			 </div>
   			 </div>
           </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    
<script>
 
$(document).ready(function() {
  	 $("#finalPayment").click(function() {
				let confirm = $("#confirm:checked").val();
		  		let quantity = ${day}; //구독날짜
		  		let subType = ${subType};//구독타입
		  		let subscribePrice; /*총결제금액*/
		  		let memberName = '${orderInfo.name}'; //구매자이름
		  		let payment  = $("input[name=payment]:checkbox:checked").val(); /*결제수단*/
		  		console.log("memberName" + memberName); 
		  		console.log("quantity" + quantity); 
		  		console.log("confirm" + confirm); 
		  		console.log("payment" + payment); 
		  		if((${day})===3 &&(${subType})===6000){
		  			subscribePrice = 18000;
		  		}else if ((${day})===3 &&(${subType})===8000){
		  			subscribePrice === 24000;
		  		}else if ((${day})===3 &&(${subType})===10000){
		  			subscribePrice === 30000;
		  		}else if ((${day})===5 &&(${subType})===6000){
		  			subscribePrice === 29000;
		  			subType = 5800;
		  		}else if ((${day})===5 &&(${subType})===8000){
		  			subscribePrice === 39000;
		  			subType = 5800;
		  		}else if ((${day})===5 &&(${subType})===10000){
		  			subscribePrice === 49000;
		  			subType = 5800;
		  		}
		  		if(confirm == undefined){
					alert("약관에 동의해주세요");
				}else if(payment == undefined){
					alert("결제수단을 선택해주세요");
				}else if(payment === 'toss'){
			  			var IMP = window.IMP;
			  			console.log(IMP);
			  			IMP.init('imp48636600');
			  			if (payment === null) {
			  				console.error('선택된 결제 금액이 없습니다.');
			  				return;
			  			}
			  			IMP.request_pay({
			  				pg : 'uplus',
			  				pay_method : 'card',
			  				merchant_uid : 'iamporttest_3' + new Date().getTime(), //상점에서 생성한 고유 주문번호
			  				name : '주문명:${day}일구독', //필수 파라미터 입니다.
			  				amount : subscribePrice,
			  				buyer_email : 'iamport@siot.do',
			  				buyer_name : '구매자이름',
			  				buyer_tel : '010-1234-5678',
			  				buyer_addr : '서울특별시 강남구 삼성동',
			  				buyer_postcode : '123-456',
			  			}, function(rsp) {
			  				if (rsp.success) {
								let dispHt = "<input type = 'hidden' value ="+subType+"name = 'subType'>";
								$("#id").after(dispHt);
								$("#okOrder").submit();
			  				} else {
			  					var msg = '결제에 실패하였습니다.';
			  					msg += '에러내용 : ' + rsp.error_msg;
			  					alert(msg);
			  				}
			  			});}else if(payment=== 'kakao'){
				  			var IMP = window.IMP;
				  			IMP.init('imp01585062');
				  			if (subscribePrice === null) {
				  				console.error('선택된 결제 금액이 없습니다.');
				  				return;
			  				}
			  			IMP.request_pay({
			  				pg : 'kakaopay',
			  				merchant_uid : 'TC0ONETIME' + new Date().getTime(),
			  				name : '주문명 : ${day}일구독',
			  				amount : subscribePrice,
			  				buyer_email : 'iamport@siot.do',
			  				buyer_name : memberName,
			  				buyer_tel : '010-1234-5678',
			  				buyer_addr : '인천광역시 부평구',
			  				buyer_postcode : '123-456'
			  			}, function(rsp) {
				  				console.log(rsp);
				  				if (rsp.success) {
				  					let dispHt = "<input type = 'hidden' value ="+subType+"name = 'subType'>";
									$("#id").after(dispHt);
									$("#okOrder").submit();
				  				} else {
				  					var msg = '결제에 실패하였습니다.';
				  					msg += '에러내용 : ' + rsp.error_msg;
				  				}
		  				}); }else if(payment=== 'kg'){
			  			var IMP = window.IMP;
			  			IMP.init('imp01585062');
			  			if (subscribePrice === null) {
			  				console.error('선택된 결제 금액이 없습니다.');
			  				return;
			  			}
			  			IMP.request_pay({
			  				pg : 'html5_inicis',
			  				pay_method : 'trans',
			  				merchant_uid : "INIBillTst" + new Date().getTime(), // 상점에서 관리하는 주문 번호
			  				name : '주문명:${day}일구독',
			  				amount : subscribePrice,
			  				buyer_email : 'iamport@siot.do',
			  				buyer_name : memberName,
			  				buyer_tel : '010-1234-5678',
			  				buyer_addr : '서울특별시 강남구 삼성동',
			  				buyer_postcode : '123-456'
			  			}, function(rsp) {
			  				if (rsp.success) {
			  					let dispHt = "<input type = 'hidden' value ="+subType+"name = 'subType'>";
								$("#id").after(dispHt);
								$("#okOrder").submit();
			  				} else {
			  					var msg = '결제에 실패하였습니다.';
			  					msg += '에러내용 : ' + rsp.error_msg;
			  					alert(msg);
			  				}
		  		 });
  		 	}
   });
});

        /*배달 날짜 따라서 배열 바꾸기*/
        // 주어진 배열들
           let deliveryDates=[];
           let thumbnails =[];
           let menuNames = [];
		   <c:forEach var="menuIds" items = "${menuIds }" varStatus="status">
		   		deliveryDates.push('${deliveryDates[status.index] }' );
		   		thumbnails.push('${thumbnails[status.index] }');
		   		menuNames.push('${menuNames[status.index] }');
		   </c:forEach>
		  // 날짜를 기준으로 오름차순으로 정렬
			const sortedIndices = deliveryDates
			  .map((_, index) => index)
			  .sort((a, b) => new Date(deliveryDates[a]) - new Date(deliveryDates[b]));
			
			// 정렬된 값을 담을 배열 초기화
			const sortedDeliveryDates = [];
			const sortedThumbnails = [];
			const sortedMenuNames = [];
			
			// 정렬된 순서대로 값을 추출하여 배열에 저장
			sortedIndices.forEach((index) => {
			  sortedDeliveryDates.push(deliveryDates[index]);
			  sortedThumbnails.push(thumbnails[index]);
			  sortedMenuNames.push(menuNames[index]);
			});
			
			// 정렬된 배열 출력
			console.log('Delivery Dates:', sortedDeliveryDates);
			console.log('Thumbnails:', sortedThumbnails);
			console.log('Menu Names:', sortedMenuNames);
			
			let dispHtml = '';
			for(let i = 0; i <sortedDeliveryDates.length;i++ ){
				dispHtml +='<div class="col-12 col-sm-4">';
				dispHtml +='<img style = "width:180px; height:120px;" class="img-fluid" src="resources/forMeImg/작은/'+sortedThumbnails[i]+'">';
				dispHtml +='</div>';
				dispHtml +='<div class="col-12 col-sm-8">';
				dispHtml +='<input type="text" class="form-control border-0 bg-light" value='+sortedDeliveryDates[i]+' readonly style="height: 55px; text-align: center; font-weight: bold; font-size: 1.1em;">';
				dispHtml +='<input type="text" class="form-control border-5 bg-light" value="'+sortedMenuNames[i]+'" readonly style="height: 55px; text-align: center; font-weight: bold; font-size: 1.1em;">';
				dispHtml +='</div>';
			}
			$("#orderInfo").append(dispHtml);
</script>             
<style>
           th, td{ border:1px solid black;}
           #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 500px;
            height: 600px;
            position: relative;
            top: 150px;
            padding: 30px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
</style>                
    <!-- 회원가입 End -->
        

	<!-- Footer 인클루드 -->
	<jsp:include page="/WEB-INF/views/include_f.jsp"/>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i class="bi bi-arrow-up"></i></a>
	
	<!-- 다음 우편번호 시작 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="resources/js/address.js"></script>
	<!-- 다음 우편번호 끝 -->

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