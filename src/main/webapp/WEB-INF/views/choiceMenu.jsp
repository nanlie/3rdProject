<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>구독하기</title>
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
            <h1 class="display-3 text-white mb-3 animated slideInDown" style = "font-size:30px;">메뉴 선택</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    <!-- 3일구독 -->
<div class="container-xxl py-5">
        <div class="container">
            <h1  style = "font-size:40px;">${day }일구독</h1>
             <div class="container-xxl py-5">
        <div class="container">
            <div class="section-title text-center">
                <h1 class="display-5 mb-5">
	               <c:if test="${subType eq '6000'}">GOOD메뉴</c:if>
	               <c:if test="${subType eq '8000'}">AUSOME메뉴</c:if>
	               <c:if test="${subType eq '10000'}">EXCELLENT메뉴</c:if>
            	</h1>
                <h5>주문하는 날짜 3일 뒤 부터 10일 전 까지 구독 가능합니다.</h5>
            </div>
            <!--1 -->
            <form id ="choiceForm" action = "delivery.do" method = "post">
			     <div class="row g-4">
			         <c:forEach var="choice" items="${choice }" >
			             <div class="col-lg-3 col-md-6 wow fadeInUp">
			                 <div>
			                     <label>
			                         <div class="text-center border border-5 border-light p-4" id="choiceDay" style="height: 400; width: 300; position: relative;">
			                        	 <div class="overflow-hidden position-relative">   
			                             <img class="img-fluid" src="resources/forMeImg/작은/${ choice.thumbnail}" alt="">
			                         </div>
			                             <h5 class="mb-0" style="padding:10px">${choice.menuName }</h5>
			                             <input type="checkbox" value="${choice.menuId }"style="display:none; float:right;" name="chk" id = "id${choice.menuId }">
			                             <input type="checkbox" value="${choice.menuName }" name="menuName" style = "display:none"id ="menuName${choice.menuId }">
			                             <input type="checkbox" value="${choice.thumbnail }" name="thumbnail" style = "display:none" id="thumbnail${choice.menuId }">
			                             <div id="day${choice.menuId }" class="day">
			                                 <!--옵션추가-->
			                             </div>
			                         </div>
			                     </label>
			                 </div>
			             </div>
			         </c:forEach>
			     </div>
			     <br>
			     <input type = "hidden" value = "${user.id }" name = "id">
			     <input type = "hidden" value = "${day }" name = "day">
			     <input type = "hidden" value = "${subType }" name = "subType">
			     <input type = "button" class='btn btn-primary py-3 px-5' value = "다음&nbsp;&nbsp;=͟͟͞͞Ꙭ̮" id="btn"> 
			</form>
      
    </div>
  </div>
 </div>
 </div>
<script>
	/* 날짜 옵션값 만들기*/
   $(document).ready(function() {
  	  $('input[name=chk]:checkbox').change(function() {
  	    let chk = $(this).val();
  	    let selectId = 'selectDay' + chk;
  	    let today = new Date();
  	    let year = today.getFullYear(); // 년도
  	    let month = today.getMonth() + 1;  // 월
  	    let date = today.getDate()+3;  // 날짜
  	    let day = today.getDay()+4;  // 요일
  		/*let dayArr = ['월','화','수','목','금','토','일']
  	    let dayOfWeek = dayArr[today.getDay()];*/
  	    let yyyymmdd;
  	    if ($(this).is(':checked')) {
  	      if ($('#' + selectId).length === 0) {
  	        let selectHtml = '<select id="' + selectId + '"name = "selectDay" onchange="changeSelect()">';
  	        selectHtml += '<option name = "days">날짜를 선택하세요</option>';
  	        for(let i = 0 ; i < 7; i++){
  	        	 /*현재 달의 다음 달의 0일(현재 달의 마지막 날짜)을 생성*/
  	        	 if (date + i > new Date(year, month, 0).getDate()) {
  	                 month++;
  	                 date = 1;
  	              }
  	        	yyyymmdd = year+'/'+month+'/'+(date+i);
  	        	selectHtml += '<option name ="days" value="'+yyyymmdd+'">'+year+'/'+month+'/'+(date+i)+'</option>';
  	        	/*id값이 같으면 disabled처리*/
  	        }
  	        selectHtml += '</select>';
  	        $('#day' + chk).append(selectHtml);
  	      }
  	    changeSelect()
  	    } else {
  	      $('#' + selectId).remove();
  	    }
  	  });
  	});
   /*menuId랑 deliveryDate 배열에 넣어서 값체크 */         
   $(document).ready(function(){
  	 $("#btn").click(function(){
  		 let chkarr = [];
  		 let dayarr = [];
           $('input[name=chk]:checkbox:checked').each(function(){
              let chk = $(this).val();
              chkarr.push(chk);
              console.log(chk);
         	});
           $('select[name=selectDay] option:selected').each(function(){
               let num = $(this).val();
               dayarr.push(num);
               console.log(num);
           });
		if(chkarr.length!==(${day})){
			alert("메뉴를"+(${day})+"개 선택해주세요");
		}else if(dayarr.includes('날짜를 선택하세요') || dayarr.length!== (${day})){
			alert("날짜를 선택해주세요");
		}else{
			let id = '${user.id}';
			if(id == ''){
				return false;
			}
			let myform = document.getElementById("choiceForm");
			$("select[name=selectDay] option").prop('disabled',false);
			myform.submit();
		}
    });
  });
    /*체크박스 체크하면 썸네일, 메뉴이름 동시에 체크*/       
 	$(document).ready(function(){
       	$('input[name=chk]:checkbox').click(function(){
        	let chk = $(this).val();
        	if($('#id'+chk+'').is(':checked')){
        		 $('#menuName'+chk+'').prop('checked',true);
         		 let chk1 =  $('#menuName'+chk+'').val();
         		 $('#thumbnail'+chk+'').prop('checked',true);
         		 let chk2 =  $('#thumbnail'+chk+'').val();
         		 console.log(chk)
         		 console.log(chk1);
         		 console.log(chk2);
        	}else{
        		$('#menuName'+chk+'').prop('checked',false);
      			$('#thumbnail'+chk+'').prop('checked',false);
        	}
       });
   });
    /*체크 구독일자랑 같으면 disabled처리*/
   $(document).ready(function(){
    	$("input[name = chk]:checkbox").click(function(){
     	   let cnt = ${day};
     	   let chk = $(this).val();
     	   if (cnt == $("input[name = chk]:checkbox:checked").length){
     	      $(":checkbox:not(:checked)").attr("disabled", "disabled"); 
     	   }else{
     	      $("input[name = chk]:checkbox").removeAttr("disabled");
     	   }
     	});
   });
   function changeSelect() {
       console.log("누름");
       let num = "";
       $("select[name=selectDay] option").prop('disabled',false);
       $('select[name=selectDay] option:selected').each(function(){
               num = $(this).text();
               console.log(num);
          $("select[name=selectDay] option[value='"+ num +"']").prop('disabled',true);
            });
    } 
</script>
    <!-- Service End -->

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