<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
	
<jsp:include page="../header.jsp" />

<%-- 직접만든 css --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/paymentStyle.css" />

<script type="text/javascript">


	$(document).ready(function(){
		  
		var minus = ${requestScope.cvo.price} - ${requestScope.cvo.salePrice};
		
		$("a#minus").html(minus + "원");
		
	}); // end of document.ready
	
	<%-- 주문 함수 시작 --%>
	function goOrder() {
		
		if( ${not empty sessionScope.loginuser} ) {
			
			//const Price = Number("${requestScope.pvo.price}").val()); // 제품판매가
			//const Price = Number("${requestScope.pvo.salePrice}").val()); // 제품판매가
		
		}
		else {
			alert("주문을 하시려면 먼저 로그인하세요!!");
		}
		
		
		
		
	}// end of function goOrder()
	<%-- 주문 함수 끝 --%>
	
	
	function PurchaseEnd(){
	      
      if("${sessionScope.loginuser.userid}" != ""){
         var frm = document.PurchaseEndFrm;
         frm.method = "POST";
         frm.action = "<%= ctxPath%>/hyh.order/purchaseEnd.go";
         frm.submit();  
         //const url = frm.action;
         //window.open(url, "PurchaseEnd()",
		 //"left=350px, top=100px, width=1000px height=600px");
         
      }
      else {
         alert("로그인이 필요한 서비스 입니다!");
      }
	};
	   
	// === DB 상의 tnl_member 테이블에 해당 사용자의 코인금액 및 포인트를 증가시켜주는
    function goUserUpdate(userid, salePrice) {
    	
	   	//console.log("~~ 확인용 userid : " + userid + ", coinmoney : " + coinmoney + "원");
	   	
	   	const frm = document.coinUpdateFrm;
	   	frm.userid.value = userid;
	   	frm.salePrice.value = salePrice;
	   	
	   	frm.action = "<%= request.getContextPath()%>/hyh.order/goUpdateLoginUser.go";
	   	frm.method = "post";
	   	frm.submit();
    } 


	
	
</script>

	<h1 class="mainName container-fluid">결제</h1>
	
	<div  class="container" style="margin-top: 57px;">
	
	<%-- 왼쪽항목 시작 --%>
	
		<div id="PMContainerBorder">
			<%-- 결제항목 시작 --%>
			<div id="PMCosName">
				<ul>
					<li><h4 class="PMh4Bold">결제항목</h4></li>
					<li>
						<div>${requestScope.cvo.courseName}</div> 
						<div>${requestScope.cvo.price}원</div>
					</li>
				</ul>
			</div>
			<%-- 결제항목 끝 --%>
			
			<hr style="clear:both;">
			
			<%-- 포인트 사용 결정 시작 --%>
			<div id="SPPayPoint">
				<ul>
					<li><h4 class="PMh4Bold">포인트</h4></li>
					<li>사용 가능한 포인트<a>10000포인트</a></li>
					<li>사용할 포인트 <input type="text" placeholder="사용할 포인트 입력" /></li>
				</ul>
			</div>
			<%-- 포인트 사용 결정 끝 --%>
			
			<hr>
			
			<%-- 결제상세 시작 --%>
			<div id="PMDetail">
				<ul>
					<li><h4 class="PMh4Bold">결제상세</h4><li>
					<li id="PMDetailPayDetail">
						<div>판매금액<a>${requestScope.cvo.price}원</a></div>
						<div>할인가<a id="minus"></a></div>
						<div>사용포인트<a id="me"></a></div>
						
						  <script>
						    const inputElement = document.querySelector('a#me');
						
						    inputElement.addEventListener('keydown', (event) => {
						      if (event.key === 'Enter') {
						    	  $("a#me").html(inputElement);
						      }
						    });
						  </script>
						
						<hr>
						
						<div>총 결제금액<a>${requestScope.cvo.salePrice}원</a></div>
					</li>
				</ul>
			</div>	
			<%-- 결제상세 끝 --%>
			
		</div>
		<%-- 왼쪽항목 끝 --%>
		
		
		
		<%-- 오른쪽항목 시작 --%>
		
		<%-- 포인트 현황 시작 --%>
		<div id="PMPointBorder">
			<ul>
				<li><h4 class="PMh4Bold">포인트 현황</h4></li>
				<li id="PMPointBorderDetail">
					<div>보유 포인트<a>${sessionScope.loginuser.point}포인트</a></div>
					<div>사용 포인트<a>-10000포인트</a></div>
					<div>적립 포인트<a>1000포인트</a></div>
					<hr>
					<div>총 보유 포인트<a>11000포인트</a></div>
				</li>
					
			</ul>
		</div>
		<%-- 포인트 현황 끝 --%>
			
		<%-- 오른쪽항목 끝 --%>
		
		
		<%-- 결제약관 시작 --%>
		<div id="PMMethod">
			<ul>
				<li><input type="radio" /><a class="PMUnderline">이용약관</a>과 <a class="PMUnderline">환불규정</a>에 동의합니다.</li>
				<li><input type="radio" /><a class="PMUnderline">개인정보처리방침</a>에 동의합니다.</li>
			</ul>
		</div>
		<%-- 결제약관 끝 --%>
		
		<%-- 결제하기 버튼 시작 --%>
		<form name="PurchaseEndFrm">
			<input type="hidden" name="courseName" value="${requestScope.cvo.courseName}" />
			<input type="hidden" name="salePrice" value="${requestScope.cvo.salePrice}" />
			<input type="hidden" name="email" value="${sessionScope.loginuser.email}" />
			<input type="hidden" name="name" value="${sessionScope.loginuser.name}" />
			<input type="hidden" name="mobile" value="${sessionScope.loginuser.mobile}" />
			<button type="button" id="PMPaymentEnd" onclick="PurchaseEnd();"><i class="fa-regular fa-paper-plane" style="color: #ffffff; margin-right:10px;"></i>신용카드 결제하기</button>
		</form>
		<button type="button" id="PMPaymentReset">취소</button>
		<%-- 결제하기 버튼 끝 --%>
	</div>

</body>
<jsp:include page="../footer.jsp" />

