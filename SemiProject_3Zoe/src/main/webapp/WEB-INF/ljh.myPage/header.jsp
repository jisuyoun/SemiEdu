<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
    String ctxPath = request.getContextPath();

%>   



<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>마이페이지</title>
    
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
    
	<!-- Font Awesome 6 Icons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	
	<!-- Optional JavaScript -->
	<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 
	
	
	<!-- jQueryUI CSS 및 JS -->
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
	<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
  
  

  
<link rel="stylesheet" href="<%= ctxPath%>/css/ljh_myPage.css">

<style type="text/css">
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"> 
<body style="height:1500px;" class="">
		
	<nav class="navbar-expand fixed-top " id ="navId" >
	  <a href="<%= ctxPath %>/index.go"><img src="https://cdn.malgnlms.com/cdndata/kense/file/e69e843b2e715ad0390d80e8e54d2a97.png" style="width:150px; " alt="워너에듀" class="svg_logo"></a>
	  <ul class="navbar-nav" style="width: 100%; display: flex; justify-content: space-between;">
	
	    
	    <li class="nav-item ">
	    	<button type="button" class="btn text-light btn-sm" id="myPageB" onclick = "location.href = '<%= ctxPath %>/ljh.member.controller/myPage.go'">마이페이지</button>
	    </li>

	    <li class="nav-item " style="display: flex; align-items: center;">
	      <p style="margin-bottom: 0;">
	      	<span><b>${(sessionScope.loginuser).name}</b>님</span>
	      	<span style="margin: 0 20px 0 15px;"><b>|</b></span>
	      
	      	<a href="<%=request.getContextPath()%>/yjs.cos/yjs_ShoppingBagPage.go" style="margin-right: 20px;"><i class="fa-solid fa-cart-shopping text-body"></i><b class="text-body">장바구니</b></a>
	      	<a href="<%= ctxPath %>/index.go" style="margin-right: 20px;"><i class="fa fa-fw fa-home text-body"></i><b class="text-body">홈으로</b></a>
	      	<a href="<%=request.getContextPath()%>/login/logout.go"><i class="fa-solid fa-arrow-right-from-bracket text-body"></i><b class="text-body">로그아웃</b></a>
	      </p>
	    </li>
	  </ul>
	</nav>

	
	
<div class="sidenav" >

  <button class="dropdown-btn"><i class="fa-solid fa-book-open" ></i>수강현황 
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="<%= ctxPath %>/ljh.member.controller/ingCourse.go">-수강중인 과정</a>
    <a href="<%= ctxPath %>/ljh.member.controller/endCourse.go">-종료된 과정</a>

  </div>
  
  <%----%>
  <hr>
  
   <a href="<%= ctxPath %>/ljh.member.controller/issueCertifi.go"><i class="fa-solid fa-money-bill" ></i>증명서발급</a> 
  
  <hr>
  
  <button class="dropdown-btn"><i class="fa-solid fa-coins"></i>결제내역 조회 
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="<%= ctxPath %>/ljh.member.controller/payDetailt.go">-결제내역 조회</a>

  </div>
  
  <hr>
  

  
  <button class="dropdown-btn"><i class="fa-regular fa-heart"></i>위시리스트
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="<%= ctxPath %>/ljh.member.controller/wishList.go">-위시리스트</a>
  </div>
  
  <hr>
  

  
  <button class="dropdown-btn"><i class="fa-solid fa-pen" ></i>회원정보 수정
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="<%= ctxPath %>/ljh.member.controller/passwdInput.go">-개인정보 수정</a>
    <a href="<%= ctxPath %>/ljh.member.controller/passwdChange.go">-비밀번호 변경</a>
  </div>

  <hr>

  <a href="<%= ctxPath %>/ljh.member.controller/deleteMember.go"><i class="fa-solid fa-user-xmark" ></i>회원탈퇴</a>
  
  <hr>
</div>

