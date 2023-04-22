<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="../css2/common.css" />
<link rel="stylesheet" type="text/css" href="../css2/font_notoSans.css" />
<link rel="stylesheet" type="text/css" href="../css2/green_theme.css" />



<title>약관 동의</title>
</head>
<body>

<link rel="stylesheet" type="text/css" href="../css/member.css" />

<div class="login_cont">
	<div class="login_in">
		<a href="/main/index.jsp">
		<h1><img src="https://cdn.malgnlms.com/cdndata/kense/file/e69e843b2e715ad0390d80e8e54d2a97.png" alt="워너에듀 로고" class="svg_logo"/></h1>
		</a>
		<h3>새로운 계정으로 회원가입 하세요!</h3>

		<div class="process_cont">
			<dl class="up">
				<dt id="agree-1"><img src="../img/process_01_up.png" alt="방법선택" id="select-1" /></dt>
				<dd>방법선택</dd>
			</dl>
			<dl>
				<dt id="agree-2"><img src="../img/process_02.png" alt="약관동의" id="agree" /></dt>
				<dd>약관동의</dd>
			</dl>
			<dl>
				<dt><img src="../img/process_03.png" alt="정보입력" /></dt>
				<dd>정보입력</dd>
			</dl>
			<dl>
				<dt><img src="../img/process_04.png" alt="가입완료" /></dt>
				<dd>가입완료</dd>
			</dl>
		</div>

		<div class="mem_cont" id="mem-agree">
			<h4 class="mem_tit">회원가입 선택<span class="tx">회원가입 방법을 선택하세요. </span></h4>
			<dl class="sns_cont">
				<dd class="join bgColor"><input type="radio" name="sns" id="join" value=""><label for="join" onclick="goNormalJoin()">일반가입</label></dd>
			
			</dl>
			<p class="notice pointColor"><i class="pointBorder pointColor">!</i> 회원 가입 방법을 선택하세요.</p>
		</div>
	</div>

 	<div class="mem_cont" id="mem-join">
		<form name="form1" method="POST" target="sysfrm" onsubmit="return goSubmit(this);">
			<h4 class="mem_tit inline">가입 약관 동의<span class="tx">안내를 읽고 동의해 주세요.</span></h4>

			<div class="agree_cont">
				<h4><label style="cursor: pointer"><input name="agree_yn_all" onclick="checkAll(this.checked);" type="checkbox" class="check" />전체동의</label></h4>

				<div class="agree_in">
					<dl>
						<dt><input name="agree_yn1" id="agree_yn1" value="Y" type="checkbox" class="check" required="required" onclick="checkOne();"></dt>
						<dd>
							<label for="agree_yn1"><a href="javascript:openPageLayer('clause');">이용약관 동의 <b class="txt_red">(필수)</b></a></label>
						</dd>
					</dl>
					<dl>
						<dt><input name="agree_yn2" id="agree_yn2" value="Y" type="checkbox" class="check" required="required" onclick="checkOne();"></dt>
						<dd>
							<label for="agree_yn2"><a href="javascript:openPageLayer('policy');">개인정보취급 동의 <b class="txt_red">(필수)</b></a></label>
						</dd>
					</dl>
					<dl>
						<dt><input name="agree_yn3" id="agree_yn3" value="Y" type="checkbox" class="check" required="required" onclick="checkOne();" ></dt>
						<dd>
							<label for="agree_yn3"><a href="javascript:openPageLayer('consignment');">개인정보 처리위탁 동의 <b class="txt_red">(필수)</b></a></label>
						</dd>
					</dl>
					<dl>
						<dt>
							<input name="email_yn" id="email_yn" value="Y" type="checkbox" class="check" onclick="checkSms(this.checked); checkOne();" />
							<input name="sms_yn" value="Y" type="checkbox" style="display:none;" />
						</dt>
						<dd>
							<label for="email_yn"><a href="javascript:openPageLayer('marketing');">마케팅 수신 동의 <small>(선택)</small></a></label>
						</dd>
					</dl>
				</div>
				<p class="notice pointColor marb40"><i class="pointBorder pointColor">!</i> 가입 약관을 확인한 후 동의해 주세요</p>
			</div>

			
			<div class="btn_list" id="mem-button">
				<input type="button" class="moreBtn pointColor pointBorder" onclick="goUndo()" value="이전으로" />
				<input type="submit" class="moreBtn bgColor pointBorder" value="다음으로" />
			</div>
		</form>
		<script type='text/javascript'>
//<![CDATA[
function __setElement(el, v, a) { if(v) v = v.replace(/__&LT__/g, '<').replace(/__&GT__/g, '>'); if(typeof(el) != 'object' && typeof(el) != 'function') return; if(v != null) switch(el.type) { case 'text': case 'hidden': case 'password': case 'file': case 'email': el.value = v; break; case 'textarea': el.value = v; break; case 'checkbox': case 'radio': if(el.value == v) el.checked = true; else el.checked = false; break; case 'select-one': for(var i=0; i<el.options.length; i++) if(el.options[i].value == v) el.options[i].selected = true; break; default: for(var i=0; i<el.length; i++) if(el[i].value == v) el[i].checked = true; el = el[0]; break; } if(typeof(a) == 'object') { if(el.type != 'select-one' && el.length > 1) el = el[0]; for(i in a) el.setAttribute(i, a[i]); } }
if(_f = document.forms['form1']) {
	__setElement(_f['agree_yn1'], null, {hname:'이용약관', required:'Y'});
	__setElement(_f['agree_yn2'], null, {hname:'개인정보 수집 및 이용', required:'Y'});
	__setElement(_f['agree_yn3'], null, {hname:'개인정보 처리위탁', required:'Y'});
	__setElement(_f['email_yn'], null, {hname:'이메일수신'});
	__setElement(_f['sms_yn'], null, {hname:'SMS수신'});
	if(!_f.onsubmit) _f.onsubmit = function() { return validate(this); };
}
//]]>
</script>
	</div>
</div>
</body>
</html>