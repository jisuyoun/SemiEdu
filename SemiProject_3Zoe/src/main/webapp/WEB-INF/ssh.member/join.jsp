<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="../css2/common.css" />
<link rel="stylesheet" type="text/css" href="../css2/font_notoSans.css" />
<link rel="stylesheet" type="text/css" href="../css2/green_theme.css" />


<title>회원가입</title>
</head>
<body>


 <link rel="stylesheet" type="text/css" href="../css/member.css" />

    <style>
	.select_box {border:1px solid #dddfe3;transition:0.3s ease-in;padding:10px 20px 10px;border-radius:5px;margin-right:5px;}
	#uploader {width:100%;height:100px;border:1px solid #DDD;overflow:auto;border-radius:5px;}
	.qq-gallery.qq-uploader {line-height:68px;font-size:10px;padding:10px;}
	.qq-gallery .qq-upload-button {background:#fff;color:#999;font-size:14px;padding:5px;border:1px solid #DEDEDE;border-radius:5px;}
	.qq-gallery .qq-upload-list li {height:78px;}
	.qq-gallery .qq-thumbnail-wrapper {width:100px;height:40px;}
	.qq-gallery .qq-file-info {padding-top:0;}

	.mem_cont .myinfo_cont .comment {width:100%;font-size:14px;padding:5px;}
	.mem_cont .myinfo_cont .comment .good {color: #1758e0;}
	.mem_cont .myinfo_cont .comment .bad {color: #e01717;}
	.check_box {width:100%;}
</style>


<div class="login_cont member_cont">
	<div class="login_in">
		<a href="/main/index.jsp">
		<h1><img src="https://cdn.malgnlms.com/cdndata/kense/file/e69e843b2e715ad0390d80e8e54d2a97.png" alt="워너에듀 로고" class="svg_logo"/></h1>
		</a>
		<h3>새로운 계정으로 회원가입 하세요!</h3>

		<div class="process_cont">
			<dl>
				<dt><img src="../img/process_01.png" alt="방법선택" /></dt>
				<dd>방법선택</dd>
			</dl>
			<dl>
				<dt><img src="../img/process_02.png" alt="약관동의" /></dt>
				<dd>약관동의</dd>
			</dl>
			<dl class="up">
				<dt><img src="../img/process_03_up.png" alt="정보입력" /></dt>
				<dd>정보입력</dd>
			</dl>
			<dl>
				<dt><img src="../img/process_04.png" alt="가입완료" /></dt>
				<dd>가입완료</dd>
			</dl>
		</div>
	</div>

	<form name="form1" method="POST" target="sysfrm" onsubmit="return goSubmit(this);">
	<input type="hidden" name="ek" value="e93651e5dd3aafd46d1704c698d762b8">
	<input type="hidden" name="k" value="nnDicIFtKv">
	<input type="hidden" name="verify_email_yn" value="N">
	<input type="hidden" name="domain" value="www.wannaedu.com">
	<input type="hidden" name="session_id" value="63d2853cb22acd53a454962059498cef89621d5b">
	<div class="mem_cont">
		<h4 class="mem_tit marb40 inline">회원정보 입력 <span class="tx"><span class="pointColor">*</span> 필수 입력 정보입니다.</span></h4>

		<div class="myinfo_cont refund_info">
			
			
			<dl>
				<dt>아이디 <span class="pointColor">*</span></dt>
				<dd>
					<input name="login_id" class="input" id="login_id" maxlength="20" type="text"  placeholder="영문 또는 숫자 2~20자리" onblur="checkLoginId('')" />
					<div class="comment" id="checkLoginIdArea">
						<span>영문으로 시작하는 2-20자 영문, 숫자 조합을 입력하세요.</span>
					</div>
				</dd>
				<script>
					function checkLoginId(loginId) {
						var f = document.forms['form1'];
						var area = document.getElementById("checkLoginIdArea");
						var comment = "영문으로 시작하는 2-20자 영문, 숫자 조합을 입력하세요.";
						var value = f["login_id"].value;
						if(value == "") { area.innerHTML = comment; return; }

						var pattern = /^[a-zA-Z]{1}[a-zA-Z0-9]{1,19}$/;
						if(loginId == value) {
							area.innerHTML = "<span class=\"bad\">" + comment + "</span>";
							return;
						}
						if(!pattern.test(value)) {
							area.innerHTML = "<span class=\"bad\">" + comment + "</span>";
							return;
						}

						call("join2.jsp?mode=CHECK&v=" + escape(value) + "&ek=e93651e5dd3aafd46d1704c698d762b8&k=nnDicIFtKv", "checkLoginIdArea");
					}
				</script>
			</dl>
			

			
			<dl>
				<dt>비밀번호 <span class="pointColor">*</span></dt>
				<dd>
					<input name="passwd" class="input" id="passwd" maxlength="50" type="password" placeholder="영문, 숫자, 특수문자 8자 이상" onblur="setPasswork()" />
				</dd>
				<script>
				function setPasswork() {
					var f = document.forms['form1'];
					var area = document.getElementById("checkPasswordArea");
					var comment = "영문, 숫자, 특수문자 조합 8자 이상 입력하세요.";
					var passwd = f["passwd"].value;
					var passwd2 = f["passwd2"].value;

					if(passwd == "") { area.innerHTML = comment; return; }
					if(passwd2 == "") { area.innerHTML = comment; return; }

					var pattern = /^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\W_]).{8,}$/;
					if(!pattern.test(passwd)) {
						area.innerHTML = "<span class=\"bad\">" + comment + "</span>"
						return;
					}
					if(passwd && !passwd2) {
						area.innerHTML = "비밀번호 확인란에 비밀번호를 입력하세요.";
						//f['passwd2'].focus();
						return;
					}
					if(passwd != passwd2) {
						area.innerHTML = "<span class=\"bad\">두 비밀번호가 일치하지 않습니다.</span>";
						return;
					}
					area.innerHTML = "<span class=\"good\">두 비밀번호가 일치합니다.</span>";
				}

				function resetPassword() {
					var el1 = document.getElementsByName('passwd');
					var el2 = document.getElementsByName('passwd2');
					for(var i = 0; i < el1.length; i++) el1[i].value = '';
					for(var j = 0; j < el2.length; j++) el2[j].value = '';

					setPasswork();
				}
				</script>
			</dl>

			<dl>
				<dt>비밀번호 재입력 <span class="pointColor">*</span></dt>
				<dd>
					<input name="passwd2" class="input" id="passwd2" maxlength="50" type="password" placeholder="영문, 숫자, 특수문자 8자 이상" onblur="setPasswork()" />
					<div class="comment" id="checkPasswordArea">
						<span>영문, 숫자, 특수문자 조합 8자 이상 입력하세요.</span>
					</div>
				</dd>
			</dl>
			

			
			<dl>
				<dt>이름 <span class="pointColor">*</span></dt>
				<dd>
					<input name="user_nm" class="input" type="text" id="user_nm" maxlength="20" />
					<div class="comment">
					
					</div>
				</dd>
			</dl>
			
			

			

			

			

			
			
			<dl>
				<dt>
					이메일
					
					<span class="pointColor">*</span>
					
				</dt>
				<dd>
					<input name="email1" id="email1" type="text" class="input input_m2" ><span class='hipen2'>@</span>
					<input name="email2" id="email2" type="text" class="input input_m2" >
					<div class="selectBox select_email input_m2" style="margin-right: 15px;">
						<select name="email3" id="email3" onchange="document.forms['form1']['email2'].value = this.value;if(!this.value) document.forms['form1']['email2'].focus();">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</div>
					

					<div class="check_box">
						<label><input name="email_yn" value="Y" type="radio" class="radio" >수신동의</label>
						<label><input name="email_yn" value="N" type="radio" class="radio" >수신거부</label>
					</div>
				</dd>
			</dl>
			
			
			

			
			
			<dl>
				<dt>
					휴대전화
					
					<span class="pointColor">*</span>
					
				</dt>
				<dd>
					<div class="selectBox input_num">
						<select name="mobile1" id="mobile1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
						</select>
					</div>
					<span class="hipen">-</span>
					<input name="mobile2" class="input input_num" type="text" id="mobile2" maxlength="4">
					<span class="hipen">-</span>
					<input name="mobile3" class="input input_num" type="text" id="mobile3" maxlength="4" onchange=''>
					<div class="check_box">
						<label><input name="sms_yn" value="Y" type="radio" class="radio" />수신동의</label>
						<label><input name="sms_yn" value="N" type="radio" class="radio" />수신거부</label>
					</div>
				</dd>
			</dl>
			
			
			

			

			

			

			
			

			

			
		</div>
	</div>

	<div class="btn_list">
		<input type="button" class="moreBtn pointColor pointBorder" onclick="location.href= 'agreement.jsp'" value="이전으로" />
		<input type="submit" class="moreBtn bgColor pointBorder" id="btn_submit" value="회원가입하기" />
	</div>
	
</body>
</html>