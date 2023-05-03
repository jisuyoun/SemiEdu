<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>


	
<jsp:include page="../header.jsp" />

<%-- 직접만든 css --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/shoppingBagStyle.css" />

<script type="text/javascript">

	$(document).ready(function(){
		  
		let sumTotalPrice = 0;     // 총금액
		let sumTotalSalePrice = 0; // 총할인가
		let sumTotalAllPrice = 0;  // 총계산금액
		
		
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
			
		
		/* 리스트 불러오기 시작 */
		
		$.ajax({
			url:"<%= request.getContextPath()%>/yjs.cos/yjs_ShoppingBagPageJSON.go",
			data:{
				"userid":"${sessionScope.loginuser.userid}"
			},   
			dataType:"json", /* dataType 을 생략하면 string 타입으로 들어온다. */
			/* async:false, */
			success:function(json){
			
				let html = "";
			
				if (json.length > 0) {
					//alert("데이터 있음"); 
					
					$.each(json, function(index, item){
						
						var calSalePrice = item.price-item.salePrice;
						
						html = "<ul class='SPUlPosition'>"
							  + "	<div><li><input type='checkbox' name='SPCheckbox' class='SPCheckbox' value='" + item.courseCode + "' checked='on' />과정</li></div>"
							  + "	<div><li>" + item.courseName + "</li></div>"
							  + "	<div><li>" + item.price + "원</li></div>"
							  + "	<div><li>" + calSalePrice + "원</li></div>"
							  + "   <div><li>" + item.salePrice + "원</li></div>"
							  + "</ul>";
							
						$("div#SPListContent").append(html);
						
						sumTotalPrice += item.price;
						sumTotalSalePrice += calSalePrice;
						sumTotalAllPrice += item.salePrice;
						
					}); // end of $.each(json, functioin(index, item){} -------------------------------

					document.getElementById("sumTotalPrice").text=sumTotalPrice;
					document.getElementById("sumTotalSalePrice").text=sumTotalSalePrice;
					document.getElementById("sumTotalAllPrice").text=sumTotalAllPrice;
					 	
				} // end of if ------------------------------------------------------------------------
				
				else if(json.length == 0) {
					
					alert("장바구니가 비어있습니다.");
					
					javascript:history.back();  // 뒤로가기
					
					return; 
				} // end of else if --------------------------------------------------------------------
				
			},
			error: function(request, status, error){
	 			alert("장바구니를 불러올 수 없습니다. 관리자에게 문의해주세요.");
	        }
		}); // end of ajax
		
		/* 리스트 불러오기 끝 */
		
		
		
		
		
		
		/* 체크박스에 따른 가격 계산 시작 */
		$(document).on("click", 'input[name="SPCheckbox"]', function(){
			
			let checkPriceArr = [];
			
			$("input[type=checkbox][name=SPCheckbox]:checked").each(function(){
				var checkPrice = $(this).val();
				checkPriceArr.push(checkPrice);
			});
			
			var checkPriceJoin = checkPriceArr.join();
			
			$.ajax({
				url:"<%= ctxPath%>/yjs.cos/yjs_TotalPriceJSON.go",
				type:"POST",
				data:{
					"checkPriceJoin":checkPriceJoin
				},  
				dataType:"JSON",
				success:function(json){
					
					sumTotalPrice = 0;     // 총금액
					sumTotalSalePrice = 0; // 총할인가
					sumTotalAllPrice = 0;  // 총계산금액
						
					$.each(json, function(i,elt) {

						sumTotalPrice += elt.price;
						sumTotalSalePrice += (elt.price - elt.salePrice);
						sumTotalAllPrice += elt.salePrice;
						
					});
				
					document.getElementById("sumTotalPrice").text=sumTotalPrice;
					document.getElementById("sumTotalSalePrice").text=sumTotalSalePrice;
					document.getElementById("sumTotalAllPrice").text=sumTotalAllPrice;
					 
				},
				error: function(request, status, error){
		 			alert("가격을 불러올 수 없습니다. 관리자에게 문의해주세요.");
		        }
			
			});
		
		});
		/* 체크박스에 따른 가격 계산 끝 */
		
	
		
		/* 체크한 것들 삭제하기 시작 */
		$(document).on("click", '#SPSelectButton', function(){
			
			let delCheckboxArr = [];
			
			$("input[type=checkbox][name=SPCheckbox]:checked").each(function(){
				var delCheck = $(this).val();
				delCheckboxArr.push(delCheck);
			});

			var delCheckboxJoin = delCheckboxArr.join();
			
			if(confirm("정말로 삭제하시겠습니까?")){
				$.ajax({
					url:"<%= ctxPath%>/yjs.cos/yjs_BagSelectDeleteJSON.go",
					type:"POST",
					data: {
						"delCheckboxJoin":delCheckboxJoin,
						"userid":"${sessionScope.loginuser.userid}"
					},
					dataType:"json",
					success:function(json){
						alert("삭제가 완료되었습니다.");
						javascript:history.go(0);
					},
					error: function(request, status, error){
			 			alert("선택한 강의를 삭제하는데 문제가 생겼습니다. 관리자에게 문의해주세요.");
			        }
				}); // end of ajax
			} // end of if
			
		});
		/* 체크한 것들 삭제하기 끝 */
		
		
		
		
		/* 전체 삭제하기 시작 */
		$(document).on("click", '#SPAllButton', function(){
			
			if(confirm("정말로 삭제하시겠습니까?")){
				$.ajax({
					url:"<%= ctxPath%>/yjs.cos/yjs_BagAllDeleteJSON.go",
					type:"POST",
					data: {
						"userid":"${sessionScope.loginuser.userid}"
					},
					dataType:"json",
					success:function(json){
						alert("삭제가 완료되었습니다.");
						javascript:history.go(0);
					},
					error: function(request, status, error){
			 			alert("선택한 강의를 삭제하는데 문제가 생겼습니다. 관리자에게 문의해주세요.");
			        }
				}); // end of ajax
			} // end of if
			
		});
		/* 전체 삭제하기 끝 */
		
	}); // end of document.ready
	
	
</script>

	<%-- 최상단메뉴바 시작 --%>
	<div class="es_bar">
		<img class="bar" src="<%= ctxPath %>/images/bar배경.png" style="width: 100%; height: 200px;"/>
		<h2 id="page_title">장바구니</h2>

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

	<%-- 장바구니 리스트 시작 --%>
	<div class="container">
		<div><button type="button" id="SPSelectButton" class="SPDelectButton">선택삭제</button><button type="button" id="SPAllButton" class="SPDelectButton">전체삭제</button></div>
		
		<div id="SPListBody">
			<div id="SPListTitle">
				<ul>
					<div><li>구분</li></div>
					<div><li>상품명</li></div>
					<div><li>판매가</li></div>
					<div><li>할인가</li></div>
					<div><li>합계</li></div>
				</ul>
			</div>
			
			<%-- 장바구니에 넣은 리스트 넣어줄 곳 시작 --%>
			<div id="SPListContent">
				
			</div>
			<%-- 장바구니에 넣은 리스트 넣어줄 곳 끝 --%>
		
				
			<%-- 판매금액, 할인금액 넣어줄 곳 시작 --%>
			<div id="SPAllPrice">
				<ul>
					<li>판매금액</li>
					<li><a id="sumTotalPrice"></a>원</li>
					<li><i id='SPMinusIcon' class='fa-solid fa-circle-minus' style='color: #ff0000;' ></i></li>
					<li>할인가</li>
					<li><a id="sumTotalSalePrice"></a>원</li>
					</ul>
			</div>
			<%-- 판매금액, 할인금액 넣어줄 곳 끝 --%>
			
			<%-- 총 결제금액 시작 --%>
			<div id="SPFinishPrice">
				<ul>
					<li>총 결제금액 <a id="sumTotalAllPrice"></a>원</li>
				</ul>
			<%-- 총 결제금액 끝 --%>
			</div> 
		</div>
	</div>
	<%-- 장바구니 리스트 끝 --%>
	
	<button type="button" id="SPEndButton">결제하기</button>
	
</body>
</html>