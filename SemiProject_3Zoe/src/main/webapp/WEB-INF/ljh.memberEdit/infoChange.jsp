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

td:nth-child(2n+1) {
	width: 13%;
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
		
		let b_flag_email_change = false;
		//이메일이 변경되었는지 체크
		
		let b_flag_emailDuplicate_click = false;
		// 이메일이 중복인지 체크했는지
		
		let b_flag_emailExpOk = false;
		// 이메일이 정규표현식에 맞는지 체크
		
		$("span.error").hide();
		
		$("input#email").blur( (e) => {
	           
	          const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	          
	          const bool = regExp.test($(e.target).val());
	          
	          if(!bool) {
	             // 이메일이 정규표현식에 위배 된 경우
	              $("span.error").show();
	              //$("button#btnEmailCheck").attr('disabled', 'disabled');
	              $("span#emailCheckResult").hide();
	              $(e.target).focus(); 
	              b_flag_emailExpOk= false;
	              $("input#email").val("");
	          }
	          else {
	             // 이메일이 정규표현식에 맞는 경우
	               $("span.error").hide();
	               b_flag_emailExpOk= true;
	          }
	           
	        });// 아이디가 email 인 것은 포커스를 잃어버렸을 경우 (blar) 이벤트를 처리해주는 것이다.
		
		
		// 이메일값이 변경되면 가입하기 버튼을 클릭 시 "이메일중복확인" 을 클릭했는지 클릭안했는지 알아보기 위한 용도를 초기화 시키기
        $("input#email").bind("change", function(){
              b_flag_email_change = true;
              b_flag_emailDuplicate_click = false;
        }); 
		
		
     	// 이메일 중복버튼을 누르면
		$("button#btnEmailCheck").click(function(){
				isExistEmailCheck();
			
		});
     	
     	$("button#btnSubmit").click(function(){
     		goEdit(b_flag_email_change,b_flag_emailDuplicate_click,b_flag_emailExpOk);
     	});

	});//$(document).ready(function()
			
			
			
			
	// "이메일중복확인" 을 클릭했을 때 이벤트 처리하기   
    function isExistEmailCheck() {

          $.ajax({
                url:"<%= ctxPath%>/ljh.member.controller/emailDuplicateCheck.go",
                data:{"email":$("input#email").val()},    
                type: "post", 
                dataType:"json",
                success: function(json){ // 파라미터 json 에 {"isExists":true} 또는 {"isExists":false} 이 들어오게 된다.
                   if(json.isExists) {
                      // 입력한 email이 이미 사용중이라면
                      
                      $("span#emailCheckResult").show();
                      $("span.error").hide();
                      $("span#emailCheckResult").html($("input#email").val()+" 은 중복된 email 이므로 사용불가합니다.").css("color","red");
                      $("input#email").val("");
                      b_flag_emailDuplicate_click = false;
                   }
                   else if(!json.isExists && $("input#email").val().trim() != ""){ 
                     // 입력한 email 가 존재하지 않는 경우라면 
                     
                     const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	          
	          		const bool = regExp.test($("input#email").val());
                     
                     
                     if(!bool){	//이메일 정규표현식이 틀렸다면 체크를 못하게 한다.
         				$("input#email").val("");
         				$("span#emailCheckResult").hide();
         				$("span.error").show();
         				b_flag_emailDuplicate_click = false;
         				return;
                     }
                     else if(bool){
                    	 $("span.error").hide();
	                     $("span#emailCheckResult").show();
	                     $("span#emailCheckResult").html($("input#email").val()+" 은 사용가능합니다.").css("color","navy"); 
	                     b_flag_emailDuplicate_click = true;
                     }
                   }
                },
                
                error: function(request, status, error){
                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                }
             });              
               
        } // end of function isExistEmailCheck()----------------		
			
        
    	function goEdit(b_flag_email_change,b_flag_emailDuplicate_click,b_flag_emailExpOk){
    		
        	alert("b_flag_email_change "+b_flag_email_change);
        	alert("b_flag_emailDuplicate_click "+b_flag_emailDuplicate_click);
        	alert("b_flag_emailExpOk "+b_flag_emailExpOk);
        	
    		//이메일 변경을 하지 않았거나 했다면 이메일 중복체크를 했고, 정규표현식에 맞는지 체크.
    		if(!b_flag_email_change ||$ || $("input#email").val().trim() != null || (b_flag_emailDuplicate_click && b_flag_emailExpOk)){
    			alert("첫번째 if 들오왔음");
    			const frm = document.infoChange;
                frm.action = "<%= ctxPath%>/ljh.member.controller/infoChange.go";
                frm.method = "post";
                frm.submit();
    		}
    		
    		else if(b_flag_email_change|| $("input#email").val().trim() == null || (!b_flag_emailDuplicate_click || !b_flag_emailExpOk )){
    			
    			alert("이메일 형식에 맞게 쓰시고 중복체크를 하세요");
    			return false;
    		}
        	
    		
    	}    
    
        
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
	                document.getElementById("detailAdress").focus();
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
	  					<input type="text"  id="email" name="email" value="${sessionScope.loginuser.email}"/>
	  					
		  				<button type="button" id="btnEmailCheck" class="btn btn-outline-secondary" style="margin-bottom:5px;">중복 확인</button><br>
		  				<span class="error" style="color:red;">이메일 형식에 맞지 않습니다.</span>
		  				<span id="emailCheckResult">이메일 변경을 원하지 않을 시 넘기세요</span>
	  				</p>
	  				<input type="radio" name="emailChk" id="emailAgree"  class="radioPosition" value="1"/><label for="emailAgree" class="labelPadding">수신동의</label>
	  				<input type="radio" name="emailChk" checked="checked" id="emailDisAgree" class="radioPosition" value="0"/><label for="emailDisAgree" class="labelPadding">수신거부</label>
  				</td>
  			</tr>
  			
  			
  			<tr>
  				<td>휴대전화</td>
  				<td>
  					<p style="margin-bottom:10px;">
	  					<select name="phone1">
		  					<option value="010">010</option>
		  					<option value="011">011</option>
		  					<option value="016">016</option>
		  					<option value="017">017</option>
		  				</select>-
		  				<input type="text" name="phone2"size="6" maxlength="4" value="${ fn:substring(sessionScope.loginuser.mobile, 3, 7) }"/>
		  				-
		  				<input type="text" name="phone3" size="6" maxlength="4" value="${ fn:substring(sessionScope.loginuser.mobile, 7, 12) }"/>
	  				</p>
	  				<input type="radio" name="phoneChk" id="phoneAgree" class="radioPosition" value="1"/><label for="phoneAgree" class="labelPadding">수신동의</label>
	  				<input type="radio" name="phoneChk" checked="checked" id="phoneDisAgree" class="radioPosition" value="0"/><label for="phoneDisAgree" class="labelPadding">수신거부</label>
  				</td>
  			</tr>
  			
  			
  			<tr>
  				<td>주소</td>
  				<td>
  					<input type="text" name="postcode" value="${sessionScope.loginuser.postcode}" id="postcode" readonly></input>
  					<button type="button" class="btn btn-outline-secondary" style="margin-bottom:5px;" id="btnPostcode" onclick="openDaumPOST();">우편번호 검색</button><br>
  					<input type="text" name="address" id="address" style="width:100%; margin-bottom:5px;" value="${sessionScope.loginuser.address}" readonly></input><br>
  					<input type="text" name="detailAdress" id="detailAdress" style="width:100%; margin-bottom:5px;" value="${sessionScope.loginuser.detailaddress}"></input>
  				</td>
  				
  			</tr>

  		</table>

  		
  		
  	</div>
  	
  	<p style="text-align:center; margin-top:20px;">
	  	<button type="button" class="btnInfoChange" style="background-color:#bcbcbc;" onclick = "location.href = '<%= ctxPath %>/ljh.member.controller/deleteMember.go'">회원탈퇴</button>
	  	<button type="button" class="btnInfoChange" style="background-color:#1bceb8;" id="btnSubmit" >정보수정</button>
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