<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<link rel="stylesheet" type="text/css" href="../ssh.css/member.css">
<link rel="stylesheet" type="text/css" href="../ssh.css2/common.css" />
<link rel="stylesheet" type="text/css" href="../ssh.css2/font_notoSans.css" />
<link rel="stylesheet" type="text/css" href="../ssh.css2/green_theme.css" />

<style type="text/css">

	
	
	h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
	}
	
	
	* {
    font-family: 'Noto Sans KR', Malgun Gothic,'Malgun Gothic', 'Outfit', sans-serif;
	}
	
	.login_cont {
    border: 10px solid #f3f7f8;
	}
	
	.pointColor {
    color: #1bceb8 !important;
	}
	
	.pointBorder {
    border: 1px solid #1bceb8 !important;
	}

</style>

<script type="text/javascript">

	$(document).ready (function(){
		
		$("button#btnFind").click(function(){
			// 아이디에 대한 유효성 검사
			const useridVal = $("input#userid").val().trim();
			
			if(useridVal == "") {
				alert("아이디를 입력하세요!!");
				return;
			}
			
			// 이름에 대한 유효성 검사
			const usernameVal = $("input#name").val().trim();
			
			if(useridVal == "") {
				alert("이름을 입력하세요!!");
				return;
			}
			
			// e메일에 대한 정규표현식을 사용한 유효성 검사 
			const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	 	  
	 	  	const bool = regExp.test($("input#email").val());
	 	  	
			if(!bool) {
				alert("올바른 이메일을 입력하세요!!");
				return;
			}
			
			const frm = document.pwdFindFrm;
			frm.action = "<%=ctxPath%>/login/pwdFind.go";
			frm.method = "POST";
			frm.submit();
		 
		}); // end of $("button#btnFind").click(function()----------------
		 
		const method = "${requestScope.method}";  // "" 를 꼭 붙여야 변수로 인식
		
		if(method == "POST") {
			$("input#userid").val("${requestScope.userid}");
			$("input#name").val("${requestScope.name}");
			$("input#email").val("${requestScope.email}");
		}
		
		
		const method = "${requestScope.method}";  // "" 를 꼭 붙여야 변수로 인식
		
		if(method == "POST") {
			$("input#userid").val("${requestScope.userid}");
			$("input#email").val("${requestScope.email}");
			$("div#div_findResult").show();
			
		}
		else {
			$("div#div_findResult").hide();	
		}
		
		// 인증하기
		$("button#btnConfirmCode").click(function(){
			const frm = document.verifyCertificationFrm;
			
			frm.userCertificationCode.value = $("input#input_confirmCode").val();
			frm.userid.value = $("input#userid").val();
			
			frm.action = "<%= ctxPath%>/login/verifyCertification.go";
			frm.method = "post";
			frm.submit();
		
		});

	}); // end of $(document).ready (function()-----------------------------------
	
	
	

</script>

</head>
<body>
<link rel="stylesheet" type="text/css" href="../ssh.css/member.css" />

    <div class="login_cont member_cont idpw_cont">
	<div class="login_in">
		<a href="/SemiProject_3Zoe/">
		<h1><img src="../ssh.img/logo.png" alt="워너에듀 로고" class="svg_logo"/></h1>
		</a>
		<h3>아이디와 비밀번호가 생각이 안 나시나요?</h3>
	</div>

	<div class="mem_cont">
		<ul class="tab_cont grayBox">
			<li><a href="<%= ctxPath%>/login/idFind.go" id="find-1">아이디 찾기</a></li>
			<li><a id="find-2" class="tab_up pointColor pointBorder">비밀번호 찾기</a></li>
		</ul>

		<div class="radio_cont">
			<label><input name="certi" value="email" onclick="emailOtype(this.value);" type="radio" class="radio" checked>이메일 인증</label>
			
		</div>

		<div class="passwd_cont">
			<div class="myinfo_cont refund_info email_cont">
				<form name="pwdFindFrm">
				<input type="hidden" name="mode" value="email_authno">
				<input type="hidden" name="domain" value="www.wannaedu.com">
				<h4 class="mem_tit marb20 inline">회원정보 입력 <span class="tx"> 회원가입 시 입력한 아이디, 이름과 이메일을 입력해 주세요.</span></h4>
				<dl>
					<dt>아이디 <span class="pointColor">*</span></dt>
					<dd><input name="userid" id="userid" class="input" type="text" HNAME="아이디" /></dd>
				</dl>

				<dl>
					<dt>이름 <span class="pointColor">*</span></dt>
					<dd><input name="name" id="name" class="input" type="text" HNAME="이름" /></dd>
				</dl>

				<dl>
					<dt>이메일 <span class="pointColor">*</span></dt>
					<dd>
						<input name="email" id="email" type="text" class="input" HNAME="이메일" />

						<button type="submit" id="btnFind" class="add_btn" >인증번호 받기</button>
<!--						<p class="notice pointColor"><i class="pointBorder pointColor">!</i>입력하신 정보와 일치하는 회원이 없습니다. 입력한 정보를 다시 확인하세요.</p>-->
					</dd>
				</dl>
			 </form>

			</div>

		</div>
		<div id="div_findResult" class="myinfo_cont refund_info email_cont">	
			<c:if test="${requestScope.isUserExist == false}">
				<span style="color:red; margin-left: 150px;">사용자 정보가 없습니다.</span>
				</c:if>
				<c:if test="${requestScope.isUserExist == true && requestScope.sendMailSuccess == false}">
				<span style="color:red; margin-left: 150px;">메일발송이 실패했습니다.</span><br>
				</c:if>
				 <c:if test="${requestScope.isUserExist == true && requestScope.sendMailSuccess == true}">
						<span style="font-size: 10pt;">인증코드가 ${requestScope.email}로 발송되었습니다.</span><br>
						<span style="font-size: 10pt;">인증코드를 입력해주세요.</span><br>
			             <br><br>
					<dl>
						<dt></dt>
						<dd>
							<input name="input_confirmCode" id="input_confirmCode" class="input" type="text" placeholder="발송된 인증번호 입력 "  HNAME="인증번호">
						</dd>
					</dl>
			             <div class="btn_list">
							<button type="button" class="moreBtn bgColor" id="btnConfirmCode">인증번호 확인</button>
						</div>
				</c:if>
			</div>		
	</div>
</div>

<%-- 인증하기 form --%>
<form name="verifyCertificationFrm">
	<input type="hidden" name="userCertificationCode" />
	<input type="hidden" name="userid" />
</form>  

</body>
</html>