<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" >

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">



<style type="text/css">
	
	.login_cont {
    border: 10px solid #f3f7f8;
	}
	
	ul {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
	}
	
	.bgColor {
    background-color: #1bceb8 !important;
	}
	
	
	
		
	
	
</style>

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<link rel="stylesheet" type="text/css" href="../ssh.css/common.css">
<link rel="stylesheet" type="text/css" href="../ssh.css/custom.css">
<link rel="stylesheet" type="text/css" href="../ssh.css/member.css">

<script type="text/javascript">
	$(document).ready(function(){
		
		$("button#loginSubmit").click(function(e){
			goLogin();
		});
		
		$("input#loginPwd").bind("keydown", function(e){
			if(e.keyCode == 13) { // 암호입력란에 엔터를 했을경우 (keyCode  C 대문자!!!!!!!!!!!)
				goLogin();
			}      
		});
		
			
		
	});
	
	// Function Declaration
	// == 로그인 처리 함수 ==
	function goLogin() {
	// alert("로그인 시도함");
	
	const loginUserid = $("input#loginUserid").val().trim();
	const loginPwd = $("input#loginPwd").val().trim();
	
	if(loginUserid == "") {
		alert("아이디를 입력하세요!");
		$("input#loginUserid").val("");
		$("input#loginUserid").focus();
		return; // goLogin() 함수 종료
	}
	
	if(loginPwd == "") {
		alert("암호를 입력하세요!");
		$("input#loginPwd").val("");
		$("input#loginPwd").focus();
		return; // goLogin() 함수 종료
	}
	
	const frm = document.loginFrm;
	frm.action = "<%=request.getContextPath()%>/login/login.go";
	frm.method = "post";
	frm.submit();
	
}// end of function goLogin()-------------------------------------
</script>
	
</head>
<body>
	
	<div class="login_cont">
	<div class="login_in">
		<a href="/SemiProject_3Zoe/">
		<h1><img src="https://cdn.malgnlms.com/cdndata/kense/file/e69e843b2e715ad0390d80e8e54d2a97.png" alt="워너에듀 로고" class="svg_logo"></h1>
		</a>
		<h3>가입한 계정으로 로그인 하세요.</h3>

		<form name="loginFrm">


		<dl class="login_input">
			<dd><input type="text" id="loginUserid" name="userid" class="input" placeholder="아이디" hname="아이디"></dd>
			<dd><input type="password" id="loginPwd" name="pwd" class="input" placeholder="비밀번호" hname="비밀번호"></dd>
			<dt><button type="button" id="loginSubmit" value="로그인" class="bgColor search_btn" >로그인</button></dt>
		</dl>
		</form>

		<ul>
			<li>
				아직 회원이 아니라면?
				<a href="http://localhost:9090/SemiProject_3Zoe/ssh.member/agreement.jsp" >회원가입</a>
			</li>
			<li>
				아이디/비밀번호가 생각나지 않는다면?
				<a href="/SemiProject_3Zoe/ssh.login/id_pwd_find.jsp">아이디 /비밀번호 찾기</a>
			</li>
		</ul>

	</div>
</div>
</body>
</html>