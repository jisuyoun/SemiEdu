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
	  <p>강의교안의 경우 pdf로 제공됩니다. 하지만 저작권문제로 비밀번호가 설정이 되어 편집이 불가합니다. <br><br> 태블릿의 경우 플렉슬과 같은 어플을 이용하시면 필기가 가능합니다.</p>
	</div>
	<button type="button" class="collapsible"><i class="fa-solid fa-user-graduate"></i>서 상 현</button>
	<div class="content">
	  <p>아이폰이나 아이패드의 경우 다운로드 버튼이 보이지 않는 경우가 있습니다. <br><br> 설정 - 사파리 들어가셔서 데스크탑웹사이트요청 해제 부탁드립니다.</p>
	</div>
	<button type="button" class="collapsible"><i class="fa-solid fa-user-graduate"></i>윤 지 수</button>
	<div class="content">
	  <p>크롬 원격 프로그램이 설치되어 있는 경우 나타나는 메시지입니다. <br><br> 해결방법<br>- 크롬 확장프로그램에서 Chrome Remote Desktop 프로그램 삭제 부탁드립니다.<br>
	  또한 엣지 브라우져에도 설치되어 있는 경우가 있으니 엣지 확장프로그램도 확인 후 삭제 부탁드립니다.<br><br>만약 크롬원격 프로그램을 꼭 사용하셔야 하는경우 해결방법<br>
	  - 크롬 브라우져에서 로그아웃 후 컴퓨터 재부팅합니다. 재부팅 후 엣지나 웨일 등의 브라우져로 강의 수강 부탁드립니다.</p>
	</div>
	<button type="button" class="collapsible"><i class="fa-solid fa-user-graduate"></i>이 지 현</button>
	<div class="content">
	  <p>본 사이트는 개인정보보호법의 정보통신망 이용 촉진 및 정보보호에 관한 법률을 준수하고 있습니다. <br>회원가입 시 기재된 사항은 법률에 의거하여 보호되고 있습니다.</p>
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