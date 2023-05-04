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
<title>휴먼계정 풀기</title>

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
	
	a#find-2 {
		display: contents;
    		width: 100%;
	}

</style>

<script type="text/javascript">

	$(document).ready (function(){
		
			$("button#btnFind").click(function(){
			
			const frm = document.pwdFindFrm;
			frm.action = "<%=ctxPath%>/login/sleeperAccount.go";
			frm.method = "POST";
			frm.submit();
		 
		}); // end of $("button#btnFind").click(function()----------------
		 
		const method = "${requestScope.method}";  // "" 를 꼭 붙여야 변수로 인식
		
		if(method == "POST") {
			$("div#div_findResult").show();
			
		}
		else {
			
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
		<h3>${requestScope.userid}&nbsp;&nbsp;님은 현재 휴먼 상태입니다.</h3>
	</div>

	<div class="mem_cont">
		<ul class="tab_cont grayBox">
			<li><a id="find-2" class="tab_up pointColor pointBorder">휴먼계정 활성화</a></li>
		</ul>

		<div class="radio_cont">
			<label>휴먼해제를 위해서는 이메일 인증이 필요합니다.</label>
			
		</div>

		<div class="passwd_cont">
			<div class="myinfo_cont refund_info email_cont">
				<form name="pwdFindFrm">
				<h4 class="mem_tit marb20 inline">가입시 등록하신 이메일(<span style="color: green; font-size: 14pt; font-weight: bold;">tkdgus078@naver.com${(sessionScope.loginuser).email}</span>)로 인증코드가 발송됩니다.</h4>
				<dl>
					<dt>마지막 접속일: </dt>
					<dd>${requestScope.lastLogdate}</dd>
				</dl>

				<dl>
					<dt>휴먼 계정 전환일: </dt>
					<dd>${requestScope.idleDate}</dd>
				</dl>

				<dl>
					<dt></dt>
					<dd>
						<input type="hidden" name="email" id="email" type="text" class="input" HNAME="이메일" value="${requestScope.email}"/>
					</dd>
				</dl>
			 </form>

			</div>

		</div>
		<div id="div_findResult" class="myinfo_cont refund_info email_cont">	
		
				<br>
				<c:if test="${requestScope.sendMailSuccess == false}">
				<span style="color:red; margin-left: 150px;">메일발송이 실패했습니다.</span><br>
				</c:if>
		
				<p style="text-align:center; margin-top:20px;">
	  				<button type="submit" id="btnFind" style="background-color:#1bceb8; color:white; border-radius:30px; width:155px; margin-left:90px; border:none; padding:10px;">인증번호 받기</button>
  				</p>
			
				<c:if test="${requestScope.sendMailSuccess == true}">
						<span style="font-size: 10pt; margin-left: 150px; font-weight: bold; color: black;">인증코드가 ${requestScope.email}로 발송되었습니다.</span><br>
						<span style="font-size: 10pt; margin-left: 150px; font-weight: bold; color: black;">인증코드를 입력해주세요.</span>
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
	<input type="hidden" name="userid" value="${(sessionScope.loginuser).userid}"/>
</form>  

</body>
</html>