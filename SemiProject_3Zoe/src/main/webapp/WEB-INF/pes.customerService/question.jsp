<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

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
	  text-decoration: none; 
	} 

	.es_dropdown a:hover {color: #1BCEB8;}

	.show {display: block;} 
	<%-- 상단 title 끝 --%>	
	
	
	<%-- 카테고리 div 시작 --%>
	ul {
		list-style: none;
	}
	
	li {
		float: left;
	}
	
	div.menu_cont {
		margin: 0 auto;
	}
	
	.question_menu {
		border: solid 1px #ddd;
		height: 80px;
		width: 60%; 
		display: flex;
		margin: 50px auto;
		padding: 0 auto;
		align-items: center;
		border-radius: 20px;
	}
	
	.tab_title a {
		margin: 0 20px;
		font-size: 14pt;
	}
	
	.tab_title a:hover {
		color: #1BCEB8; 		
		font-weight: bold;
	}
	<%-- 카테고리 div 끝 --%>
	
	<%-- 검색창 --%>
	.es_input_search {
		border: solid 1px #ddd;
		height: 50px;
		width: 280px;
		border-radius: 5px;
	}
	.questionSearch {
		width: 60%;
		margin: 20px auto;
		text-align: right;
		margin-top: 50px;
	}

	<%-- 자주하는질문List 효과 시작 --%>
	div#openSection {
		width: 60%;
		margin: 0 auto;
		border-top: 1px solid #444444; 
		border-bottom: 1px solid #ddd;
	} 
	
	.collapsible {
	  background-color: white;
	  color: #222;
	  border-top: 1px solid #444444;
	  border-bottom: 1px solid #ddd;
	  cursor: pointer;
	  padding: 18px;
	  width: 100%;
	  border: none;
	  text-align: left;
	  outline: none;
	  font-size: 15px; 
	}
	
	.active, .collapsible:hover {
	  background-color: #ddd; 
	}
	
	.es_content {
	  padding: 0 18px;
	  background-color: white;
	  max-height: 0;
	  overflow: hidden;
	  transition: max-height 0.2s ease-out;
	}
	<%-- 자주하는질문List 효과 끝 --%>
	

</style>
</head>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	
	<%-- 상단 title 시작 --%>
	/* When the user clicks on the button, 
	toggle between hiding and showing the dropdown content */
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
		<%-- 상단 title 끝 --%>	
		
		
		<%-- 카테고리 이동 --%>
		addEvent("onload", function() { $('#category-').addClass("active"); });
		
		
		<%-- 자주하는질문List 효과 시작 --%>	
		var coll = document.getElementsByClassName("collapsible");
		var i;

		for (i = 0; i < coll.length; i++) {
		  coll[i].addEventListener("click", function() {
		    this.classList.toggle("active");
		    var es_content = this.nextElementSibling;
		    if (es_content.style.display === "block") {
		    	es_content.style.display = "none";
		    } else {
		    	es_content.style.display = "block";
		    }
		  });
		}
		<%-- 자주하는질문List 효과 끝 --%>
		
		

</script>
<jsp:include page="../header.jsp" /> 




<body>

	<%-- 상단 title 시작 --%>
	<div class="es_bar">
		<img class="bar" src="<%= ctxPath %>/images/bar배경.png" style="width: 100%; height: 200px;"/>
		<h2 id="page_title">자주하는질문</h2>
		
		<button onclick= "location.href='<%= ctxPath%>/index.go'" class="es_dropbtn"><i class="fa-solid fa-house" style="color: #ffffff; font-size: 16pt; margin: 0 10px;"></i>|</button>

	    <button onclick="myFunction()" class="es_dropbtn" style="color:#ffffff; font-size: 14pt;"> 고객센터 <i class="fa-solid fa-circle-chevron-down" style="color: #ffffff; margin: 0 10px;"></i>|
		    <div id="myDropdown" class="es_dropdown-content">
		       <a href="#">수강신청</a>
		       <a href="<%= ctxPath%>/customerService/announcement.go">고객센터</a>
		    </div>
	    </button>
	    
	    <button onclick="myFunction2()" class="es_dropbtn" style="color:#ffffff; font-size: 14pt;"> 자주하는질문 <i class="fa-solid fa-circle-chevron-down" style="color: #ffffff; margin: 0 10px;"></i>|
		    <div id="myDropdown2" class="es_dropdown-content">
		       <a href="<%= ctxPath%>/customerService/announcement.go">공지사항</a>
		       <a href="<%= ctxPath%>/customerService/question.go">자주하는질문</a>
		       <a href="#">수강후기</a>
		       <a href="#">이벤트</a>
		    </div>
	    </button>
		
	</div>
	<%-- 상단 title 끝 --%>
	
	
	
	<div id="content" style="height: 500px;">
	
		<div class="question_menu">
		    <div class="menu_cont">
		        <ul>
		            <li class="tab_title" id="category-"><a class="es_question_menu" href="<%= ctxPath%>/customerService/question.go">전체</a></li>
		            
		            <li class="tab_title" id="category-2390"><a href="#">회원정보관리</a></li>
		            
		            <li class="tab_title" id="category-2391"><a href="#">수강 및 교재</a></li>
		            
		            <li class="tab_title" id="category-2392"><a href="#">결제/취소/환불</a></li>
		            
		            <li class="tab_title" id="category-2393"><a href="#">동영상&기기관련</a></li>
		        </ul>
		    </div>
		</div>
		
		
		<form class="questionSearch">

			<input type="text" name="s_keyword" class="es_input_search" title="검색어" placeholder="검색어를 입력해주세요" />
			<input type="image" src="../es_noticeImages/search.png" class="btn_search" style="height: 25px;" onclick="goSearch();" />
		</form>
	
		<%-- 자주하는질문List 효과 시작 --%>
		<div id="openSection">
			<button type="button" class="collapsible">Open Section 1</button>
			<div class="es_content">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
			<button type="button" class="collapsible">Open Section 2</button>
			<div class="es_content">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
			<button type="button" class="collapsible">Open Section 3</button>
			<div class="es_content">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
		</div>
		<%-- 자주하는질문List 효과 끝--%>
		
	</div>
	
	

</body>

</html>
<jsp:include page="../footer.jsp" />