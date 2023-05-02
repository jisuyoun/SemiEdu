<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>


	
<jsp:include page="../header.jsp" />

<%-- 직접만든 css --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/orderPageStyle.css" />

<script type="text/javascript">

	$(document).ready(function(){
		
		var all = ${requestScope.cvo.price}-${requestScope.cvo.salePrice};
		//alert(all);
		
		$("span#salePriceText").text(all);
		 
	      $(window).on("scroll",function(){
	    	  
	    	  
	    	  <%-- 스크롤을 내릴시 리스트 상단에 고정 --%>
	          if( $(window).scrollTop() > 1100){
	        	  
	            $(".OPMenuSemi").addClass("nav-menu");
	            $(".OPMenuSemi").addClass("navbar-expand-sm fixed-top");
	        	$(".OPMenuSemi").removeClass("OPMenuSemi");
	        	
	
	          }else {
	        	  
	        	$(".nav-menu").addClass("OPMenuSemi")
	            $(".nav-menu").removeClass("nav-menu");
	        	$(".OPMenuSemi").removeClass("navbar-expand-sm fixed-top");
	        	
	        	$("span#menuIntro").removeClass("OPFont_change");
	        	$("span#menuList").removeClass("OPFont_change");
		    	$("span#menuReview").removeClass("OPFont_change");
 	
		    	
	          }
	          
	          if( $(window).scrollTop() > 900){
	        	  $("nav#showHide").show();
	          }
	          else {
	        	  $("nav#showHide").hide();
	          }
	          
	        });
	      
	      <%-- 리스트를 누르지 않고 스크롤로 이동시 해당 위치에 따라 리스트 색 변화 --%>
	      $(window).on("scroll",function(){
	    	  if( $(window).scrollTop()>=1100 && $(window).scrollTop() <= 9368 ) {
	        	  $("span#menuIntro").addClass("OPFont_change");
	        	  $("span#menuList").removeClass("OPFont_change");
	          }
	    	  else if ( $(window).scrollTop() >= 9368 ){
	    		  <%-- 수강후기와 수강목차가 추가된 것을 보고 스크롤 위치 수정하기 --%>
	    		  $("span#menuIntro").removeClass("OPFont_change");
	    		  $("span#menuList").addClass("OPFont_change");
	    		  
	    	  }
	      });
	      
	      
	      <%-- 리스트를 누를시 글자색이 변하면서 스크롤 이동 --%>
	      $("span#menuIntro").click(function(){
	    	  window.scrollTo({top:1500, behavior:'smooth'});
	    	  
	    	  $("span#menuIntro").addClass("OPFont_change");
	    	  $("span#menuList").removeClass("OPFont_change");
	    	  $("span#menuReview").removeClass("OPFont_change");
	    	  
	      });
	      
	      $("span#menuList").click(function(){
	    	  window.scrollTo({top:9368, behavior:'smooth'});
	    	  
	    	  $("span#menuIntro").removeClass("OPFont_change");
	    	  $("span#menuList").addClass("OPFont_change");
	    	  $("span#menuReview").removeClass("OPFont_change");
	      });
	      
	      $("span#menuReview").click(function(){
	    	  window.scrollTo({top:9368, behavior:'smooth'});
	    	  
	    	  $("span#menuIntro").removeClass("OPFont_change");
	    	  $("span#menuList").removeClass("OPFont_change");
	    	  $("span#menuReview").addClass("OPFont_change");
	      });

	      <%-- 수강목차 --%>
	      var coll = document.getElementsByClassName("collapsible_before");
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
	      
	      var flag = 0;
	      
	      $("button.collapsible_before").click(function(){
	    	  
	    	  if(flag == 0) {
	    	  	$(this).removeClass("collapsible_before");
	    	  	$(this).addClass("collapsible");
	    	  	flag = 1;
	    	  }
	    	  else {
	    		  $(this).removeClass("collapsible");
	    		  $(this).addClass("collapsible_before");
	    		  flag = 0;
	    	  }
	    	  
	      });
	      
	      
	      
	      $("div.OPCosReviewHideMethod").hide();
	      
	      $("div.OPCosReviewPlus").click(function(){
	    	  $(this).hide();
	    	  $("div.OPCosReviewHideMethod").show();
	      });
	      $("div.OPCosReviewHide").click(function(){
	    	  $("div.OPCosReviewHideMethod").hide();
	    	  $("div.OPCosReviewPlus").show();
	      });
	      
	      
	      /* 찜 토글 */
	      $("i#heart").click(function(){
				if(!flag) {
					$(this).removeClass("fa-regular fa-heart");
					$(this).addClass("fa-solid fa-heart").css("color", "#ff0000");
					
					flag = true;
				}
				else {
					$(this).removeClass("fa-solid fa-heart");
					$(this).addClass("fa-regular fa-heart").css("color", "#cccccc"); 
					flag = false;
				}
				
			});
 
		 $('[data-toggle="tooltip"]').tooltip(); 
		 /* 찜 토글 끝 */
	      
		 
	}); // end of document.ready
	

	function shoppingGo(){
		
		if("${sessionScope.loginuser.userid}" != ""){
			var frm = document.cartOrderFrm;
			
			frm.method = "POST";
			frm.action = "<%= ctxPath%>/yjs.cos/yjs_ShoppingBagPage.go";
			frm.submit();
			
		}
		else {
			alert("로그인이 필요한 서비스 입니다!");
		}
		
		
	};
	
</script>

	<%-- 최상단 메뉴바 시작 --%>
	<i class="fa-solid fa-share-nodes" style="color: #ffffff;"></i>
	<h1 id="OPMainName" class="container-fluid">${requestScope.cvo.courseName}</h1>
	
	<div id="OPMenu">
		<i class="fa-solid fa-house" style="color: #ffffff; font-size:15pt;"></i>
		<a id="OPLine">|</a>
		
		<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    수강신청
		</button>
		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		    <a class="dropdown-item" href="#" style="color:#00b377;">수강신청</a>
		    <a class="dropdown-item" href="#">고객센터</a>
		</div>			
	</div>
	<%-- 최상단 메뉴바 끝 --%>
		
		
	<%-- 메인 메뉴 시작 --%>	
	<div id="OPAllMain">		
		<div id="OPContainer">
			<img src="<%= request.getContextPath()%>/yjs.images/${requestScope.cvo.img1}" class="OPSellImg col-xl-6" />
			
			<div class="OPContent col-xl-6" style="background-color:white">
				<div>
					<a id="OPClassUpdate">2023년 최신강의 업데이트 완료</a>
					<h1 id="OPClassName">${requestScope.cvo.courseName}
					<a data-toggle="tooltip" title="찜!"><i id="heart" class="fa-regular fa-heart" style="color: #cccccc;"></i></a>
					</h1>
				</div>
				<div id="OPClassDate">
					<a>기간</a>
					<a style="color: gray;">${requestScope.cvo.courseTerm}일</a>
				</div>
				<div id="OPClassStatus">
					<a>강사명</a>
					<a style="color: gray;">${requestScope.cvo.teacher}</a>
				</div>
				<button type="button" id="OPPreButton"><i class="fa-brands fa-youtube" style="color: #ffffff; margin-right:10px;"></i>맛보기</button>
			</div>
			
			
		</div>
		<%-- 메인 메뉴 끝 --%>
		
		
		<%-- 강의 가격 시작 --%>
		<div id="OPPriceTable" class="col-xl-12" style="width:1200px;">
			<div id="OPPriceTitle" class="col-xl-12">
				<label><input type="checkbox" id="OPCheckbox" name="checkbox"/></label>
				<span class="badge badge-secondary">과정</span>
				<a>${requestScope.cvo.courseName}</a>
				<span id="OPSalePrice">${requestScope.cvo.salePrice}원</span><span id="OPPrice">${requestScope.cvo.price}원</span>
			</div>
			<div id="OPPrice" class="col-xl-12">
				<span>판매금액</span>
				<span style="margin:0 18px 0 40px;">${requestScope.cvo.price}원</span>
				<span>-</span>
				<span style="margin:0 40px 0 18px;">할인금액</span>
				<span id="salePriceText"></span><a>원</a>
			</div>
			
			<hr/>
			
			<div id="OPAllPrice">
				<span style="margin-right: 40px;">총 결제금액</span>
				<span>${requestScope.cvo.salePrice}원</span>
			</div>
		</div>
		<%-- 강의 가격 끝 --%>

		<%-- 하단 버튼 시작 --%>
		<nav id="showHide" class="navbar navbar-expand-sm bg-dark navbar-dark fixed-bottom" style="background-color: #f2f2f2!important; margin:0% 15%; display:none;">
		  <ul class="navbar-nav">
		    <li class="nav-item">
		    <form name="cartOrderFrm">
		    	<input type="hidden" name="courseCode" value="${requestScope.cvo.courseCode}" />
		    	<input type="hidden" name="userid" value="${sessionScope.loginuser.userid}" />
		      <button type="button" id="OPShoppingbag" onclick="shoppingGo();" ><i class="fa-solid fa-cart-shopping" style="color: #1bceb8; margin-right:10px;"></i>장바구니</button>
		    </form>
		    </li>
		    <li class="nav-item">
		      <button type="button" id="OPCosRegister"><i class="fa-solid fa-pen" style="color: #ffffff; margin-right:10px;"></i>수강신청</button>
		    </li>
		  </ul>
		</nav>
		<%-- 하단 버튼 끝 --%>
		
		
		
		<%-- 상단 메뉴 시작 --%>
		<div class="OPMenuSemi">   
			<span id="menuIntro" class="OPCursor">과정소개</span>
			<span id="menuList" class="OPCursor" style="margin: 0 91px;">강의목차</span>
			<span id="menuReview" class="OPCursor">수강후기</span>
		</div>
		<%-- 상단 메뉴 끝 --%>
		
		
		
		
		<%-- 메인 이미지 시작 --%>
		<img class="OPCosContentImg" src="<%= request.getContextPath()%>/yjs.images/cos_jeong_1_introduce1.png" />
	<%-- <img class="OPCosContentImg" src="./images/eventimg_2.png" />
		<img class="OPCosContentImg" src="./images/eventimg_3.png" style="width:1125px; margin: 0 auto;"/> --%>
		<%-- 메인 이미지 끝 --%>
		
		
		
		<%-- 패키지 추천 시작 --%>
			<div class="container" style="margin:0 300px;">
				<h4 style="margin:32px 0 25px 11px; font-weight: bold;">이 과정이 포함된 패키지</h4>
				<div class="card" style="width:290px">
	    			<img class="card-img-top" src="<%= request.getContextPath()%>/yjs.images/${requestScope.cosList.img1}" alt="Card image" style="width:100%">
	    			<div class="card-body"  style="height: 110px;">
						<h5 class="card-title">${requestScope.cosList.fk_categoryCode}</h5>
	    			</div>
				</div>
			</div>
		<%-- 패키지 추천 끝 --%>
    
    
    	<!-- 아코디언 시작 -->
		<div id="OPCosList" class="container">
			<h4 id="OPCosListSubTitle">강의목차<a style="color:#00b377; font-size:13pt; margin-left: 15px;">(총 113강)</a></h4> 
		
			<div id="OPOT">
			  <p>강의 OT</p>
			</div>
			<button type="button" class="collapsible">목차</button>
			<div class="collapsibleContent">
			  <p>1</p>
			</div>
			
			<button type="button" class="collapsible_before">${requestScope.cvo.courseList}</button>
			
		</div>
		<!-- 아코디언 끝  -->
		
		<%-- 수강 후기 시작 --%>
		<div id="OPCosReview" class="container">
			<h4 id="OPCosReviewTitle">수강후기</h4>
			<hr style="max-width: 1196px;"/>
			
			<div class="OPCosReviewStar">
				<i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
				<i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
				<i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
				<i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
				<i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
				<i class="fa-regular fa-user OPUserIcon" style="color: #000000;"></i><a>사용자이름</a>
				<a class="OPReviewWritingDay">글쓴날짜</a>
			</div>	
			
			<div class="OPCosReviewSmallTitle">수강후기제목</div>
			<div>수강후기내용</div>
			<div class="OPCosReviewPlus">더보기</div>
			<div class="OPCosReviewHideMethod">
				<div>수강후기내용자세히</div>
				<div class="OPCosReviewHide">접기</div>
			</div>
		
		</div>	
		<%-- 수강 후기 끝 --%>
	
	</div>
		
</body>
<jsp:include page="../footer.jsp" />