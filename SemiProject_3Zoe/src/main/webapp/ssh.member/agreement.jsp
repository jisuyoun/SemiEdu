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

<link rel="stylesheet" type="text/css" href="../ssh.css2/common.css" />
<link rel="stylesheet" type="text/css" href="../ssh.css/member.css" />
<link rel="stylesheet" type="text/css" href="../ssh.css2/font_notoSans.css" />
<link rel="stylesheet" type="text/css" href="../ssh.css2/green_theme.css" />



<title>약관 동의</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" >

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<script type="text/javascript"> 
	$(document).ready(function(){		
		
		$("#mem-join").hide();
		
		// 약관 동의의 모든 체크박스가 체크가 되었다가 그 중 하나만 이라도 체크를 해제하면 전체선택 체크박스에도 체크를 해제하도록 한다.
		 $(".check").click(function(){
	         
	         var bFlag = false;
	         $(".check").each(function(){
	            var bChecked = $(this).prop("checked");
	            if(!bChecked) {
	               $("#allCheckOrNone").prop("checked",false);
	               bFlag = true;
	               return false;
	            }
	         });
	         
	         if(!bFlag) {
	            $("#allCheckOrNone").prop("checked",true);
	         }
	         
	      });
		
	}); // end of $(document).ready(function()------------------------
			
	function goNormalJoin() {
		
		$("#mem-agree").hide();
		$("#mem-join").show();
		
		$("#agree-1 img").attr('src',function(i,e){
			return $(this).attr('src').replace("process_01_up.png", "process_01.png")
		}); 
		$("#agree-2 img").attr('src',function(i,e){
			return $(this).attr('src').replace("process_02.png", "process_02_up.png")
		});

	}		
	
	function goUndo() {
		$("#mem-agree").show();
		$("#mem-join").hide();
	}
			
	function checkAll() {
		
		var bool = $("#allCheckOrNone").is(":checked");
		
		
		$(".check").prop("checked", bool);
	}
	
	function checkAgree() {
		
		if($("#agree_yn1").is("checked") == false || $("#agree_yn2").is("checked") == false || $("#agree_yn3").is("checked") == false) {
			
			alert("필수 동의 항목에는 모두 동의하셔야 합니다!");
			
		}
		else {
			
		}
	}
	
	
</script>

</head>
<body>

<link rel="stylesheet" type="text/css" href="../ssh.css/member.css" />

<div class="login_cont">
	<div class="login_in">
		<a href="/WEB-INF/index.jsp">
		<h1><img src="../ssh.img/logo.png" alt="워너에듀 로고" class="svg_logo"/></h1>
		</a>
		<h3>새로운 계정으로 회원가입 하세요!</h3>

		<div class="process_cont">
			<dl class="up">
				<dt id="agree-1"><img src="../ssh.img/process_01_up.png" alt="방법선택" /></dt>
				<dd>방법선택</dd>
			</dl>
			<dl>
				<dt id="agree-2"><img src="../ssh.img/process_02.png" alt="약관동의" /></dt>
				<dd>약관동의</dd>
			</dl>
			<dl>
				<dt><img src="../ssh.img/process_03.png" alt="정보입력" /></dt>
				<dd>정보입력</dd>
			</dl>
			<dl>
				<dt><img src="../ssh.img/process_04.png" alt="가입완료" /></dt>
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
		<form name="agreement" id="agreement" method="POST" target="sysfrm" onsubmit="return goSubmit(this);">
			<h4 class="mem_tit inline">가입 약관 동의<span class="tx">안내를 읽고 동의해 주세요.</span></h4>

			<div class="agree_cont">
				<h4><label style="cursor: pointer"><input name="agree_yn_all" id="allCheckOrNone" onclick="checkAll();" type="checkbox" />전체동의</label></h4>

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
				<input type="submit" class="moreBtn bgColor pointBorder" onclick="checkAgree()" value="다음으로" />
			</div>
		</form>
	</div>
</div>
</body>
</html>