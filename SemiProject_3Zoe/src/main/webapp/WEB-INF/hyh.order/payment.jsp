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
	
	// === 이임포트 결제를 해주는 함수 === //
    function goCoinPurchaseEnd(coinmoney) {
    //	alert("~~~확인용 부모창의 함수 호출함. 결제금액 : " + coinmoney + "원");
    	
    	const userid = "${sessionScope.loginuser.userid}";
    	
    	// 아임포트 결제 팝업창 띄우기
    	const url = "<%= request.getContextPath()%>/member/coinPurchaseEnd.up?coinmoney="+coinmoney+"&userid="+userid;
    	
    	window.open(url, "coinPurchaseEnd",
    				 "left=350px, top=100px, width=1000px height=600px");
    	
    }
	
	
	// 결제해주러 가는 함수 //
	function PurchaseEnd(){
	      
      if("${sessionScope.loginuser.userid}" != ""){
         <%--
    	 const frm = document.PurchaseEndFrm;
         frm.method = "POST";
         frm.action = "<%= ctxPath%>/hyh.order/purchaseEnd.go";
         frm.submit();
         
         <form name="PurchaseEndFrm">
			<input type="text" name="" value="" />
			<input type="text" name="" value="" />
			<input type="text" name="" value="" />
			<input type="text" name="email" value="${sessionScope.loginuser.email}" />
			<input type="text" name="name" value="${sessionScope.loginuser.name}" />
			<input type="text" name="mobile" value="${sessionScope.loginuser.mobile}" />
		</form>
		--%>  
         const url = "<%= ctxPath%>/hyh.order/purchaseEnd.go?courseCode=${requestScope.cvo.courseCode}&courseName=${requestScope.cvo.courseName}&salePrice=${requestScope.cvo.salePrice}"; 
         window.open(url, "PurchaseEnd",
		             "left=350px, top=100px, width=1000px height=600px");
         
      }
      else {
         alert("로그인이 필요한 서비스 입니다!");
      }
      
	} // end of function PurchaseEnd()-------------------------------------------
	   
	
	// === DB 상의 tnl_member 테이블에 해당 사용자의 코인금액 감소 및 포인트를 증가시켜주고 이어서 주문내역에 insert 해주는 함수 // 
    function go_UserUpdate_OrderInsert(userid, salePrice) {
    	
	   	//console.log("~~ 확인용 userid : " + userid + ", coinmoney : " + coinmoney + "원");
	   	
	   	 $.ajax({
		           url:"<%= request.getContextPath()%>/hyh.order/orderAdd.go",
		           type:"post",
		           data:{"orderPoint":parseInt(salePrice*0.01),
		        	     "totalPrice":salePrice,
		        	     "fk_userid":userid,
		        	     "fk_courseCode":"${requestScope.cvo.courseCode}",
		        	     "coursePrice":"${requestScope.cvo.price}"
		                },
		           dataType:"json",
		           success:function(json){
		            	  
		            	  // json 은 {"isSuccess":1} 또는 {"isSuccess":0} 이다.
		            	  
		            	  if(json.isSuccess == 1) {
		            		  alert("결제 성공");
		            		  ocation.href="<%= request.getContextPath()%>/index.go";
		            	  }
		            	  else {
		            		  alert("결제 비정상ㅜㅜ");
		            		  location.href="<%= request.getContextPath()%>/index.go";
		            	  }
		                 
		              },
		             error: function(request, status, error){
		                     alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		             }

		        }); 
	   
	   		
    }// end of function go_UserUpdate_OrderInsert(userid, salePrice)-----------------------------------------------
	
	
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
		<button type="button" id="PMPaymentEnd" onclick="PurchaseEnd();"><i class="fa-regular fa-paper-plane" style="color: #ffffff; margin-right:10px;"></i>신용카드 결제하기</button>
		<button type="button" id="PMPaymentReset">취소</button>
		<%-- 결제하기 버튼 끝 --%>
	</div>

</body>
<jsp:include page="../footer.jsp" />

