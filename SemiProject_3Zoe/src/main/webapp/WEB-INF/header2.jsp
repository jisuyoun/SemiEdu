<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>

<title>워너에듀</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/mainPageStyle.css" />

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<!-- jQueryUI CSS 및 JS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

	<!-- 상단 네비게이션 시작 -->
	<div id="loginBar" style="text-align: right;">
	
		<button type="button" class="btn btn-light" id="loginBtn" href="#">
			<i class="fa-regular fa-circle-user" style="margin-right: 10px;"></i>회원명
		</button>
		<button type="button" class="btn btn-light" id="registerBtn" href="#">
			<i class="fa-solid fa-arrow-right-from-bracket" style="margin-right: 10px;"></i>로그아웃
		</button>
		<button type="button" class="btn btn-light" id="registerBtn" href="#">
			<i class="fa-solid fa-cart-shopping" style="margin-right: 10px;"></i>장바구니
		</button>
	
		<form style="display: inline-block;">
			<img src="images/searching.png" class="img-search" width="30px;">
			<input type="text" class="search" name="search" placeholder="Search.." autocomplete="off">
		</form>
	
	</div>



	<!-- Brand/logo --> <!-- Font Awesome 5 Icons -->
	<nav class="navbar">
		<a class="navbar_brand" href="<%= ctxPath%>/index.third" style="margin-right: 10%;"><img src="<%= ctxPath %>/images/logo1.png" /></a>
		
  	<div class="menu">
		<div class="dropdown">
		  <button class="dropbtn">수강신청</button>		  
		    <div class="dropdown-content">
		      <a href="#">정보처리</a>
		      <a href="#">빅데이터분석</a>
		      <a href="#">전자계산기</a>
		      <a href="#">패키지</a>
		    </div>
		  </div> 
		  
		  <div class="dropdown">
		    <button class="dropbtn">고객센터</button>
		    <div class="dropdown-content">
		      <a href="#">공지사항</a>
		      <a href="#">서비스문의</a>
		      <a href="#">자주하는질문</a>
		      <a href="#">수강후기</a>
		      <a href="#">카카오톡 문의</a>
		      <a href="#">이벤트</a>
		    </div>
		    
		  </div>
		  <a href="#" class="mypage bgColor"><i class="fa-solid fa-user" style="margin-right: 10px;"></i>마이페이지</a>
	  </div>
	</nav>
	<!-- 상단 네비게이션 끝 -->
	
	


	

 
	



    