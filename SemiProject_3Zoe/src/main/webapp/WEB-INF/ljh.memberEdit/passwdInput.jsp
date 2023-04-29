<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
//		/SemiProject_3Zoe
    
%>   
 
<jsp:include page="/WEB-INF/ljh.myPage/header.jsp"/>

<script type="text/javascript">

	$(document).ready(function(){
		

		//확인버튼 클릭시
		$("button#btnSubmit").click(function(){
			goLogin();
		});
		

		//엔터버튼 클릭시
		$("button#btnSubmit").bind("keydown",function(e){
			if(e.keyCode == 13){	//keycode 아니고 keyCode. 13은 엔터. 즉 암호칸에 엔터를 쳤을 경우
				goLogin();
			}
		});
		
	});//$(document).ready(function()
	
	
	
	function goLogin(){
		
		const inputPasswd = $("input#passwd").val().trim();
		
		if(inputPasswd == ""){
			alert("암호를 입력하세요!");
			return;
		}
	
		//입력된 비밀번호가 로그인된 계정의 비밀번호와 같은지 검사해야함. 이건 class로 가서 dao로 가서 함
		
		
		
		const frm = document.passwdInput;
		frm.action = "<%=ctxPath%>/ljh.member.controller/passwdInput.go";
		
		frm.method = "post";
		frm.submit();
	}//goLogin()
	
	
</script>

<form name="passwdInput">
<div class="main1">
  	
  	<div class="content4">
  		<p style="font-weight:bold;">개인정보 수정</p>
  		
  		<div style="display:flex; justify-content: center; align-items: center; height:400px;">
  			<div style="display:flex; flex-direction: column; justify-content: center; align-items: center;">
  				<div style="border-radius:50%; background-color:#f3f7f8; width:120px; height:120px; display:flex; justify-content: center; align-items: center;">
 					<p class="pCenter"><i class="fa-solid fa-lock fa-2xl" ></i></p>
 				</div>
 				
 				<p class="pCenter" style="margin-top:20px;">비밀번호를 입력해주세요</p>
 				<p  class="pCenter" style="margin-top:20px; font-size:12pt; color:gray; ">회원님의 개인정보 보호를 위해 회원정보를 조회/수정하기 전</p>
 				<p  class="pCenter" style="font-size:12pt; color:gray; ">비밀번호를 다시 확인 받고 있습니다.</p>
 				
 				<p class="pCenter" style="text-align:center; margin-top:30px;">
	 				<input type="password" id="passwd" name="passwd"   style=" height:47.6px; vertical-align: middle;" placeholder="비밀번호"></input>
	 				<button type="button" id="btnSubmit" class="btn btn-dark height:48px; btn-lg" style="">확인</button>
 				</p>
  			</div>
  		</div>

  	</div>
  
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