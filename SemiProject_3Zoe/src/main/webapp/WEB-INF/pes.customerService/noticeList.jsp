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
		
		<form class="noticeSearch">

			<input type="text" name="s_keyword" class="es_input_search" title="검색어" placeholder="검색어를 입력해주세요" />
			<input type="image" src="../es_noticeImages/search.png" class="btn_search" style="height: 25px;" onclick="goSearch();" />
		</form>
	
		<table id="noticeTitle" >
	        <thead>
	           <tr>
	              <th style="width: 80px; height: 65px; color: #222; background-color: #f9f9f9; text-align:center;">NO</th>
	              <th style="width: 750px; color: #222; background-color: #f9f9f9; text-align:center;">제목</th>
	              <th style="color: #222; background-color: #f9f9f9; text-align:center;">작성자</th>
	              <th style="color: #222; background-color: #f9f9f9; text-align:center;">등록일</th>
	              <th style="color: #222; background-color: #f9f9f9; text-align:center;">조회수</th>
	           </tr>
	        </thead>	
	        
	        <tbody>
		        <c:if test="${not empty requestScope.lists}">
		        	<c:forEach var="nvo" items="${lists}">
		        	<tr class="noticeList">
		        	 	<th style="width: 80px; text-align:center;">${nvo.notice_seq}</th>		        	 			          
			            <td class="noticeTitle"><a href="<%= ctxPath%>/pes.customerService/noticeDetail.go?notice_seq=${nvo.notice_seq}">${nvo.title}</a></td>
			            <td class="noticeWirter">테스트관리자</td>
			            <td class="noticeWriteDate">${nvo.writeDate2}</td>
			            <td class="noticeReadcount">${nvo.readcount}</td>
			        </tr>
			        </c:forEach>
		        </c:if>	
		        <c:if test="${empty requestScope.lists}">
		        	<tr>
		        	  <td></td>
		              <td colspan="4">등록된 공지사항이 없습니다.</td>
	           		</tr>
		        </c:if>
	        </tbody>
		</table>        
	        
        
    
    <nav class="my-5">
        <div style='display:flex; width:80%;'>
          <ul class="pagination" style='margin:auto;'>${requestScope.pageBar}</ul>
       </div>
    </nav>    

	</div>
	
	<%-- notice Contents 끝 --%>



</body>

<jsp:include page="../footer.jsp" />

