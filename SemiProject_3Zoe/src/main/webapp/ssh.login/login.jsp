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
	
</head>
<body>
	
	<div class="login_cont">
	<div class="login_in">
		<a href="/main/index.jsp">
		<h1><img src="https://cdn.malgnlms.com/cdndata/kense/file/e69e843b2e715ad0390d80e8e54d2a97.png" alt="워너에듀 로고" class="svg_logo"></h1>
		</a>
		<h3>가입한 계정으로 로그인 하세요.</h3>

		<form name="form1" method="post" action="/member/login.jsp" onsubmit="return goSubmit(this);" target="sysfrm">
		<input type="hidden" name="domain" value="www.wannaedu.com">

		<input type="hidden" name="returl" value="https://www.wannaedu.com/mypage/index.jsp">


		<dl class="login_input">
			<dd><input type="text" name="userid" class="input" placeholder="아이디" hname="아이디" required="Y"></dd>
			<dd><input type="password" name="passwd" class="input" placeholder="비밀번호" hname="비밀번호" required="Y"></dd>
			<dt><input type="submit" value="로그인" class="bgColor search_btn"></dt>
		</dl>
		</form>
		<script type="text/javascript">

		</script>

		<ul>
			<li>
				아직 회원이 아니라면?
				<a href="agreement.jsp" >회원가입</a>
			</li>
			<li>
				아이디/비밀번호가 생각나지 않는다면?
				<a href="id_pwd_find.jsp">아이디 /비밀번호 찾기</a>
			</li>
		</ul>

	</div>
</div>
</body>
</html>