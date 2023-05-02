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

    <title>관리자페이지</title>
    
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

</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"> 
<body style="height:1500px;" class="">
		
	<nav class="navbar-expand fixed-top " id ="navId" >
	  <a href="<%= ctxPath %>/index.go"><img src="https://cdn.malgnlms.com/cdndata/kense/file/e69e843b2e715ad0390d80e8e54d2a97.png" style="width:150px; " alt="워너에듀" class="svg_logo"></a>
	  <ul class="navbar-nav" style="width: 100%; display: flex; justify-content: space-between;">
	
	    
	    <li class="nav-item ">
	    	<button type="button" class="btn text-light btn-sm" id="myPageB" onclick = "location.href = '<%= ctxPath%>/pes.admin/adminPage.go'">관리자페이지</button>
	    </li>

	    <li class="nav-item " style="display: flex; align-items: center;">
	      <p style="margin-bottom: 0;">
	      	<span><b>${(sessionScope.loginuser).name}</b>님</span>
	      	<span style="margin: 0 20px 0 15px;"><b>|</b></span>
	      
	      	<a href="<%= ctxPath %>/index.go" style="margin-right: 20px;"><i class="fa fa-fw fa-home text-body"></i><b class="text-body">홈으로</b></a>
	      	<a href="#"><i class="fa-solid fa-arrow-right-from-bracket text-body"></i><b class="text-body">로그아웃</b></a>
	      </p>
	    </li>
	  </ul>
	</nav>
	
	
	
<div class="sidenav" >

  <button class="dropdown-btn"><i class="fa-solid fa-user"></i>회원 관리
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="<%= ctxPath%>/pes.admin/memberList.go">- 회원목록</a>
    <a href="<%= ctxPath%>/pes.admin/loginHistory.go">- 회원 로그인기록</a>

  </div>
 
  <hr>
  
  <a href="<%= ctxPath%>/pes.admin/productRegister.go" style="text-decoration: none;"><i class="fa-solid fa-video"></i>강좌등록</a>
  
  <hr>

  
  <button class="dropdown-btn"><i class="fa-solid fa-pen" ></i>게시글 작성
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="<%= ctxPath%>/pes.admin/noticeAdd.go">- 공지사항 작성</a>
    <a href="<%= ctxPath%>/pes.admin/eventAdd.go">- 이벤트 작성</a>
  </div>

  <hr>
  
  <a href="<%= ctxPath%>/pes.admin/orderList.go" style="text-decoration: none;"><i class="fa-solid fa-coins"></i>전체주문내역</a>
  
  <hr>

</div>

