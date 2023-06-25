<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>menu management</title>
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
    <script type="text/javascript">
    	function setThumbnail(event) {
    		let reader = new FileReader();
    		
    		reader.onload = function(event) {
    			let img = document.createElement("img");
    			let name = document.createElement("p");
    			img.setAttribute("src", event.target.result);
    			document.querySelector("div#image_container").appendChild(img).className="show-img";
    		};
            reader.readAsDataURL(event.target.files[0]);
    	}
    	function setImage(event) {
    		let reader = new FileReader();
    		
    		reader.onload = function(event) {
    			let img = document.createElement("img");
    			img.setAttribute("src", event.target.result);
    			document.querySelector("div#image_container").appendChild(img).className="show-img";
    		};
            reader.readAsDataURL(event.target.files[0]);
    	}
    	
    	function noEmpty(frm) {
    		if(frm.menuName.value.trim() == "") {
    			alert("메뉴이름은 공백일 수 없습니다.");
    			frm.menuName.focus();
    			return false;
    		} else if (frm.menuId.value.trim() == "") {
    			alert("메뉴아이디는 공백일 수 없습니다.");
    			frm.menuId.focus();
    			return false;
    		} else if(frm.menuType.value.trim() == "메뉴타입" ) {
    			alert("메뉴타입을 선택 해주세요.");
    			frm.menuType.focus();
    			return false;
    		} else if(frm.subType.value.trim() == "가격타입" ) {
    			alert("가격타입을 선택 해주세요.");
    			frm.subType.focus();
    			return false;
    		} 
    		if(frm.allergy.value.trim() == null || frm.allergy.value.trim() == "") {
    			console.log("frm.allergy.value.trim() : " + frm.allergy.value.trim());
    			frm.allergy.value = "작성 예정입니다";
    		} 
    		if(frm.recipe.value.trim() == null || frm.recipe.value.trim() == "") {
    			frm.recipe.value = "작성 예정입니다";
    		} 
    		if(frm.mComment.value.trim() == null || frm.mComment.value.trim() == "") {
    			frm.mComment.value = "작성 예정입니다";
    		}
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">메뉴등록</h1>
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
                <div class="col-lg-6 ps-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100 menuImage" id="image_container">
                        <%-- <img class="position-absolute img-fluid w-100 h-100" src="resources/forMeImg/${menu.menuImg}" style="object-fit: cover;" alt=""> --%>
                    </div> 
                </div>
                <div class="col-lg-6 quote-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                    	<form action="adminInsertMenu.do" method="post" enctype="multipart/form-data">
                            <div class="row g-3">
                                <div class="col-12">
                                    <input class="form-control border-0" placeholder=" 메뉴이름" name="menuName" id="menuName" >
                                </div>
                                <div class="col-12 col-sm-6">
	                                <select class="form-select border-0 col-12" style="height: 55px;" id="menuType" name="menuType">
	                                        <option selected value="0">메뉴타입 </option>
	                                        <option value="1">1</option>
	                                        <option value="2">2</option>
	                                 </select>
                                </div>
                                <div class="col-12 col-sm-6">
	                                <select class="form-select border-0 col-12" style="height: 55px;" id="subType" name="subType">
	                                        <option selected value="0">가격타입 </option>
	                                        <option value="6000">6000</option>
	                                        <option value="8000">8000</option>
	                                        <option value="10000">10000</option>
	                                 </select>
                                </div>
                                <div class="col-12 col-sm-4">
                                		<label class="form-control border-0" for="carbohydrate">탄수화물</label>
                                    <input type="number" class="form-control border-0" id="carbohydrate" style="height: 55px;" name="carbohydrate" value="0" max="9999">
                                </div>
                                <div class="col-12 col-sm-4">
                                		<label class="form-control border-0" for="protein">단백질</label>
                                    <input type="number" class="form-control border-0" placeholder="단백질" style="height: 55px;" name="protein" value="0" max="9999">
                                </div>
                                <div class="col-12 col-sm-4">
                                		<label class="form-control border-0" for="fat">지방</label>
                                    <input type="number" class="form-control border-0" placeholder="지방" style="height: 55px;" name="fat" value="0" max="9999">
                                </div>
                                <div class="col-12 col-sm-4">
                                		<label class="form-control border-0" for="natrium">나트륨</label>
                                    <input type="number" class="form-control border-0" placeholder="나트륨" style="height: 55px;" name="natrium" value="0" max="9999">
                                </div>
                                <div class="col-12 col-sm-4">
                                		<label class="form-control border-0" for="calories">칼로리</label>
                                    <input type="number" class="form-control border-0" placeholder="칼로리" style="height: 55px;" name="calories" value="0" max="9999">
                                </div>
                                <div class="col-12 col-sm-4">
                                		<label class="form-control border-0" for="weight">무게</label>
                                    <input type="number" class="form-control border-0" placeholder="무게" style="height: 55px;" name="weight" value="0" max="9999">
                                </div>
                                <div class="col-12">
                                    <textarea class="form-control border-0"  name="allergy">알레르기</textarea>
                                </div>
                                <div class="col-12">
                                		<p>썸네일</p>
                                    <input class="form-control border-0"  type="file"  id="uploadThumbnail"  name="thumbnailFile" accept="resources/*" onchange="setThumbnail(event)">
                                </div>
                              <div class="col-12">
                                		<p>상품이미지</p>
                                    <input type="file" class="form-control border-0" id="uploadImg" name="menuImgFile" accept="resources/*" onchange="setImage(event)">
                                </div>
                                <div class="col-12">
                                    <textarea class="form-control border-0"  name="recipe">레시피</textarea>
                                </div>
                                <div class="col-12">
                                    <textarea class="form-control border-0"  name="mComment">상세내용</textarea>
                                </div>
                                <div class="col-12" id="btn-submit">
                                    <input type="submit" class="btn btn-primary w-25 py-3" value="등록" onclick="return noEmpty(this.form)">
                                    <a href="adminGetMenuList.do" class="btn btn-primary w-25 py-3">목록</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
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