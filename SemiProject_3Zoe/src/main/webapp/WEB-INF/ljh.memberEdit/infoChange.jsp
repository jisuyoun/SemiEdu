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


	
</style>



<script type="text/javascript">


	$(document).ready(function() {
	
	});



</script>


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
  			
  			<!-- <tr>
  				<td>생년월일</td>
  				<td>020212</td>
  			</tr>
  			
  			<tr>
  				<td>성별</td>
  				<td>남</td>
  			</tr> -->
  			
  			<tr>
  				<td>이메일</td>
  				<td>
	  				<p style="margin-bottom:10px;">
	  					<input type="text" value="${(sessionScope.loginuser).email}"></input>@<input type="text"></input>
		  				<select name="">
		  					<option>직접입력</option>
		  					<option>naver.com</option>
		  					<option>daum.net</option>
		  					<option>hanmail.net</option>
		  					<option>gmail.com</option>
		  				</select>
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
		  				<input type="text" size="6" maxlength="4" value="${ fn:substring(sessionScope.loginuser.mobile, 3, 7) }"/>
		  				-
		  				<input type="text" size="6" maxlength="4" value="${ fn:substring(sessionScope.loginuser.mobile, 7, 11) }"/>
	  				</p>
	  				<input type="radio" name="phoneChk" id="phoneAgree" class="radioPosition"/><label for="phoneAgree" class="labelPadding">수신동의</label>
	  				<input type="radio" name="phoneChk" checked="checked" id="phoneDisAgree" class="radioPosition"/><label for="phoneDisAgree" class="labelPadding">수신거부</label>
  				</td>
  			</tr>
  			
  			
  			<tr>
  				<td>주소</td>
  				<td>
  					<input type="text" value="${sessionScope.loginuser.postcode}"></input>
  					<button type="button" class="btn btn-outline-secondary" style="margin-bottom:5px;">우편번호 검색</button><br>
  					<input type="text" style="width:100%; margin-bottom:5px;" value="${sessionScope.loginuser.address}"></input><br>
  					<input type="text" style="width:100%; margin-bottom:5px;" value="${sessionScope.loginuser.detailaddress}"></input>
  				</td>
  				
  			</tr>

  		</table>

  		
  		
  	</div>
  	
  	<p style="text-align:center; margin-top:20px;">
	  	<button type="button" style="background-color:#bcbcbc; color:white; border-radius:30px; width:155px; border:none; padding:10px;">회원탈퇴</button>
	  	<button type="button" style="background-color:#1bceb8; color:white; border-radius:30px; width:155px; border:none; padding:10px;">정보수정</button>
  	</p>
</div>
	
	
	
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