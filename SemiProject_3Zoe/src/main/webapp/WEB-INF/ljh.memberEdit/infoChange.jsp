<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>   
 
<jsp:include page="/WEB-INF/ljh.myPage/header.jsp"/>
  
<style type="text/css">

	




table{
	width:100%;
}

tr{
	border-bottom:solid 1px lightgray;
	margin-bottom:30px;
}

tr:last-child{
	border-bottom:solid 0px gray;
}

td{

	padding:20px 0;
}

input, select{
	border:solid 1px lightgray;
	border-radius:5px;
	height:40px;
}


td:nth-child(2n){
	font-size:13pt;
}

input[type="radio"].radioPosition{
	position:relative; top:14px;
}

label.labelPadding{
	padding-left:10px;
	padding-right:10px;
}

button.btnInfoChange{
	color:white; 
	border-radius:30px; 
	width:155px; 
	border:none; 
	padding:10px;
}

	
</style>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


	$(document).ready(function() {
		

		
		
		// 정보수정 버튼을 눌렀을 때, loginuser의 이메일 값과 다르면 중복확인 하라는 경고창 띄우기.
		
		
		
		
		const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
		
		const bool = regExp.test($(e.target).val());
		
		
		
		// 우편번호찾기버튼 안됨.
		$("button#btnPostcode").click(function(){
			openDaumPOST();
		});

	});//$(document).ready(function()
			
			
			
	function openDaumPOST(){
	      new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                let addr = ''; // 주소 변수
	                //let extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                
/* 	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                } */
	                
	                

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();
	}//openDaumPOST	



</script>

<form name="infoChange">
<div class="main1" >
  	
  	<div class="content1" style="background-color:white; border-radius:20px; padding:20px 30px; ;width:100%; height:700px; ">
  		<p style="font-weight:bold; margin-bottom:15px;">개인정보 수정</p>
  		
  		<table>
  			<tr>
  				<td>아이디</td>
  				<td>${(sessionScope.loginuser).userid}</td>
  			</tr>
  			
  			
  			<tr>
  				<td>이름</td>
  				<td>${(sessionScope.loginuser).name}</td>
  			</tr>
  	
  			
  			<tr>
  				<td>이메일</td>
  				<td>
	  				<p style="margin-bottom:10px;">
	  					<input type="text"  id="emailFirst" name="email" value="${sessionScope.loginuser.email}"/>
	  					
		  				<button type="button" class="btn btn-outline-secondary" style="margin-bottom:5px;">중복 확인</button><br>
	  				</p>
	  				<input type="radio" name="emailChk" id="emailAgree"  class="radioPosition"/><label for="emailAgree" class="labelPadding">수신동의</label>
	  				<input type="radio" name="emailChk" checked="checked" id="emailDisAgree" class="radioPosition"/><label for="emailDisAgree" class="labelPadding">수신거부</label>
  				</td>
  			</tr>
  			
  			
  			<tr>
  				<td>휴대전화</td>
  				<td>
  					<p style="margin-bottom:10px;">
	  					<select name="">
		  					<option>010</option>
		  					<option>011</option>
		  					<option>016</option>
		  					<option>017</option>
		  				</select>-
		  				<input type="text" size="6" maxlength="4" value="${ fn:substring(sessionScope.loginuser.mobile, 4, 8) }"/>
		  				-
		  				<input type="text" size="6" maxlength="4" value="${ fn:substring(sessionScope.loginuser.mobile, 9, 13) }"/>
	  				</p>
	  				<input type="radio" name="phoneChk" id="phoneAgree" class="radioPosition"/><label for="phoneAgree" class="labelPadding">수신동의</label>
	  				<input type="radio" name="phoneChk" checked="checked" id="phoneDisAgree" class="radioPosition"/><label for="phoneDisAgree" class="labelPadding">수신거부</label>
  				</td>
  			</tr>
  			
  			
  			<tr>
  				<td>주소</td>
  				<td>
  					<input type="text" value="${sessionScope.loginuser.postcode}" id="postcode" readonly></input>
  					<button type="button" class="btn btn-outline-secondary" style="margin-bottom:5px;" id="btnPostcode">우편번호 검색</button><br>
  					<input type="text" id="address" style="width:100%; margin-bottom:5px;" value="${sessionScope.loginuser.address}"></input><br>
  					<input type="text" id="detailAdress" style="width:100%; margin-bottom:5px;" value="${sessionScope.loginuser.detailaddress}"></input>
  				</td>
  				
  			</tr>

  		</table>

  		
  		
  	</div>
  	
  	<p style="text-align:center; margin-top:20px;">
	  	<button type="button" class="btnInfoChange" style="background-color:#bcbcbc;" onclick = "location.href = '<%= ctxPath %>/ljh.member.controller/deleteMember.go'">회원탈퇴</button>
	  	<button type="button" class="btnInfoChange" style="background-color:#1bceb8;">정보수정</button>
  	</p>
</div>
</form>	
	
	
	<script type="text/javascript">
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
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
</script>
	
</body>
</html>