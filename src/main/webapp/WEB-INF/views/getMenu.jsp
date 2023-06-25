<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Woody - Carpenter Website Template</title>
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
    <link href="resources/css/style2.css" rel="stylesheet">
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">메뉴개별관리</h1>
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
                    <div class="position-relative h-100 menuImage">
                        <img class="show-img" src="resources/forMeImg/${menu.thumbnail}" style="object-fit: cover;" alt="">
                        <img class="show-img" src="resources/forMeImg/${menu.menuImg}" style="object-fit: cover;" alt="">
                    </div>
                </div>
                <div class="col-lg-6 quote-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                    	<form action="adminUpdateMenu.do" method="post" enctype="multipart/form-data">
                            <div class="row g-3">
                                <div class="col-12">
                                    <input class="form-control border-0" placeholder=" 메뉴이름" name="menuName" value="${menu.menuName }">
                                </div>
                                	
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" placeholder="메뉴아이디 : ${menu.menuId } " style="height: 55px;" readonly="readonly" >
                                    	<input type="hidden" value="${menu.menuId }" name="menuId">	
                                </div>
                                
                                <div class="col-12 col-sm-6">
	                                <select class="form-select border-0 col-12" style="height: 55px;" name="menuType" >
	                                        <option selected value="${menu.menuType }">메뉴타입 : ${menu.menuType }</option>
	                                        <option value="1">1</option>
	                                        <option value="2">2</option>
	                                 </select>
                                </div>
                                 <div class="col-12 col-sm-6">
                                		<label class="form-control border-0"  for="subType">가격타입</label>
	                                <select class="form-select border-0 col-12" style="height: 55px;" id="subType" name="subType">
	                                        <option selected value="${menu.subType }">${menu.subType}</option>
	                                        <option value="6000">6000</option>
	                                        <option value="8000">8000</option>
	                                        <option value="10000">10000</option>
	                                 </select>
                                </div>
                                	 
                                	 
                                <div class="col-12 col-sm-3">
                                		<label class="form-control border-0"  for="carbohydrate">탄수화물</label>
                                    <input type="text" class="form-control border-0" id="carbohydrate" value="${menu.carbohydrate}" style="height: 55px;" name="carbohydrate">
                                </div>
                                <div class="col-12 col-sm-3">
                                		<label class="form-control border-0"  for="protein">단백질</label>
                                    <input type="text" class="form-control border-0" id="protein" value="${menu.protein}" style="height: 55px;" name="protein">
                                </div>
                                <div class="col-12 col-sm-3">
                                		<label class="form-control border-0"  for="fat">지방</label>
                                    <input type="text" class="form-control border-0" id="fat" value="${menu.fat}" style="height: 55px;" name="fat">
                                </div>
                                <div class="col-12 col-sm-3">
                                		<label class="form-control border-0"  for="natrium">나트륨</label>
                                    <input type="text" class="form-control border-0" id="natrium" value="${menu.natrium}" style="height: 55px;" name="natrium">
                                </div>
                                <div class="col-12 col-sm-3">
                                		<label class="form-control border-0"  for="calories">칼로리</label>
                                    <input type="text" class="form-control border-0" id="calories" value="${menu.calories}" style="height: 55px;" name="calories">
                                </div>
                                <div class="col-12 col-sm-3">
                                		<label class="form-control border-0"  for="weight">무게</label>
                                    <input type="text" class="form-control border-0" id="weight" value="${menu.weight}" style="height: 55px;" name="weight">
                                </div>
                                <div class="col-12">
                                    <textarea class="form-control border-0" placeholder="알레르기" name="allergy">${menu.allergy }</textarea>
                                </div>
                                	
                                	<div class="col-12 col-sm-6">
                                		<input type="text" class="form-control border-0" placeholder="기존썸네일 : ${menu.thumbnail}" readonly="readonly" name="thumbnail" value="${menu.thumbnail}" }>
                                	</div>
                                <div class="col-12">
                                    <input class="form-control border-0"  type="file"  id="upload-file" name="thumbnailFIle">
                                </div>
                                
                                	<div class="col-12 col-sm-6">
                                		<input type="text" class="form-control border-0" placeholder="기존상품이미지 : ${menu.menuImg }" readonly="readonly" name="menuImg" value="${menu.menuImg }">
                                	</div>
                                	
                               <div class="col-12">
                                    <input type="file" class="form-control border-0" name="menuImgFile">
                                </div>
                                
                                <div class="col-12">
                                    <textarea class="form-control border-0" placeholder="레시피" name="recipe">${menu.recipe}</textarea>
                                </div>
                                <div class="col-12">
                                    <textarea class="form-control border-0" placeholder="상세내용" name="mComment">${menu.mComment}</textarea>
                                </div>
                             
                                <div class="col-12" id="btn-submit">
                                    <input type="submit" class="btn btn-primary w-25 py-3" value="수정">
                                    <a href="adminDeleteMenu.do?menuId=${menu.menuId}" class="btn btn-primary w-25 py-3">삭제</a>
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