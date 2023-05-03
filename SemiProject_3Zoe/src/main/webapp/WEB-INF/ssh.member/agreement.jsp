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
		
		var bool_1 = $("#agree_yn1").is(":checked");
		
		var bool_2 = $("#agree_yn2").is(":checked");
		
		var bool_3 = $("#agree_yn3").is(":checked");
		
		if(bool_1 == false || bool_2 == false || bool_3 == false) {
			
			alert("필수 동의 항목에는 모두 동의하셔야 합니다!");
			return;
			
		}
		else {
			location.href="<%=request.getContextPath()%>/memberRegister.go";
		}
	}
	
	
</script>

</head>
<body>

<link rel="stylesheet" type="text/css" href="../ssh.css/member.css" />

<div class="login_cont">
	<div class="login_in">
		<a href="/SemiProject_3Zoe/">
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
		<form name="agreement" id="agreement" method="POST" target="sysfrm" >
			<h4 class="mem_tit inline">가입 약관 동의<span class="tx">안내를 읽고 동의해 주세요.</span></h4>

			<div class="agree_cont">
				<h4><label style="cursor: pointer"><input name="agree_yn_all" id="allCheckOrNone" onclick="checkAll();" type="checkbox" />전체동의</label></h4>

				<div class="agree_in">
					<dl>
						<dt><input name="agree_yn1" id="agree_yn1" type="checkbox" value="false" class="check" required="required" onclick="checkOne();"></dt>
						<dd>
							<label for="agree_yn1"><a data-toggle="modal" href="#clause">이용약관 동의 <b class="txt_red">(필수)</b></a></label>
						</dd>
					</dl>
					<dl>
						<dt><input name="agree_yn2" id="agree_yn2" type="checkbox" value="false" class="check" required="required" onclick="checkOne();"></dt>
						<dd>
							<label for="agree_yn2"><a data-toggle="modal" href="#policy">개인정보취급 동의 <b class="txt_red">(필수)</b></a></label>
						</dd>
					</dl>
					<dl>
						<dt><input name="agree_yn3" id="agree_yn3" type="checkbox" value="false" class="check" required="required" onclick="checkOne();" ></dt>
						<dd>
							<label for="agree_yn3"><a data-toggle="modal" href="#consignment">개인정보 처리위탁 동의 <b class="txt_red">(필수)</b></a></label>
						</dd>
					</dl>
					<dl>
						<dt>
							<input name="email_yn" id="email_yn" value="false" type="checkbox" class="check" onclick="checkSms(this.checked); checkOne();" />
							<input name="sms_yn" value="Y" type="checkbox" style="display:none;" />
						</dt>
						<dd>
							<label for="email_yn"><a data-toggle="modal" href="#marketing">마케팅 수신 동의 <small>(선택)</small></a></label>
						</dd>
					</dl>
				</div>
				<p class="notice pointColor marb40"><i class="pointBorder pointColor">!</i> 가입 약관을 확인한 후 동의해 주세요</p>
			
			
		 </div>

			
			<div class="btn_list" id="mem-button">
				<input type="button" class="moreBtn pointColor pointBorder" onclick="goUndo()" value="이전으로" />
				<input type="button" class="moreBtn bgColor pointBorder" onclick="checkAgree()" value="다음으로" />
			</div>
		</form>
	</div>
	
	
	
</div>

<!-- Modal -->
	<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
	<div class="modal fade" id="clause">
	  <div class="modal-dialog modal-dialog-scrollable modal-overlay modal-lg">
	  <!-- .modal-dialog-scrollable을 .modal-dialog에 추가하여 페이지 자체가 아닌 모달 내부에서만 스크롤할 수 있습니다. -->
	    <div class="modal-content">
	      
	      <!-- Modal header -->
	      <div class="modal-header">
	        <h5 class="modal-title">이용약관</h5>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body">
	        <h5>제 1 조 (목적)</h5>
               <p>이 약관은 (주)한국라이센스개발원(이하 “원격평생교육원”이라 함)이 제공하는 제반 서비스의 이용에 관한 조건 및 절차에 관한 기본적인 사항과 기타 필요한 사항을 규정함을 목적으로 한다.</p>
            <h5>제 2 조 (정의)</h5>   
              <p>① 이 약관에서 사용하는 용어의 정의는 다음과 같다.
			  <p>1.서비스 : 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 회원이 이용할 수 있는 원격평생교육원에서 제공하는 관련 제반 서비스를 의미한다.</p>
			  <p>2.회 원 : 원격평생교육원의 서비스에 접속하여 이 약관에 따라 원격평생교육원과 이용계약을 체결하고 원격평생교육원이 제공하는 서비스를 이용하는 고객을 말한다.</p>
			  <p>3.아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 원격평생교육원이 승인하는 문자와 숫자의 조합을 의미한다.</p>
			  <p>4.비밀번호 : 회원이 부여 받은 아이디와 일치되는 회원임을 확인하고 비밀보호를 위해 회원 자신이 정한 문자 또는 숫자의 조합을 의미한다.</p>
			  <p>5.콘텐츠 : 원격평생교육원이 웹사이트에서 제공하는 온라인 강좌 및 기타 관련 정보를 의미한다.</p>
			  <p>6.운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 원격평생교육원에서 선정한 사람을 의미한다.</p>
			  <p>7.해 지 : 원격평생교육원 또는 회원이 서비스 개통 이후 이용계약을 종료시키는 의사 표시를 의미한다.</p>
			  <p>② 제1항의 용어를 제외한 용어의 정의는 거래 관행 및 관계 법령에 따른다.</p>
			<h5>제 3 조 (약관의 게시와 개정)</h5>
               <p>①원격평생교육원은 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시한다.</p>
               <p>②원격평생교육원은 ‘약관의 규제에 관한 법률’, ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하 “정보통신망법”이라 함)’ 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있다.</p>
               <p>③원격평생교육원이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지한다. 단 회원의 권리, 의무에 중대한 영향을 주는 변경이 아닌 경우에는 적용일자 7일 전부터 공지하도록 한다.</p>
               <p>④제3항에 따라 시행일 이후에 회원이 서비스를 이용하는 경우에는 개정약관에 동의한 것으로 간주한다. 회원은 변경된 약관에 동의하지 않을 경우 이용계약을 해지할 수 있다.</p>
               <p>⑤유료서비스를 이용하는 회원이 이 약관의 개정에 대해 동의하지 않아 이용계약을 해지할 경우에는 유료서비스약관이 정한 환불정책에 따른다.</p>
	      </div>
      
	    </div>
	  </div>
	</div>
	
	
	
	<!-- Modal -->
	<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
	<div class="modal fade" id="policy">
	  <div class="modal-dialog modal-dialog-scrollable modal-overlay modal-lg">
	  <!-- .modal-dialog-scrollable을 .modal-dialog에 추가하여 페이지 자체가 아닌 모달 내부에서만 스크롤할 수 있습니다. -->
	    <div class="modal-content">
	      
	      <!-- Modal header -->
	      <div class="modal-header">
	        <h5 class="modal-title">개인정보 수집 및 이용</h5>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body">   
               <p>1. 항목 : 이름, 아이디, 비밀번호, 이메일, 생년월일, 성별, 휴대전화번호, 주소</p>
               <p>2. 목적 : 홈페이지 회원 가입 및 서비스 이용·관리</p>
               <p>3. 보유기간 : 회원탈퇴 후 5일까지</p>
               <p>4. 휴대폰번호는 나이스평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.</p>
	      </div>

	    </div>
	  </div>
	</div>
	
	
	<!-- Modal -->
	<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
	<div class="modal fade" id="consignment">
	  <div class="modal-dialog modal-dialog-scrollable modal-overlay modal-lg">
	  <!-- .modal-dialog-scrollable을 .modal-dialog에 추가하여 페이지 자체가 아닌 모달 내부에서만 스크롤할 수 있습니다. -->
	    <div class="modal-content">
	      
	      <!-- Modal header -->
	      <div class="modal-header">
	        <h5 class="modal-title">개인정보 처리위탁 동의</h5>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body">   
               <p>회사는 시스템 안정성과 서비스 향상을 위하여 아래와 같이 개인정보를 위탁하고 있습니다.</p>
               <p>1. 수탁자 : (주)맑은소프트</p>
               <p>2. 업무내용 : 교육관리시스템(LMS) 관리 및 유지보수</p>
	      </div>

	    </div>
	  </div>
	</div>
	
	
	
	<!-- Modal -->
	<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
	<div class="modal fade" id="marketing">
	  <div class="modal-dialog modal-dialog-scrollable modal-overlay modal-lg">
	  <!-- .modal-dialog-scrollable을 .modal-dialog에 추가하여 페이지 자체가 아닌 모달 내부에서만 스크롤할 수 있습니다. -->
	    <div class="modal-content">
	      
	      <!-- Modal header -->
	      <div class="modal-header">
	        <h5 class="modal-title">개인정보 처리위탁 동의</h5>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body">   
               <h6>마케팅 수신동의</h6>
               <p>1. 수집항목: 이메일, SMS</p>
               <p>2. 이용목적: 상품소개 및 이벤트 정보 등의 안내</p>
               <p>3. 보유기간: 별도 동의 철회 시 까지</p>
	      </div>

	    </div>
	  </div>
	</div>		

</body>
</html>