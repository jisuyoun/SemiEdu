<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%	
    String ctxPath = request.getContextPath();
%>   

<jsp:include page="../header.jsp" />

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/ReviewRegister.css" />


<script type="text/javascript">

	/* dropdown buttons to toggle */
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;
	
	for (i = 0; i < dropdown.length; i++) {
	  dropdown[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var dropdownContent = this.nextElementSibling;
	    if (dropdownContent.style.display === "block") {
	      dropdownContent.style.display = "none";
	    } else {
	      dropdownContent.style.display = "block";
	    }
	  });
	}
	

	
	$(document).ready(function(){
		
		
		 
		    
	});//end of $(document).ready(function(){})-------------------------------
	
	function registerReivew() {
		
		var myformfrm = document.myform;
		
		myformfrm.method = "POST";
		myformfrm.action = "<%= ctxPath%>/yjs.cos/yjs_ReviewRegister.go";
		myformfrm.submit();
			
	}
	
</script>


	<%-- 최상단메뉴바 시작 --%>
	<div class="es_bar">
		<img class="bar" src="<%= ctxPath %>/images/bar배경.png" style="width: 100%; height: 200px;"/>
		<h2 id="page_title">후기등록</h2>

		<button onclick= "location.href='<%= ctxPath%>/index.go'" class="es_dropbtn"><i class="fa-solid fa-house" style="color: #ffffff; font-size: 16pt; margin: 0 10px;"></i>|</button>

	    <button onclick="myFunction()" class="es_dropbtn" style="color:#ffffff; font-size: 14pt;"> 고객센터 <i class="fa-solid fa-circle-chevron-down" style="color: #ffffff; margin: 0 10px;"></i>|
		    <div id="myDropdown" class="es_dropdown-content">
		       <a href="#">수강신청</a>
		       <a href="<%= ctxPath%>/pes.customerService/noticeList.go">고객센터</a>
		    </div>
	    </button>
	    
	    <button onclick="myFunction2()" class="es_dropbtn" style="color:#ffffff; font-size: 14pt;"> 공지사항 <i class="fa-solid fa-circle-chevron-down" style="color: #ffffff; margin: 0 10px;"></i>|
		    <div id="myDropdown2" class="es_dropdown-content">
		       <a href="<%= ctxPath%>/pes.customerService/noticeList.go">공지사항</a>
		       <a href="<%= ctxPath%>/pes.customerService/question.go">자주하는질문</a>
		       <a href="#">수강후기</a>
		       <a href="#">이벤트</a>
		    </div>
	    </button>

	</div>	
	<%-- 최상단메뉴바 끝 --%>

<form class="mb-3" name="myform" id="myform" method="post">
	<fieldset>
		<input type="text" name="reviewTitle" id="reviewTitle" placeholder="수강후기 제목을 적어주세요!" />
		<input type="hidden" name="userid" value="${sessionScope.loginuser.userid}" />
		<input type="hidden" name="courseCode" value="${requestScope.courseCode}" />
		<div class="text-bold" id="text-bold">별점을 선택해주세요</div>
		<div id="starPosition">
			<input type="radio" name="reviewStar" value="5" id="rate1"><label
				for="rate1">★</label>
			<input type="radio" name="reviewStar" value="4" id="rate2"><label
				for="rate2">★</label>
			<input type="radio" name="reviewStar" value="3" id="rate3"><label
				for="rate3">★</label>
			<input type="radio" name="reviewStar" value="2" id="rate4"><label
				for="rate4">★</label>
			<input type="radio" name="reviewStar" value="1" id="rate5"><label
				for="rate5">★</label> 
		</div>
	</fieldset>
	<div>
		<textarea class="col-auto form-control" type="text" name="reviewContent" id="reviewContents"
				  placeholder="수강후기는 여기에 적어주세요!"></textarea>
	</div>
	<button id="RRReviewRegister" onClick="registerReivew();">수강등록</button>
</form>				
	
	<jsp:include page="../footer.jsp" />


