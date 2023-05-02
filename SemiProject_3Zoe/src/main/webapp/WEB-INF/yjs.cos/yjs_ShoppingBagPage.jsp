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
					"courseCode":checkPriceJoin
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
						"courseCode":delCheckboxJoin,
						"userid":"${sessionScope.loginuser.userid}"
					},
					dataType:"json",
					success:function(json){
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

	<h1 class="mainName container-fluid">장바구니</h1>

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