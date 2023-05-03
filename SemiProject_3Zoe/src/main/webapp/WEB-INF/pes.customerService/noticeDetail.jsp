<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="../header.jsp" /> 

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/noticeStyle.css" />


<script type="text/javascript">

	<%-- 상단 title dropdown content 시작 --%>
	function myFunction() {
	  document.getElementById("myDropdown").classList.toggle("show");
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
	<%-- 상단 title dropdown content 끝 --%>	
	
	
	
	<%-- notice 검색 시작 --%>
	$(document).ready(function(){
		
		 // trim 을 사용하지 않았을 경우 띄어쓰기만 하고 검색한 것도 검색 후 검색창에 유지된다.
		
		if("${requestScope.searchType}" != "" &&
		   "${requestScope.searchWord}" != ""){	
			$("select#searchType").val("${requestScope.searchType}");
			$("input#searchWord").val("${requestScope.searchWord}");
		}
		 
		 $("select#sizePerPage").val("${requestScope.sizePerPage}");
	
		$("input#searchWord").keyup(function (e) {
			
			if(e.keyCode == 13){ // 검색어에서 엔터를 하면 검색하러 가도록 한다. 
				goSearch();
			}			
		});
		
		
		// **** select 태그에 대한 이벤트는 click 이 아니라 change 이다. ****//
		$("select#sizePerPage").bind("change", function(){ 
			goSearch();
			
		});//end of $("select#sizePerPage").bind("change", function(){})----------

	});// end of $(document).ready(function(){})-----------------------------
	
	// Function Declaration
	function goSearch(){
		
		const frm = document.memberFrm;			
	
		frm.action = "noticeList.go";
		frm.method = "get";
		frm.submit();
	};
	<%-- notice 검색 끝 --%>
	
	
    		
	

</script>



<body>

	<%-- 상단 title 시작 --%>
	<div class="es_bar">
		<img class="bar" src="<%= ctxPath %>/images/bar배경.png" style="width: 100%; height: 200px;"/>
		<h2 id="page_title">공지사항</h2>

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
	<%-- 상단 title 끝 --%>
	
	
	
	<%-- notice Contents 시작 --%>
	<div id="content" style="height: 1000px;">
		
		 

	</div>
	
	<%-- notice Contents 끝 --%>



</body>

<jsp:include page="../footer.jsp" />

