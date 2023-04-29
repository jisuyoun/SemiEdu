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

	padding:40px 0;
}

td.tdS{
	font-size:15pt;
}



label.spanS{
	font-size:13pt;
}

	
</style>


<script type="text/javascript">

	$(document).ready(function(){
		

		//확인버튼 클릭시
		$("button#btnSubmit").click(function(){
			goCheck();
		});
		

		
	});//$(document).ready(function()
	
	
	//제출버튼을 누르기 전에 체크박스를 눌렀는지
	function goCheck(){
		
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


 
</head>
  

<div class="main1" >
  	
  	<div class="content1" style="background-color:white; border-radius:20px; padding:20px 30px; ;width:100%; height:300px; ">
  		<p style="font-weight:bold; margin-bottom:15px;">회원탈퇴</p>
  		
  		<table>
  			<tr>
  				<td class="tdS">비밀번호<span style="color:#1bceb8; margin-left:5px;">*</span></td>
  				<td>
  					<input type="password"></input>
  				</td>
  			</tr>
  			
  			
  			
  			<tr>
  				<td class="tdS">정보삭제 동의<span style="color:#1bceb8; margin-left:5px;">*</span></td>
  				<td>
  					<input type="checkbox" style="zoom: 1.5;" id="chkboxInfo"/>
  					<label class="spanS" for="chkboxInfo">탈퇴 후에는 유료로 구매한 과정을 포함한 모든 수강정보가 삭제되어 복구가 불가능하며, 약관에 따라 일정 시일 후 모든 정보가 삭제됩니다.</label>
  				</td>
  			</tr>

  		</table>

  		
  		
  	</div>
  	
  	<p style="text-align:center; margin-top:20px;">
	  	<button type="button" id="btnSubmit" style="background-color:#1bceb8; color:white; border-radius:30px; width:155px; border:none; padding:10px;">탈퇴하기</button>
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