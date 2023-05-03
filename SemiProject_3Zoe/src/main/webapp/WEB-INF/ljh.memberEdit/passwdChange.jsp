<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
}

tr:last-child{
	border-bottom:solid 0px gray;
}

td{
	padding:30px 0;
}

td:nth-child(2n+1) {
	width: 13%;
}

.green{
color:#1bceb8;
}

.red{
color:red; 
}

input{
	height: 45px;
}


	
</style>  

<!-- 

1. 첫 페이지는 초록색
영문, 숫자, 특수문자 조합 8자 이상 입력하세요.


2. 그냥 아무것도 안 누르고 변경 누르면
alert로 비밀번호를 입력하라고 뜨게

3. 신규비밀번호랑 비밀번호 확인탭이랑
다르면
두 비밀번호가 일치하지 않습니다. 빨강으로 즉시 변함

4. 두 비밀번호가 같으면
두 비밀번호가 일치합니다. 파랑 
-->

			
<script type="text/javascript">


	$(document).ready(function(){
		
		
		$("input#originPasswd").focus(); //기존 비밀번호 포커스 주기
		
		$("span#error").addClass('green');
		
		
		// 신규 패스워드
		$("input#newPasswd").blur( (e) => {
			//신규 패스워드 입력칸에서 포커스를 잃어버린 경우
			
			const regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; 
			const bool = regExp.test($(e.target).val());
		
			
			if(!bool){
				// 암호가 정규표현식에 위배된 경우
				
				$("span#error").removeClass('green');
				$("span#error").addClass('red');
			}
			else {
				// 암호가 정규표현식에 맞는 경우
				
				
				// 신규 비밀번호와 체크 비밀번호가 같으면 
				if( $("input#newPasswd").val() == $("input#checkPasswd").val() ){
					
					$("span#error").removeClass('red');
					$("span#error").addClass('green');
					
					$("span#error").text("두 비밀번호가 일치합니다.");
					
				}
				
				// 비밀번호 체크 값에 아무것도 안 넣었다면
				else if($("input#checkPasswd").val().trim() == "" ) {
					
					$("span#error").removeClass('red');
					$("span#error").addClass('green');
					
					$("span#error").text("비밀번호 확인란에 비밀번호를 입력하세요.");
				}
				
				// 두 비밀번호가 다르면
				else if($("input#newPasswd").val() != $("input#checkPasswd").val() ){
					
					$("span#error").removeClass('green');
					$("span#error").addClass('red');
					
					$("span#error").text("두 비밀번호가 일치하지 않습니다.");
				}
				
				
				
			}
			//두 비밀번호가 일치하지 않습니다.
			// 비밀번호 확인란에 비밀번호를 입력하세요.
			
		});//$("input#newPasswd").blur( (e) =>
		
		
		
		//비밀번호 확인 칸
		$("input#checkPasswd").blur( (e) => {
			//비밀번호 확인 입력칸에서 포커스를 잃어버린 경우
			
			const regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; 
			const bool = regExp.test($(e.target).val());
			
			
			if(!bool){
				// 암호가 정규표현식에 위배된 경우
				
				$("span#error").removeClass('green');
				$("span#error").addClass('red');
				$("span#error").text("영문, 숫자, 특수문자 조합 8자 이상 입력하세요.");
			}
			else {
				// 암호가 정규표현식에 맞는 경우
				
				
				// 신규 비밀번호와 체크 비밀번호가 같으면 
				if( $("input#newPasswd").val() == $("input#checkPasswd").val() ){
					
					$("span#error").removeClass('red');
					$("span#error").addClass('green');
					
					$("span#error").text("두 비밀번호가 일치합니다.");
				}
				
				// 아무것도 입력안했으면
				else if($("input#newPasswd").val().trim() == "" ) {
					
					$("span#error").removeClass('green');
					$("span#error").addClass('red');
					
					$("span#error").text("영문, 숫자, 특수문자 조합 8자 이상 입력하세요.");
				}
				
				// 두 비밀번호가 다르면
				else if($("input#newPasswd").val() != $("input#checkPasswd").val() ){
					
					$("span#error").removeClass('green');
					$("span#error").addClass('red');
					
					$("span#error").text("두 비밀번호가 일치하지 않습니다.");
				}
				
			}
			//두 비밀번호가 일치하지 않습니다.
			// 비밀번호 확인란에 비밀번호를 입력하세요.
			
		});//$("input#checkPasswd").blur( (e) =>
		
		
		
	});//$(document).ready(function()
			
			
	function goChange(){
	
		
		const regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; 
		const bool1 = regExp.test( $("input#newPasswd").val());
		const bool2 = regExp.test($("input#checkPasswd").val());
		
		
		// 비밀번호 입력칸에 하나라도 공백이 있다면
		if( $("input#originPasswd").val().trim()=="" || $("input#newPasswd").val().trim()=="" ||
				$("input#checkPasswd").val().trim()=="" ){
			alert("비밀번호를 입력하세요");
			return ;
		}
		
		// 입력된 두개의 비밀번호 중 하나라도 잘못됐으면
		else if( (bool1==false) || (bool2==false)){
			alert("비밀번호는 영문, 숫자, 특수문자 조합 8자 이상 입력하세요.");
			return;
		}
		
		else if($("input#newPasswd").val() != $("input#checkPasswd").val()){
			alert("신규비밀번호가 서로 일치하지 않습니다.");
			return;
		}

		else{
		//입력된 비밀번호가 로그인된 계정의 비밀번호와 같은지 검사해야함. 이건 class로 가서 dao로 가서 함

			const frm = document.passwdChange;
			frm.action = "<%=ctxPath%>/ljh.member.controller/passwdChange.go";
			frm.method = "post";
			frm.submit();
		}

	}//goChange()

</script>			

<form name="passwdChange">
<div class="main1" >
  	
  	<div class="content1" style="background-color:white; border-radius:20px; padding:20px 30px; ;width:100%; height:400px; ">
  		<p style="font-weight:bold; margin-bottom:15px;">비밀번호 변경</p>
  		
  		<table>
  			<tr>
  				<td>기존 비밀번호<span style="color:#1bceb8; margin-left:5px;">*</span></td>
  				<td>
  					<input type="password" name="originPasswd" id="originPasswd"/>
  				</td>
  			</tr>
  			
  			
  			<tr>
  				<td>신규 비밀번호<span style="color:#1bceb8; margin-left:5px;">*</span></td>
  				<td>
  					<input type="password" name="newPasswd" id="newPasswd"/><span id="error" style="margin-left:20px;" >영문, 숫자, 특수문자 조합 8자 이상 입력하세요.</span>
  				</td>
  			</tr>
  			
  			<tr>
  				<td>비밀번호 확인<span style="color:#1bceb8; margin-left:5px;">*</span></td>
  				<td>
  					<input type="password" name="checkPasswd" id="checkPasswd"/>
  				</td>
  			</tr>

  		</table>

  		
  		
  	</div>
  	
  	<p style="text-align:center; margin-top:20px;">
	  	<button type="button" onclick="goChange();" style="background-color:#1bceb8; color:white; border-radius:30px; width:155px; border:none; padding:10px;">변경하기</button>
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