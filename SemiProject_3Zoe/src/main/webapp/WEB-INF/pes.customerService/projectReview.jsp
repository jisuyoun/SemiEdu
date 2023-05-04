<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/questionStyle.css" />

<style type="text/css">

	div#es_collapsible {
		margin: 100px auto;
	}
	
	.collapsible {
		font-size: 25px;
		padding-left: 50px;
		color: black;
		font-weight: bold;
	}

	.fa-user-graduate {
		width: 30px;
		height: 30px;
		font-size: 30px;
		color: #1bceb8;
		margin: 0 20px;
	}
	
	.content {
		font-size: 20px;
		padding-top: 20px;
	}
	
</style>

</head>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	
	<%-- 상단 title dropdown 시작 --%>
	function myFunction() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}
	
	window.onclick = function(event) {
	  if (!event.target.matches('.es_dropbtn')) {
	    var dropdowns = document.getElementsByClassName("es_dropdown-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      }
	    }
	  }
	}
	
	
	function myFunction2() {
		  document.getElementById("myDropdown2").classList.toggle("show");
		}
		
		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
		  if (!event.target.matches('.es_dropbtn')) {
		    var dropdowns = document.getElementsByClassName("es_dropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		  }
		}
		<%-- 상단 title dropdown 끝 --%>	
		
		
		<%-- 카테고리 이동 --%>
		addEvent("onload", function() { $('#category-').addClass("active"); });
		


</script>
<jsp:include page="../header.jsp" /> 




<body>

	<%-- 상단 title 시작 --%>
	<div class="es_bar">
		<img class="bar" src="<%= ctxPath %>/images/bar배경.png" style="width: 100%; height: 200px;"/>
		<h2 id="page_title">프로젝트를 마치며 소감</h2>
		
		<button onclick= "location.href='<%= ctxPath%>/index.go'" class="es_dropbtn"><i class="fa-solid fa-house" style="color: #ffffff; font-size: 16pt; margin: 0 10px;"></i>|</button>

	    <button onclick="myFunction()" class="es_dropbtn" style="color:#ffffff; font-size: 14pt;"> 고객센터 <i class="fa-solid fa-circle-chevron-down" style="color: #ffffff; margin: 0 10px;"></i>|
		    <div id="myDropdown" class="es_dropdown-content">
		       <a href="#">수강신청</a>
		       <a href="<%= ctxPath%>/pes.customerService/noticeList.go">고객센터</a>
		    </div>
	    </button>
	    
	    <button onclick="myFunction2()" class="es_dropbtn" style="color:#ffffff; font-size: 14pt;"> 자주하는질문 <i class="fa-solid fa-circle-chevron-down" style="color: #ffffff; margin: 0 10px;"></i>|
		    <div id="myDropdown2" class="es_dropdown-content">
		       <a href="<%= ctxPath%>/pes.customerService/noticeList.go">공지사항</a>
		       <a href="<%= ctxPath%>/pes.customerService/question.go">자주하는질문</a>
		       <a href="#">수강후기</a>
		       <a href="#">이벤트</a>
		    </div>
	    </button>
		
	</div>
	<%-- 상단 title 끝 --%>
	

		
		
<div id="es_collapsible">
	<button type="button" class="collapsible"><i class="fa-solid fa-user-graduate"></i>박 은 서</button>
	<div class="content">
	  <p>처음 시작은 조원들과 4개월간의 교육을 복습한다는 생각으로 가볍게 시작한 첫 프로젝트였습니다.<br><br>
	     하지만 프로젝트가 진행될수록 기능을 하나라도 더 구현하고 싶은 마음에 때론 조급함을 느끼기도 하고,<br><br>
		 내실력을 더 향상하여 사용자가 사용하기에 더 좋은 웹사이트를 만들었으면 좋겠다는 생각을 가지게는 동기가 되기도 했습니다.<br><br><br><br>
	     조원들과의 첫협업에도 많은걸 느낄 수 있었습니다.<br><br>
		 나의 페이지만을 완성하는 것이 목표가 아닌, 하나의 사이트로써 팀원들과의 소통과 정보교류가 중요하단 것을<br><br>
		 말이 아닌 직접 몸소 느낄 수 있는 유익한 시간이였습니다.</p>
	</div>
	<button type="button" class="collapsible"><i class="fa-solid fa-user-graduate"></i>서 상 현</button>
	<div class="content">
	  <p>아이폰이나 아이패드의 경우 다운로드 버튼이 보이지 않는 경우가 있습니다. <br><br> 설정 - 사파리 들어가셔서 데스크탑웹사이트요청 해제 부탁드립니다.</p>
	</div>
	<button type="button" class="collapsible"><i class="fa-solid fa-user-graduate"></i>윤 지 수</button>
	<div class="content">
	  <p>스스로 구현해보고 싶은 기능들을 생각해보고 스스로 공부하거나 여러 사람의 도움을 받으며<br><br>
		 여러 시행착오를 겪으며 구현함으로써 수업시간에 배웠던 내용들을 더욱 이해하게 되는 좋은 기회를 가질 수 있었습니다. <br><br>
		 처음으로하게된 프로젝트라서 시작할 때는 어떤 과정을 통해 시작을 할 지 감도 잡지 못하였으나,<br><br>
		 이번 프로젝트를 통해 하나의 프로젝트의 큰 흐름을 알 수 있게 되었습니다.<br><br>
		 문제가 생겼을 때 자신의 문제인 것처럼 많은 도움을 준 팀원들에게 감사하며,<br><br>
		 다음 프로젝트에서는 이번 프로젝트를 통해 배운 점들을 적용하여 더욱 좋은 결과물을 만들 수 있도록 하겠습니다.</p>
	</div>
	<button type="button" class="collapsible"><i class="fa-solid fa-user-graduate"></i>이 지 현</button>
	<div class="content">
	  <p>수업시간에 배울 때는 이해가 됐지만 직접 짜보니 확실히 어려웠다.<br><br>
		처음에 코딩할 때는 많이 버벅이고 jsp와 java부분이 헷갈려서 초반에 시간을 많이 썼다.<br><br>
		하지만 점점 하다보니까 익숙해졌고 확실히 직접 코딩을 해보니 더 응용력도 생기고<br><br>
		실력도 늘은 것 같아서 파이널 프로젝트가 기대된다.<br><br>
	  </p>
	</div>
	<button type="button" class="collapsible"><i class="fa-solid fa-user-graduate"></i>홍 용 훈</button>
	<div class="content">
	  <p>관리자에게 별도 문의 부탁드립니다. </p>
	</div>
</div>

<script>

	<%-- 자주하는질문List 효과 시작 --%>
	var coll = document.getElementsByClassName("collapsible");
	var i;
	
	for (i = 0; i < coll.length; i++) {
	  coll[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var content = this.nextElementSibling;
	    if (content.style.display === "block") {
	      content.style.display = "none";
	    } else {
	      content.style.display = "block";
	    }
	  });
	}
	<%-- 자주하는질문List 효과 끝 --%>
	
</script>
	
	
	

</body>

</html>
<jsp:include page="../footer.jsp" />