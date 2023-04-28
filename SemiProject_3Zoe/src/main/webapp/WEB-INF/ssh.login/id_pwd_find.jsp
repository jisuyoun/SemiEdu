<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>

<link rel="stylesheet" type="text/css" href="../ssh.css/member.css">

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

</head>
<body>
<link rel="stylesheet" type="text/css" href="../ssh.css/member.css" />

    <div class="login_cont member_cont idpw_cont">
	<div class="login_in">
		<a href="/main/index.jsp">
		<h1><img src="https://cdn.malgnlms.com/cdndata/kense/file/e69e843b2e715ad0390d80e8e54d2a97.png" alt="워너에듀 로고" class="svg_logo"/></h1>
		</a>
		<h3>아이디와 비밀번호가 생각이 안 나시나요?</h3>
	</div>

	<div class="mem_cont">
		<ul class="tab_cont grayBox">
			<li><a href="javascript:findId();" id="find-1" class="tab_up pointColor pointBorder">아이디 찾기</a></li>
			<li><a href="javascript:findPasswd();" id="find-2">비밀번호 찾기</a></li>
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
			<script>
			function goFindId() {
				var f = document.forms['form1'];
				if(!validate(f)) return;
				f.submit();
				return;
			}
			</script>
			</div>

			<div class="myinfo_cont refund_info sms_cont" style="display:none;">
				<form name="form4" method="POST" target="sysfrm">
				<input type="hidden" name="mode" value="sms_authno">
				<input type="hidden" name="target" value="id">
				<input type="hidden" name="domain" value="www.wannaedu.com">
				<h4 class="mem_tit marb20 inline">회원정보 입력 <span class="tx"> 회원가입 시 입력한 이름과 휴대전화를 입력해 주세요.</span></h4>
				<dl>
					<dt>이름 <span class="pointColor">*</span></dt>
					<dd><input name="user_nm" class="input" type="text" HNAME="이름" REQUIRED="Y" ></dd>
				</dl>

				<dl>
					<dt>휴대전화 <span class="pointColor">*</span></dt>
					<dd>
						<div class="selectBox input_num">
							<select class="select_box" name="mobile1" id="mobile1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="012">012</option>
								<option value="016">016</option>
								<option value="017">017</option>
							</select>
						</div>
						<span class="hipen">-</span>
						<input type="text" name="mobile2" class="input input_num" maxlength="4" HNAME="휴대전화" REQUIRED="Y" />
						<span class="hipen">-</span>
						<input type="text" name="mobile3" class="input input_num" maxlength="4" HNAME="휴대전화" REQUIRED="Y" />
						<input type="button" class="certi_btn" value="인증번호발급" onclick="sendIdSmsAuthNo()"/>
<!--						<p class="notice pointColor"><i class="pointBorder pointColor">!</i>입력하신 정보와 일치하는 회원이 없습니다. 입력한 정보를 다시 확인하세요.</p>-->

					</dd>
				</dl>
				<dl>
					<dt></dt>
					<dd>
						<input name="auth_no" class="input" type="text" placeholder="발송된 인증번호 입력"  HNAME="인증번호">
<!--						<input type="button" class="certi_btn" value="인증번호 확인" onclick="sendIdSmsNewPasswd()" />-->
					</dd>
				</dl>
				<div class="btn_list">
					<a href="#" class="moreBtn bgColor" onclick="sendIdSmsNewPasswd()">인증번호 확인</a>
				</div>
				</form>
			</div>
<!--			<div class="btn_list">-->
<!--	&lt;!&ndash;			<a href="../member/info_result.html" class="moreBtn bgColor">아이디찾기</a>&ndash;&gt;-->
<!--				<input type="button" class="moreBtn bgColor" onclick="goFindId()" value="아이디찾기" />-->
<!--			</div>-->
			<script>
			function sendIdSmsAuthNo() {
				var f = document.forms['form4'];
				f['mode'].value = "sms_authno";
				f['auth_no'].removeAttribute("REQUIRED");
				if(!validate(f)) return;
				f.submit();
				f['mode'].value = "";
			}
			function sendIdSmsNewPasswd() {
				var f = document.forms['form4'];
				f['mode'].value = "sms_passwd";
				f['auth_no'].setAttribute("REQUIRED", "Y");
				if(!validate(f)) return;
				f.submit();
				f['mode'].value = "";
			}
			</script>
		</div>

		<div class="passwd_cont">
			<div class="myinfo_cont refund_info email_cont">
				<form name="form2" method="POST" target="sysfrm">
				<input type="hidden" name="mode" value="email_authno">
				<input type="hidden" name="domain" value="www.wannaedu.com">
				<h4 class="mem_tit marb20 inline">회원정보 입력 <span class="tx"> 회원가입 시 입력한 아이디, 이름과 이메일을 입력해 주세요.</span></h4>
				<dl>
					<dt>아이디 <span class="pointColor">*</span></dt>
					<dd><input name="login_id" class="input" type="text" HNAME="아이디" REQUIRED="Y" /></dd>
				</dl>

				<dl>
					<dt>이름 <span class="pointColor">*</span></dt>
					<dd><input name="user_nm" class="input" type="text" HNAME="이름" REQUIRED="Y" /></dd>
				</dl>

				<dl>
					<dt>이메일 <span class="pointColor">*</span></dt>
					<dd>
						<input name="email1" id="email1" type="text" class="input input_m2" HNAME="이메일" REQUIRED="Y" /><span class='hipen2'>@</span>
						<input name="email2" id="email2" type="text" class="input input_m2" HNAME="이메일" REQUIRED="Y" />
						<div class="selectBox select_email input_m2" style="vertical-align:2px;">
							<select name="email3" id="email3" onchange="document.forms['form2']['email2'].value = this.value;if(!this.value) document.forms['form2']['email2'].focus();">
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
						<input type="button" class="add_btn" value="인증번호 받기" onclick="sendEmailAuthNo()" />
<!--						<p class="notice pointColor"><i class="pointBorder pointColor">!</i>입력하신 정보와 일치하는 회원이 없습니다. 입력한 정보를 다시 확인하세요.</p>-->
					</dd>
				</dl>

				<dl>
					<dt></dt>
					<dd>
						<input name="auth_no" class="input" type="text" placeholder="발송된 인증번호 입력 "  HNAME="인증번호">
<!--						<input type="button" class="certi_btn" value="인증번호 확인" onclick="sendEmailNewPasswd()">-->
					</dd>
				</dl>
				<div class="btn_list">
					<a href="#" class="moreBtn bgColor" onclick="sendEmailNewPasswd()">인증번호 확인</a>
				</div>
				</form>
			</div>
			<script>
			function sendEmailAuthNo() {
				var f = document.forms['form2'];
				f['mode'].value = "email_authno";
				f['auth_no'].removeAttribute("REQUIRED");
				if(!validate(f)) return;
				f.submit();
				f['mode'].value = "";
			}
			function sendEmailNewPasswd() {
				var f = document.forms['form2'];
				f['mode'].value = "email_passwd";
				f['auth_no'].setAttribute("REQUIRED", "Y");
				if(!validate(f)) return;
				f.submit();
				f['mode'].value = "";
			}
			</script>


			<div class="myinfo_cont refund_info sms_cont" style="display:none;">
				<form name="form3" method="POST" target="sysfrm">
				<input type="hidden" name="mode" value="sms_authno">
				<input type="hidden" name="target" value="password">
				<input type="hidden" name="domain" value="www.wannaedu.com">
				<h4 class="mem_tit marb20 inline">회원정보 입력 <span class="tx"> 회원가입 시 입력한 아이디, 이름과 이메일을 입력해 주세요.</span></h4>
				<dl>
					<dt>아이디 <span class="pointColor">*</span></dt>
					<dd><input name="login_id" class="input" type="text" HNAME="아이디" REQUIRED="Y" /></dd>
				</dl>

				<dl>
					<dt>이름 <span class="pointColor">*</span></dt>
					<dd><input name="user_nm" class="input" type="text" HNAME="이름" REQUIRED="Y" /></dd>
				</dl>

				<dl>
					<dt>휴대전화 <span class="pointColor">*</span></dt>
					<dd>
						<div class="selectBox input_num">
							<select class="select_box" name="mobile1" id="mobile1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="012">012</option>
								<option value="016">016</option>
								<option value="017">017</option>
							</select>
						</div>
						<span class="hipen">-</span>
						<input type="text" name="mobile2" class="input input_num" maxlength="4" HNAME="휴대전화" REQUIRED="Y" />
						<span class="hipen">-</span>
						<input type="text" name="mobile3" class="input input_num" maxlength="4" HNAME="휴대전화" REQUIRED="Y" />
						<input type="button" class="certi_btn" value="인증번호발급" onclick="sendSmsAuthNo()"/>
	<!--					<p class="notice pointColor"><i class="pointBorder pointColor">!</i>입력하신 정보와 일치하는 회원이 없습니다. 입력한 정보를 다시 확인하세요.</p>-->
					</dd>
				</dl>
				<dl>
					<dt></dt>
					<dd>
						<input name="auth_no" class="input" type="text" placeholder="발송된 인증번호 입력"  HNAME="인증번호"/>
<!--						<input type="button" class="certi_btn" value="인증번호 받기" onclick="sendSmsNewPasswd()" />-->
					</dd>
				</dl>
				<div class="btn_list">
					<a href="#" class="moreBtn bgColor" onclick="sendSmsNewPasswd()">인증번호 확인</a>
				</div>
				</form>
			</div>
			<script>
			function sendSmsAuthNo() {
				var f = document.forms['form3'];
				f['mode'].value = "sms_authno";
				f['auth_no'].removeAttribute("REQUIRED");
				if(!validate(f)) return;
				f.submit();
				f['mode'].value = "";
			}
			function sendSmsNewPasswd() {
				var f = document.forms['form3'];
				f['mode'].value = "sms_passwd";
				f['auth_no'].setAttribute("REQUIRED", "Y");
				if(!validate(f)) return;
				f.submit();
				f['mode'].value = "";
			}
			</script>

		</div>
	</div>
</div>
</body>
</html>