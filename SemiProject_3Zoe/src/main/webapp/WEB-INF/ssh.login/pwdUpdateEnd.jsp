<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%
   String ctxPath = request.getContextPath();
   
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/ssh.css2/common.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/ssh.css2/font_notoSans.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/ssh.css2/green_theme.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/ssh.css/member.css" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<!-- jQueryUI CSS 및 JS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>


<style type="text/css">
	
	.mem_cont .myinfo_cont .comment {width:100%;font-size:14px;padding:5px;}
	.mem_cont .myinfo_cont .comment .good {color: #1758e0;}
	.mem_cont .myinfo_cont .comment .bad {color: #e01717;}
	.check_box {width:100%;}
	
	div#div_updateResult {
		font-size: 17pt
	}
</style>

<title>비밀번호 변경</title>

<script type="text/javascript">
	

	$(document).ready(function(){
		
		$("button#btnUpdate").click(function(){
			
			const pwd = $("input#pwd").val();
			const pwd2 = $("input#pwd2").val();
			
			const regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;  // 암호 정규표현식
	    	  
    	    const bool = regExp.test(pwd);
			
			if(!bool) {
				alert("암호는 8글자 이상 15글자 이하에 영문자,숫자,특수기호가 혼합되어야만 합니다.");
				$("input#pwd").val("");
				$("input#pwd2").val("");
				return;  // 종료
			}
			else if(bool && pwd != pwd2) {
				alert("암호가 일치하지 않습니다..");
				$("input#pwd").val("");
				$("input#pwd2").val("");
				return;  // 종료
			}
			else {

				const frm = document.pwdUpdateEndFrm;
				frm.action = "<%= ctxPath%>/login/pwdUpdateEnd.go";
				frm.method = "POST";
				frm.submit();
			}
			
		});
	

		
	}); // end of $(document).ready(function()--------------------------------------
			


</script>

</head>
<body>


<div class="login_cont member_cont">
	

	<form name="pwdUpdateEndFrm">

	<div class="mem_cont">
		<h4 class="mem_tit marb40 inline">비밀번호 변경 <span class="tx"><span class="pointColor">*</span> 필수 입력 정보입니다.</span></h4>

		<div class="myinfo_cont refund_info">
			
			
			<dl>
				<dt>신규 비밀번호 <span class="pointColor">*</span></dt>
				<dd>
					<input name="pwd" class="input requiredInfo" id="pwd" maxlength="50" type="password" placeholder="영문, 숫자, 특수문자 조합 8~15자" />
				</dd>
			</dl>

			<dl>
				<dt>비밀번호 재입력 <span class="pointColor">*</span></dt>
				<dd>
					<input name="pwd2" class="input requiredInfo" id="pwd2" maxlength="50" type="password" placeholder="영문, 숫자, 특수문자 조합 8~15자" />
				</dd>
			</dl>
			<input type="hidden" name="userid" value="${requestScope.userid}" />
			
		 <c:if test="${requestScope.method == 'GET'}">		
			<p style="text-align:center; margin-top:20px;">
	  			<button type="button" id="btnUpdate" style="background-color:#1bceb8; color:white; border-radius:30px; width:155px; border:none; padding:10px;">변경하기</button>
  			</p>
		 </c:if>
		
		</div>
	   </div>	
	</form>
	
	<c:if test="${requestScope.method == 'POST' && requestScope.n == 1}">
		<div id="div_updateResult" align="center">
		        사용자 ID ${requestScope.userid}님의 암호가 새로이 변경되었습니다.<br><br>
		<input type="button" align="center" style="background-color:#1bceb8; color:white; border-radius:30px; width:155px; border:none; padding:10px;" class="bgColor pointBorder" id="btn_submit" onclick="location.href='<%=request.getContextPath()%>/login/login.go'" value="로그인 이동" />        
		</div>
	  </c:if>    
	    
</div>
	
 


	
</body>
</html>