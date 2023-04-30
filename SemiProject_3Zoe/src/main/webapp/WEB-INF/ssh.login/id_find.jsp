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
		
		

	});
	

	
	
	
	
	

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
				<form name="form1" method="POST" target="sysfrm">
				<input type="hidden" name="mode" value="find_id">
				<input type="hidden" name="domain" value="www.wannaedu.com">
				<h4 class="mem_tit marb20 inline">회원정보 입력 <span class="tx"> 회원가입 시 입력한 이름과 이메일을 입력해 주세요.</span></h4>
				<dl>
					<dt>이름 <span class="pointColor">*</span></dt>
					<dd><input name="user_nm" class="input" type="text" HNAME="이름" REQUIRED="Y" ></dd>
				</dl>

				<dl>
					<dt>이메일 <span class="pointColor">*</span></dt>
					<dd>
						<input type="text" name="email1"  class="input input_m2" HNAME="이메일" REQUIRED="Y"><span class='hipen2'>@</span>
						<input type="text" name="email2"  class="input input_m2" HNAME="이메일" REQUIRED="Y">
						<div class="selectBox select_email input_m2"  style="vertical-align:2px;">
							<select name="email3" id="email3" onchange="document.forms['form1']['email2'].value = this.value;if(!this.value) document.forms['form1']['email2'].focus();">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="empal.com">empal.com</option>
								<option value="unitel.co.kr">unitel.co.kr</option>
								<option value="gmail.com">gmail.com</option>
								<option value="korea.com">korea.com</option>
								<option value="chol.com">chol.com</option>
								<option value="paran.net">paran.net</option>
								<option value="freechal.com">freechal.com</option>
								<option value="hotmail.com">hotmail.com</option>
							</select>
						</div>
<!--						<p class="notice pointColor"><i class="pointBorder pointColor">!</i>입력하신 정보와 일치하는 회원이 없습니다. 입력한 정보를 다시 확인하세요.</p>-->
<!--						<input type="button" class="add_btn" value="아이디찾기" onclick="goFindId()" />-->
					</dd>
				</dl>
				<div class="btn_list">
					<a href="#" class="moreBtn bgColor" onclick="goFindId()">아이디 찾기</a>
				</div>
				</form>

			</div>
		</div>
	</div>
</div>
</body>
</html>