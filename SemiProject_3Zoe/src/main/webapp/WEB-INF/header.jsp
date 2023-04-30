<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
  
<script type="text/javascript">

	$(document).ready(function(){
	    
	    
	    
	});
	
	function goLogOut() {
   
    // 로그아웃을 처리해주는 페이지로 이동
    location.href="<%=request.getContextPath()%>/login/logout.go";
      
   }// end of function goLogOut(){}---------------------------------
   
</script>

	
	<%-- *** 로그인 전 상단바 화면 *** --%>
	<c:if test="${empty sessionScope.loginuser}">   
	   <div id="loginBar" style="text-align: right;">
	   
	      <a type="button" class="btn btn-light" id="loginBtn" href ="<%= ctxPath%>/login/login.go">
	         <i class="fa-solid fa-arrow-right-to-bracket" style="margin-right: 10px;"></i>로그인
	      </a>
	      <button type="button" class="btn btn-light" id="registerBtn" href="#">
	         <i class="fa-solid fa-user-plus" style="margin-right: 10px;"></i>회원가입
	      </button>
	   
	      <form style="display: inline-block;">
	         <img src="images/searching.png" class="img-search" width="30px;">
	         <input type="text" class="search" name="search" placeholder="Search.." autocomplete="off">
	      </form>
	   
	   </div>
   </c:if>
  
   <%-- *** 로그인 후 상단바 화면 *** --%>
   <c:if test="${not empty sessionScope.loginuser}">
      <div id="loginBar" style="text-align: right;">
   
      <button type="button" class="btn btn-light" id="loginBtn" href="#">
         <i class="fa-regular fa-circle-user" style="margin-right: 10px;"></i>${(sessionScope.loginuser).name}
      </button>
      <button type="button" class="btn btn-light" id="registerBtn" onclick="goLogOut();" >
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

   </c:if>



	<!-- Brand/logo --> <!-- Font Awesome 5 Icons -->
	<nav class="navbar">
		<a class="navbar_brand" href="<%= ctxPath%>/index.go" style="margin-right: 10%;"><img src="<%= ctxPath %>/images/logo1.png" /></a>
	
  	<div class="menu">
		<div class="dropdown">
		  <button type="button" class="dropbtn" onclick= "location.href='<%= ctxPath%>/cos/yjs_CosRegister.go'">수강신청</button>		  
		    <div class="dropdown-content">
		      <a href="<%= ctxPath%>/hyh.order/payment.go">정보처리</a>
		      <a href="#">빅데이터분석</a>
		      <a href="#">전자계산기</a>
		      <a href="#">패키지</a>
		    </div>
		  </div> 
		  
		  <div class="dropdown">
		    <button type="button" class="dropbtn" onclick= "location.href='<%= ctxPath%>/pes.customerService/notice.go'">고객센터</button>
		    <div class="dropdown-content">
		      <a href="<%= ctxPath%>/pes.customerService/notice.go">공지사항</a>
		      <a href="<%= ctxPath%>/pes.customerService/question.go">자주하는질문</a>
		      <a href="<%= ctxPath%>/hyh.customerService/reviewCourse.go">수강후기</a>
		      <a href="<%= ctxPath%>/hyh.customerService/event.go">이벤트</a>
		    </div>
		    
		  </div>
	 
	 
	 
	 	<%-- 로그인 전 메인페이지 --%>
	 	<c:if test="${sessionScope.loginuser == null}"> 
	       <a href="<%= ctxPath%>/login/login.go" class="mypage bgColor"><i class="fa-solid fa-user" style="margin-right: 10px;"></i>마이페이지</a>
	    </c:if>
	 	
	 
	    <%-- 관리자계정 로그인 할 경우 메인페이지 --%>
	 	<c:if test="${sessionScope.loginuser != null and sessionScope.loginuser.userid == 'testadmin'}"> 
	       <a href="<%= ctxPath%>/pes.admin/adminPage.go" class="mypage bgColor" style="width: 160px;"><i class="fa-solid fa-user" style="margin-right: 10px;"></i>관리자페이지</a>
	    </c:if>
		     
		     
		<%-- 회원 로그인 할 경우 메인페이지 --%>     
	    <c:if test="${sessionScope.loginuser != null and sessionScope.loginuser.userid ne 'testadmin'}"> 
	    	
			<a href="<%= ctxPath%>/ljh.member.controller/myPage.go" class="mypage bgColor"><i class="fa-solid fa-user" style="margin-right: 10px;"></i>마이페이지</a>
	    </c:if>
	 
	 
	 
	  </div>
	</nav>
	<!-- 상단 네비게이션 끝 -->
	
	
	<!-- to Top btn 끝 -->
	<div class="myfixed div_table">
	   	<div id="div_table_cell">  
	   		<button onclick="topFunction()" id="myBtn" title="Go to top"><img src="<%=request.getContextPath()%>/images/topFixed.png" style="width: 80px; height: 80px;" alt="goToTop" /></button>
	   	</div>
	</div> 
	<!-- to Top btn 끝 -->
	
	</nav>
	
	
	
</head>

