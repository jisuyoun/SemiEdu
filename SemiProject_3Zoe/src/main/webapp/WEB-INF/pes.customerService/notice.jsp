<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="../header.jsp" /> 


<style>

	<%-- 상단 title 시작 --%>
	div.es_bar {
	    width: 100%;
	    height: 200px;
	    background-size: contain;
	    top: 0;
	    left: 0;
	}
	
	#page_title {
	    position: relative;
	    font-size: 40pt;
	    top: -140px;
	    color: #fff;
	    text-align: center;
	    font-weight: bold;
	}

	.es_dropbtn {
		position: relative;
	    color: white;
	    font-size: 14px;
	    border: none;
	    cursor: pointer; 
	    top: -130px;
	    left: 1300px;
	    background-color: inherit;
	}
	
	.es_dropdown {
	    position: relative;
	    display: inline-block;
	   
	}
	
	.es_dropdown-content {
	    display: none;
	    position: absolute;
	    background-color: white;
	    border-radius: 10px;
	    margin-top: 10px; 
	    min-width: 120px;
	    overflow: auto;
	    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	    border: solid 1px #ddd;
	    font-size: 12pt;
	}
	
	.es_dropdown-content a {
	    color: gray;
	    padding: 5px 2px;
	    text-decoration: none;
	    display: block;
	}

	.es_dropdown-content a:hover {
		color: #1BCEB8;
	} 

	.show {display: block;}
	<%-- 상단 title 끝 --%>	
	
	
	<%-- notice Contents 시작 --%>
	.es_input_search {
		border: solid 1px #ddd;
		height: 50px;
		width: 280px;
		border-radius: 5px;
	}
	.noticeSearch {
		width: 60%;
		margin: 20px auto;
		text-align: right;
		margin-top: 100px;
	}
	
	
	tr.memberInfo:hover {
		background-color: #e6ffe6; 
		cursor: pointer;
	}
	
	table#noticeTitle{
		width: 60%;
		margin: 20px auto;
		border-top: 1px solid #444444;
    	border-collapse: collapse;
    	font-size: 12pt;
	}

    th, tr {
	    border-bottom: 1px solid #ddd;
	    padding: 10px;
	}
	
	tr {
		height: 60px; 
	}


	<%-- notice Contents 끝 --%> 
	
	

</style>



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
	
	
	
	<%-- notice Contents 시작 --%>
	$(document).ready(function(){
		
		 // trim 을 사용하지 않았을 경우 띄어쓰기만 하고 검색한 것도 검색 후 검색창에 유지된다.
		
	<%--	 if( "${fn:trim(requestScope.searchWord)}" != "" ){		--%>
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
		
		
		// 특정 회원을 클릭하면 그 회원의 상세정보를 보여주도록 한다.
		$("tr.memberInfo").click( (e) => {
		//	alert( $(e.target).parent().find(".userid").text() );
		
			const userid = $(e.target).parent().find(".userid").text();
			location.href="<%= ctxPath%>/member/memberOneDetail.up?userid="+userid;
		});
		
	});// end of $(document).ready(function(){})-----------------------------
	
	// Function Declaration
	function goSearch(){
		
		const frm = document.memberFrm;			
	
		frm.action = "memberList.up";
		frm.method = "get";
		frm.submit();
	};
	<%-- notice Contents 끝 --%>
	

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
		       <a href="<%= ctxPath%>/customerService/announcement.go">고객센터</a>
		    </div>
	    </button>
	    
	    <button onclick="myFunction2()" class="es_dropbtn" style="color:#ffffff; font-size: 14pt;"> 공지사항 <i class="fa-solid fa-circle-chevron-down" style="color: #ffffff; margin: 0 10px;"></i>|
		    <div id="myDropdown2" class="es_dropdown-content">
		       <a href="<%= ctxPath%>/customerService/announcement.go">공지사항</a>
		       <a href="<%= ctxPath%>/customerService/question.go">자주하는질문</a>
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
		        <c:if test="${empty requestScope.memberList}">
		        	<tr>
		        	  <th style="width: 80px; text-align:center;">  </th>
		              <td colspan="4">게시된 공지사항이 없습니다.</td> <%-- 5개 칼럼을 colspan 으로 묶어줌 --%>
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

