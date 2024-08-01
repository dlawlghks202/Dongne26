
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="utf-8">
        <title>E1I4 - 동네26</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/resources/css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    </head>
    
    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Topbar Start -->
        <div class="container-fluid bg-primary px-5 d-none d-lg-block">
            <div class="row gx-0">
                <div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        <!-- 
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-twitter fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-facebook-f fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-linkedin-in fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-instagram fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle" href=""><i class="fab fa-youtube fw-normal"></i></a>
                         -->
                    </div>
                </div>  
                <div class="col-lg-4 text-center text-lg-end">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        
                        <!--<a href="http://localhost:8090/login"><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>Login</small></a>-->
        <c:choose>            
	        <c:when test="${not empty loginUserID}">
	        	<a href="http://localhost:8090/bookmark"><small class="me-3 text-light"><i class="fa fa-user me-2"></i>북마크</small></a>
	        	<a href="http://localhost:8090/myPage"><small class="me-3 text-light"><i class="fa fa-user me-2"></i>마이페이지</small></a>
	            <c:choose>
	                <c:when test="${loginType == 'google'}">
	                    <a href="${pageContext.request.contextPath}/social/logout"><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그아웃</small></a>
	                </c:when>
	                <c:when test="${loginType == 'naver'}">
	                    <a href='http://localhost:8090/callback/performLogout'><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그아웃</small></a>
	                </c:when>
	                <c:when test="${loginType == 'basic'}">
	                    <a href="${pageContext.request.contextPath}/basic/logout"><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그아웃</small></a>
	                </c:when>
	                <c:when test="${loginType == 'kakao'}">
                	 	<a href='https://kauth.kakao.com/oauth/logout?client_id=57d63923a77bfe9b2640845383c5ee17&logout_redirect_uri=http://localhost:8090/kakao/logout'>
                	 	<small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그아웃</small></a>
                	</c:when>
	            </c:choose>
	        </c:when>
	        <c:otherwise>
	        	<a href="http://localhost:8090/basic/join"><small class="me-3 text-light"><i class="fa fa-user me-2"></i>회원가입</small></a>
	        	<a href="http://localhost:8090/login"><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그인</small></a>
	        </c:otherwise>
	    </c:choose>
                        
                        <div class="dropdown">
                            <a href="#" class="dropdown-toggle text-light" data-bs-toggle="dropdown"><small><i class="fa fa-home me-2"></i></small></a>
                            <div class="dropdown-menu rounded">
                                <a href="#" class="dropdown-item"><i class="fas fa-user-alt me-2"></i> My Profile</a>
                                <a href="#" class="dropdown-item"><i class="fas fa-comment-alt me-2"></i> Inbox</a>
                                <a href="#" class="dropdown-item"><i class="fas fa-bell me-2"></i> Notifications</a>
                                <a href="#" class="dropdown-item"><i class="fas fa-cog me-2"></i> Account Settings</a>
                                <a href="#" class="dropdown-item"><i class="fas fa-power-off me-2"></i> Log Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->
        
        <!-- Navbar & Hero Start -->
        <div class="container-fluid position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="m-0"><i class="fa fa-map-marker-alt me-3"></i>동네26</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>