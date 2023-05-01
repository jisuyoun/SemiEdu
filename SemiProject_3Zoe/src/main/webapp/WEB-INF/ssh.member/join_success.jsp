<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

<script type="text/javascript">

	function autoLogin() {
		
		const frm = document.loginFrm;
		frm.action = "<%= request.getContextPath()%>/login/login.go";
		frm.method = "post";
		frm.submit();
	}

</script>

<title>회원가입 성공</title>
</head>
<body>


<link rel="stylesheet" type="text/css" href="../ssh.css/member.css" />

  <body>

<div class="login_cont member_cont">
	<div class="login_in">
		<h1><img src="<%= ctxPath%>/ssh.img/logo.png" alt="워너에듀 로고" class="svg_logo"/></h1>
		<h3>서상현님 환영합니다!</h3>

		<div class="process_cont">
			<dl>
				<dt><img src="<%= ctxPath%>/ssh.img/process_01.png" alt="방법선택" /></dt>
				<dd>방법선택</dd>
			</dl>
			<dl>
				<dt><img src="<%= ctxPath%>/ssh.img/process_02.png" alt="약관동의" /></dt>
				<dd>약관동의</dd>
			</dl>
			<dl>
				<dt><img src="<%= ctxPath%>/ssh.img/process_03.png" alt="정보입력" /></dt>
				<dd>정보입력</dd>
			</dl>
			<dl class="up">
				<dt><img src="<%= ctxPath%>/ssh.img/process_04_up.png" alt="가입완료" /></dt>
				<dd>가입완료</dd>
			</dl>
		</div>
	</div>

	<div class="mem_cont">
	 <form name="loginFrm">
		<h4 class="mem_tit center">
			회원가입이 완료되어 <br />
			홈으로 이동합니다.
		</h4>
		<div class="btn_list">
			<button onclick="autoLogin()" class="moreBtn bgColor">확인</button>
		</div>
	
		<input type="hidden" name="userid" value="${requestScope.userid}" />
		<input type="hidden" name="pwd" value="${requestScope.pwd}" />
	 </form>
	</div>
</div>
</body>
</html>
    <iframe src="" name="sysfrm" id="sysfrm" width="100%" height="0" scrolling="no" frameborder="0"></iframe>
    
</body>
</html>