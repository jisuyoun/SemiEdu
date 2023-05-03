<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>

<style>
	
	<%-- 상단 title 시작 --%>
	div.yh_bar {
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
	
	div#mid {
		position: relative;
    	width: 1230px;
    	min-width: 320px;
	}
	
	div.yh_tab {
		margin: 50px auto 45px;
		border-radius: 20px;
   		border: 1px solid #ddd;
	}


	div.yh_contents {
		padding: 0 0 120px !important;
	}
	
	div.yh_innerTeb {
		text-align: center;
    	padding: 20px 10px;
    	display: block;
    	width: 100%;
	}
</style>

<title>Insert title here</title>

<body>


	<jsp:include page="../header.jsp" />
	
		<%-- 상단 title 시작 --%>
	<div class="yh_bar">
		<img class="bar" src="<%= ctxPath %>/images/bar배경.png" style="width: 100%; height: 200px;"/>
		<h2 id="page_title">이벤트</h2>

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
	
	<div id="mid" class="yh_tab">
		<div class="yh_innerTeb">
			<ul>
				<li>전체</li>
				<li>진행중</li>
				<li>종료</li>
			</ul>
		</div>
	</div>
	
	<div class="yh_contents">
		
	</div>
	

      
</body>
<jsp:include page="../footer.jsp" />
	