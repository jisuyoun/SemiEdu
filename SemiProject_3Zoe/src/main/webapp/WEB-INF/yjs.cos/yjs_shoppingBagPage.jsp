<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>


	
<jsp:include page="header.jsp" />

<%-- 직접만든 css --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/shoppingBagStyle.css" />

<script type="text/javascript">

	$(document).ready(function(){
		  
	}); // end of document.ready

</script>

	<h1 class="mainName container-fluid">장바구니</h1>

	<%-- 장바구니 리스트 시작 --%>
	<div class="container">
		<div><button type="button" class="SPDelectButton">선택삭제</button><button type="button" class="SPDelectButton">전체삭제</button></div>
		
		<div id="SPListBody">
			<div id="SPListTitle">
				<ul>
					<div><li><input type="checkbox" style="margin-right: 10px; width: 20px; height: 18px;"/>구분</li></div>
					<div><li>상품명</li></div>
					<div><li>판매가</li></div>
					<div><li>할인가</li></div>
					<div><li>합계</li></div>
				</ul>
			</div>
			
			<%-- 장바구니에 넣은 리스트 넣어줄 곳 시작 --%>
			<div id="SPListContent">
				<ul>
					<div><li><input type="checkbox" id="SPCheckbox" />과정</li></div>
					<div><li>정보처리기사</li></div>
					<div><li>70000원</li></div>
					<div><li>70000원</li></div>
					<div><li>70000원</li></div>
				</ul>
			</div>
			<%-- 장바구니에 넣은 리스트 넣어줄 곳 끝 --%>
		
				
			<%-- 판매금액, 할인금액 넣어줄 곳 시작 --%>
			<div id="SPAllPrice">
				<ul>
					<li>판매금액</li>
					<li>70000원</li>
					<li><i id="SPMinusIcon" class="fa-solid fa-circle-minus" style="color: #ff0000;" ></i></li>
					<li>할인가</li>
					<li>0원</li>
				</ul>
			</div>
			<%-- 판매금액, 할인금액 넣어줄 곳 끝 --%>
			
			<%-- 총 결제금액 시작 --%>
			<div>
				<ul>
					<li>총 결제금액 <a>79000원</a></li>
				</ul>
			<%-- 총 결제금액 끝 --%>
			</div> 
		</div>
	</div>
	<%-- 장바구니 리스트 끝 --%>
	
	<button type="button" id="SPEndButton">결제하기</button>
	
</body>
</html>