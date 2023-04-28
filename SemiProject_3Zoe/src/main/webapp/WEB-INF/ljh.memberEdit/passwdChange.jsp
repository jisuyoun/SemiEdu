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

.green{
color:#1bceb8;
}

.red{
color:#1bceb8; 
}


	
</style>  


			
<script type="text/javascript">


	$(document).ready(function(){
		
		
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
				
				
			}
			//두 비밀번호가 일치하지 않습니다.
			// 비밀번호 확인란에 비밀번호를 입력하세요.
			
		});
		
		
		
	});//$(document).ready(function()

</script>			


<div class="main1" >
  	
  	<div class="content1" style="background-color:white; border-radius:20px; padding:20px 30px; ;width:100%; height:400px; ">
  		<p style="font-weight:bold; margin-bottom:15px;">비밀번호 변경</p>
  		
  		<table>
  			<tr>
  				<td>기존 비밀번호<span style="color:#1bceb8; margin-left:5px;">*</span></td>
  				<td>
  					<input type="password" name="originPasswd"></input>
  				</td>
  			</tr>
  			
  			
  			<tr>
  				<td>신규 비밀번호<span style="color:#1bceb8; margin-left:5px;">*</span></td>
  				<td>
  					<input type="password" name="newPasswd" id="newPasswd"></input><span id="error" class="green" style="margin-left:20px;" >영문, 숫자, 특수문자 조합 8자 이상 입력하세요.</span>
  				</td>
  			</tr>
  			
  			<tr>
  				<td>비밀번호 확인<span style="color:#1bceb8; margin-left:5px;">*</span></td>
  				<td>
  					<input type="password" name="checkPasswd"></input>
  				</td>
  			</tr>

  		</table>

  		
  		
  	</div>
  	
  	<p style="text-align:center; margin-top:20px;">
	  	<button type="button" style="background-color:#1bceb8; color:white; border-radius:30px; width:155px; border:none; padding:10px;">변경하기</button>
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