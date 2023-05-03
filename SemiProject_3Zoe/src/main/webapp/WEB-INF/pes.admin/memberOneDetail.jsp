<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="adminHeader.jsp"/>

<style type="text/css">

	
   div.content3Div {
	  height: auto;
   }

	div#mvoInfo {
      width: 50%; 
      text-align: left;
      border: solid 0px red;
      margin-top: 30px; 
      font-size: 18pt;
      line-height: 200%;
      margin: 0 auto; 
      padding-left: 150px;
   }
   
   span.myli {
      display: inline-block;
      width: 250px;
      text-align: center;
   }

   div#sms {
      margin: 100px auto; 
      overflow: hidden; 
      width: 50%;
	  padding-left: 200px;
   }
   
   span#smsTitle {
      display: block;
      font-size: 15pt;
      font-weight: bold;
      margin: 10px auto;
   }
   
   textarea#smsContent {
      float: left;
      height: 100px;
   }
   
   button#btnSend {
      float: left;
      border: none;
      width: 100px;
      height: 100px;
      background-color: #1bceb8;
      border-radius: 20px;
      margin-left: 10px;
      color: white;
   }
   
   div#smsResult {
      clear: both;
      color: red;
      padding: 20px;
      
   }   

	div#listButton {
	  margin: 25px auto;
	  width: 370px;
	}

   

</style>

<script type="text/javascript">


	/* dropdown buttons to toggle */
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;
	
	for (i = 0; i < dropdown.length; i++) {
	  dropdown[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var dropdownContent = this.nextElementSibling;
	    if (dropdownContent.style.display === "block") {
	      dropdownContent.style.display = "none";
	    } else {
	      dropdownContent.style.display = "block";
	    }
	  });
	}



	$(document).ready(function(){
		
		$("div#smsResult").hide();
		
		$("button#btnSend").click(() => {
			
		//	console.log( $("input#reservedate").val() + " " + $("input#reservetime").val() );
			
			let reservedate = $("input#reservedate").val();
			reservedate = reservedate.split("-").join("");
			
			let reservetime = $("input#reservetime").val();
			reservetime = reservetime.split(":").join("");
			
			const datetime = reservedate + reservetime;
			
		//	console.log(datetime);
			
			let dataObj;
			
			if(reservedate == "" || reservetime == ""){
				// 문자를 바로 보내기인 경우
				dataObj = {"mobile":"${requestScope.mvo.mobile}",
						   "smsContent:":$("textarea#smsContent").val()};
			}
			else {
				// 예약문자 보내기인 경우
				dataObj = {"mobile":"${requestScope.mvo.mobile}",
					   	   "smsContent":$("textarea#smsContent").val(),
					   	   "datetime":datetime};
			}
			
			$.ajax({
				url:"<%= request.getContextPath()%>/pes.admin/smsSend.go",
				type:"post",
				data:dataObj,
				dataType:"json",
				success:function(json){
					// console.log(JSON.stringfy(json);
					
					if(json.success_count == 1){
						$("div#smsResult").html("문자전송이 성공되었습니다.");
					}
					else if(json.error_count != 0){
						$("div#smsResult").html("문자전송이 실패되었습니다.");
					}
					
					$("div#smsResult").show();
					$("textarea#smsContent").val(""); 
					
				},
				error: function(request, status, error){
		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
			});
			
		});//end of $("button#btnSend").click(() => {})--------------------------------
		
	});

</script>


<div class="main1" >

	<div class="content3Div" >
		
		<c:if test="${empty mvo}">
		   존재하지 않는 회원입니다.<br>
		</c:if>
		
		<c:if test="${not empty mvo}">
		   <c:set var="mobile" value="${mvo.mobile}" />
		   <h3 style="margin: 50px; text-align: center; font-weight: bold;">:::&nbsp; ${mvo.name}님의 회원 상세정보 &nbsp;:::</h3>
		
		   <div id="mvoInfo">
		    <ol>   
		       <li style="font-weight: bold;"><span class="myli">아이디 : </span>${mvo.userid}</li>
		       <li style="font-weight: bold;"><span class="myli">회원명 : </span>${mvo.name}</li>
		       <li><span class="myli">이메일 : </span>${mvo.email}</li>
		       <li><span class="myli">휴대폰 : </span>${fn:substring(mobile, 0, 3)}-${fn:substring(mobile, 3, 7)}-${fn:substring(mobile, 7, 11)}</li>
		       <li><span class="myli">우편번호 : </span>${mvo.postcode}</li>
		       <li><span class="myli">주소 : </span>${mvo.address}&nbsp;${mvo.detailaddress}</li>
		       <li><span class="myli">포인트 : </span><fmt:formatNumber value="${mvo.point}" pattern="###,###" /> POINT</li>
		       <li><span class="myli">가입일자 : </span>${mvo.registerday}</li>
		       <li><span class="myli">비밀번호 변경 일자 : </span>${mvo.lastpwdchangedate}</li>
		     </ol>
		   </div>
		   
		   <%-- ==== 휴대폰 SMS(문자) 보내기 ==== --%>
		   <div id="sms" align="left">
		        <span id="smsTitle">&gt;&gt;휴대폰 SMS(문자) 보내기 내용 입력란&lt;&lt;</span>
		        <div style="margin: 10px 0 20px 0">
		           발송예약일&nbsp;<input type="date" id="reservedate" />&nbsp;<input type="time" id="reservetime" />
		        </div>
		        <textarea rows="4" cols="40" id="smsContent"></textarea>
		        <button id="btnSend">전송</button>
		        <div id="smsResult"></div>
		   </div>
		   
		</c:if>
		
		
		
	</div>

</div>		