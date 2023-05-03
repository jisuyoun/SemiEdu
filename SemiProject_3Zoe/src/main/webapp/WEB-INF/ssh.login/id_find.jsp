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
		 $("span.error").hide();
		 
		const method = "${requestScope.method}";  // ""를 붙여줘야 "GET" 또는 "POST"
		
		if(method == "GET") {
			$("div#div_findResult").hide();
		}
		else if(method == "POST"){
			$("input#name").val("${requestScope.name}");
			$("input#email").val("${requestScope.email}");
			$("div.btn_list").hide();
		}
		// GET 방식이라면 hide, POST 방식라면 넘어온 값을 그대로 꽂아줌(?) 아이디 찾기에서 잘못된 정보를 입력하여도 이름, 이메일이 안 사라짐
		

	});// end of $(document).ready (function()---------------------------------------------------
	
	function goFindId() {
		
		// 이름에 대한 유효성 검사
		const useridVal = $("input#name").val().trim();
		
		if(useridVal == "") {
			alert("이름을 입력하세요!!");
			return;
		}
		
		// e메일에 대한 정규표현식을 사용한 유효성 검사 
		const emailVal = $("input#email").val();
 	  
		if(emailVal == "") {
			alert("이메일을 입력하세요!!");
			return;
		}
		
		////////////////////////////////////////////////
		const frm = document.idFindFrm;
		frm.action = "<%= ctxPath%>/login/idFind.go";
		frm.method = "post";
		frm.submit();
		
	}  
	
	
	
	

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
			<li><a id="find-1" class="tab_up pointColor pointBorder">아이디 찾기</a></li>
			<li><a href="<%= ctxPath%>/login/pwdFind.go" id="find-2">비밀번호 찾기</a></li>
		</ul>

		<div class="radio_cont">
			<label><input name="certi" value="email" onclick="emailOtype(this.value);" type="radio" class="radio" checked>이메일 인증</label>
			
		</div>

		<div class="id_cont">
			<div class="myinfo_cont refund_info email_cont">
				<form name="idFindFrm">
				<input type="hidden" name="mode" value="find_id">
				<input type="hidden" name="domain" value="www.wannaedu.com">
				<h4 class="mem_tit marb20 inline">회원정보 입력 <span class="tx"> 회원가입 시 입력한 이름과 이메일을 입력해 주세요.</span></h4>
				<dl>
					<dt>이름 <span class="pointColor">*</span></dt>
					<dd><input name="name" id="name" class="input requiredInfo" type="text" autocomplete="off" required HNAME="이름" >
						<span class="error" style= "color:red; font-size: 14px;">&nbsp;이름은 필수입력사항입니다.</span>
					</dd>
				</dl>

				<dl>
					<dt>이메일 <span class="pointColor">*</span></dt>
					<dd>
						<input type="text" name="email" id="email" class="input requiredInfo" autocomplete="off" required HNAME="이메일" >
						<span class="error" style= "color:red; font-size: 14px;">&nbsp;이메일 형식에 맞지 않습니다.</span>
					</dd>
				</dl>
				<div class="btn_list">
					<button type="button" id="findID" class="moreBtn bgColor" onclick="goFindId()">아이디 찾기</button>
				</div>
				</form>
			<div id="div_findResult">
			      <p class="text-center">
			         <br>회원님의 ID는  <span style="color: red; font-size: 16pt; font-weight: bold;">${requestScope.userid}</span> &nbsp;입니다.
			         <br><br><input type="button" align="center" style="background-color:#1bceb8; color:white; border-radius:30px; width:155px; border:none; padding:10px;" class="bgColor pointBorder" id="btn_submit" onclick="location.href='<%=request.getContextPath()%>/login/login.go'" value="로그인 이동" />
			      </p>
		    </div>	

			</div>
		</div>
	</div>
</div>
</body>
</html>