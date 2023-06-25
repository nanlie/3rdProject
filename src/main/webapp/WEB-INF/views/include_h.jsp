<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Topbar Start -->
    <div class="container-fluid bg-light p-0">
        <div class="row gx-0 d-none d-lg-flex">
            <div class="col-lg-7 px-5 text-start">
                <div class="h-100 d-inline-flex align-items-center py-3 me-4">
                    <small class="fa fa-map-marker-alt text-primary me-2"></small>
                    <small>129, Teheran-ro, Gangnam-gu, Seoul, Republic of Korea</small>
                </div>
                <div class="h-100 d-inline-flex align-items-center py-3">
                    <small class="far fa-clock text-primary me-2"></small>
                    <small><a href="https://open.kakao.com/o/sqYkd0pf">카카오톡 상담 가능 시간 Mon - Fri : 09.00 AM - 06.00 PM</a></small>
                </div>
            </div>
            <div class="col-lg-5 px-5 text-end">
                <div class="h-100 d-inline-flex align-items-center py-3 me-4">
                    <small> </small> 
                    <small> </small> 
                </div>
                <c:if test="${empty user}">
	                <div class="h-100 d-inline-flex text-end align-items-center">
	                    <a class="btn text-primary me-1" href="loginGo.do">로그인</a>
	                    <a class="btn text-primary me-1" href="signup.do">회원가입</a>
	                </div>
                </c:if>
                <c:if test="${not empty user}">
	                <div class="h-100 d-inline-flex text-end align-items-center">
	                    <span class="text-primary me-1">[ ${user.id } ]</span><span>&nbsp;님 환영합니다.</span>
	                    <a class="btn text-primary me-1" href="logout.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그아웃</a>
	                </div>
                </c:if>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="index.jsp" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary">For 味</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <!-- <a href="index.jsp" class="nav-item nav-link active">味 메뉴</a> -->
                 <a href="notice.do" class="nav-item nav-link">공지사항</a>
                <a href="review.do" class="nav-item nav-link">味 담</a>
            <c:if test="${user.id != 'admin'}">    
                <a href="Mypage.do" class="nav-item nav-link">나의 味</a>
            </c:if>
            </div>
                 <!-- 드롭다운 -->
			<c:if test="${user.id eq 'admin'}">
	            <div class="nav-item dropdown" >
	                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">관리자 메뉴</a>
	                <div class="dropdown-menu fade-up m-0">
	                    <a href="adminGetIncome.do" class="dropdown-item">매출관리</a>
	                    <a href="adminGetMenuList.do" class="dropdown-item">메뉴관리</a>
	                    <a href="adminGetMemberList.do" class="dropdown-item">회원관리</a>
	                    <a href="adminGetOrderList.do" class="dropdown-item">주문관리</a>
	                </div>
	            </div>
			</c:if>
            
            <a href="menuView.do" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">味 보러가기<i class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    <!-- Navbar End -->