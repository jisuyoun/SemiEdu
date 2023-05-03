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


<style type="text/css">
	
	.mem_cont .myinfo_cont .comment {width:100%;font-size:14px;padding:5px;}
	.mem_cont .myinfo_cont .comment .good {color: #1758e0;}
	.mem_cont .myinfo_cont .comment .bad {color: #e01717;}
	.check_box {width:100%;}
</style>

<title>회원가입</title>

<script type="text/javascript">
	
	let b_flag_idDuplicate_click = false;
	// "아이디 중복확인" 을 클릭했는지 클릭을 안 했는지 여부를 알아오기 위한 용도.
	
	 let b_flag_emailDuplicate_click = false;
   // "이메일중복확인" 을 클릭했는지 클릭을 안 했는지 여부를 알아오기 위한 용도.

	$(document).ready(function(){
		
		 $("span.error").hide();
		 
		 
		 $("input#userid").blur( (e) => {
			 
			 const regExp = /^[a-zA-Z]{1}[a-zA-Z0-9]{1,19}$/;
			 
			 const bool = regExp.test($(e.target).val());
			
			 if( !bool || $(e.target).val().trim() == "" ) {
				 
				 $("div.mem_cont :input").prop("disabled", true);
				 $(e.target).prop("disabled", false);
				 $(e.target).parent().find("span.error").show();
		         $(e.target).focus();
				 
			 }
			 else {
				 $("div.mem_cont :input").prop("disabled", false);
				 $(e.target).parent().find("span.error").hide();
			 }
			 
		 }); // 아이디가 userid 인 것은 포커스를 잃어버렸을 경우 (blur) 이벤트를 처리해주는 것이다.
		 
		 
		 
		 $("input#pwd").blur( (e) => {
	          
	    	  const regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
	    	  
	    	  const bool = regExp.test($(e.target).val());
	    	  
	    	  if(!bool) {
	    		  // 암호가 정규표현식에 위배 된 경우
	    		  $("div.mem_cont :input").prop("disabled", true);
              $(e.target).prop("disabled", false);
	          $(e.target).parent().find("span.error").show();
	          $(e.target).focus(); 
	    	  }
	    	  else {
	    		  // 암호가 정규표현식에 맞는 경우
	    		  $("div.mem_cont :input").prop("disabled", false);
	          $(e.target).parent().find("span.error").hide();
	    	  }
	          
	       });// 아이디가 pwd 인 것은 포커스를 잃어버렸을 경우 (blur) 이벤트를 처리해주는 것이다.
	       
	       
	       $("input#pwdcheck").blur( (e) => {
	           
	     	  if( $("input#pwd").val() != $(e.target).val() ) {
	     		  // 암호와 암호확인값이 다른 경우
	     		  $("div.mem_cont :input").prop("disabled", true);
	              $(e.target).prop("disabled", false);
	              $("input#pwd").prop("disabled", false);
	             
	           // $(e.target).next().show();
	           // 또는
	           $(e.target).parent().find("span.error").show();
	           $("input#pwd").focus(); 
	     	  }
	     	  else {
	     		// 암호와 암호확인값이 같은 경우
	     		$("div.mem_cont :input").prop("disabled", false);
	            
	            $(e.target).parent().find("span.error").hide();  
	     	  }
	           
	        });// 아이디가 pwdcheck 인 것은 포커스를 잃어버렸을 경우 (blur) 이벤트를 처리해주는 것이다.
	        
	        $("input#name").blur( (e) => {
	            
	            if( $(e.target).val().trim() == "" ) {

	               $("div.mem_cont :input").prop("disabled", true);
	               	 $(e.target).prop("disabled", false);
	                 $(e.target).parent().find("span.error").show();
	                 $(e.target).focus();   
	            }
	            else {
	                $("div.mem_cont :input").prop("disabled", false);
	                $(e.target).parent().find("span.error").hide();
	                
	            }
	            
	         });// 아이디가 name 인 것은 포커스를 잃어버렸을 경우 (blur) 이벤트를 처리해주는 것이다.
	         
	         
	         
			 $("input#email").blur( (e) => {
	        	 
	        	 const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	        	 
	        	 const bool = regExp.test($(e.target).val());
	        	 
	        	 if(!bool) {
	        		 // 이메일이 정규표현식에 위배 된 경우
	        		 $("div.mem_cont :input").prop("disabled", true);
	        		 $(e.target).prop("disabled", false);
	        		 $(e.target).parent().find("span.error").show();
	    	         $(e.target).focus();
	        	 }
	        	 else {
	        		 $("div.mem_cont :input").prop("disabled", false);
		         $(e.target).parent().find("span.error").hide();
	        	 }
	        	 
	         }); // end of $("input#email").blur( (e) -----------------------

	         
	         
	         
	         
	     	$("input#mobile2").blur( (e) => {
	            
	        	  const regExp = /^[1-9][0-9]{2,3}$/g;
	        	  
	        	  const bool = regExp.test($(e.target).val());
	        	  
	        	  if(!bool) {
	        		  // 국번이 정규표현식에 위배 된 경우
	        		  $("div.mem_cont :input").prop("disabled", true);
	                  $(e.target).prop("disabled", false);
	                  
	    	          // $(e.target).next().show();
	    	          // 또는
	    	          $(e.target).parent().find("span.error").show();
	    	          $(e.target).focus(); 
	        	  }
	        	  else {
	        		  // 국번이 정규표현식에 맞는 경우
	        		  $("div.mem_cont :input").prop("disabled", false);
	                  // $(e.target).next().show();
	                   // 또는
	                  $(e.target).parent().find("span.error").hide();
	        	  }
	              
	           });// 아이디가 mobile2 인 것은 포커스를 잃어버렸을 경우 (blur) 이벤트를 처리해주는 것이다.
	            
	            
	        $("input#mobile3").blur( (e) => {
	             
	        	//  const regExp = /^[0-9]{4}$/g;
	        	//  또는	  
	        	  const regExp = /^\d{4}$/g;
	        	  // 숫자 4자리만 들어오도록 하는 정규표현식
	        	  
	        	  const bool = regExp.test($(e.target).val());
	        	  
	        	  if(!bool) {
	        		  // 마지막4자리번호가 정규표현식에 위배 된 경우
	        		  $("div.mem_cont :input").prop("disabled", true);
	              $(e.target).prop("disabled", false);
	    	          $(e.target).parent().find("span.error").show();
	    	          $(e.target).focus(); 
	        	  }
	        	  else {
	        		  // 마지막4자리번호가 정규표현식에 맞는 경우
	        		  $("div.mem_cont :input").prop("disabled", false);
	              $(e.target).parent().find("span.error").hide();
	        	  }
	              
	           });// 아이디가 mobile3 인 것은 포커스를 잃어버렸을 경우 (blur) 이벤트를 처리해주는 것이다.
	           
	           
	           
	       
	        
	  	    		  
	  		// 아이디값이 변경되면 가입하기 버튼을 클릭 시 "아이디중복확인" 을 클릭했는지 클릭안했는지 알아보기 위한 용도를 초기화 시키기
	 	    $("input#userid").bind("change", function(){
	 	    		b_flag_idDuplicate_click = false;
	 	    });	 
	  	      
	 		// 이메일값이 변경되면 가입하기 버튼을 클릭 시 "이메일중복확인" 을 클릭했는지 클릭안했는지 알아보기 위한 용도를 초기화 시키기
	 	    $("input#email").bind("change", function(){
	 	    	b_flag_emailDuplicate_click = false;
	 	    }); 
		 	
	 		
		
	}); // end of $(document).ready(function()--------------------------------------
			
	// "아이디중복확인" 을 클릭했을 때 이벤트 처리하기
    function isExistIdCheck() {
	   
    	 b_flag_idDuplicate_click = true;
    	 // "아이디 중복확인" 을 클릭했는지 클릭을 안 했는지 여부를 알아오기 위한 용도.

    	 $.ajax({
   		 url:"<%= ctxPath%>/member/idDuplicateCheck.go",
   		 data:{"userid":$("input#userid").val()},    // data는 /MyMVC/member/idDuplicateCheck.up 로 전송해야할 데이터를 말한다.
   		 type: "post", // 조심 !!! ajax는 method: get 이나 post를 사용하지 않고 type으로 사용한다.type 을 생략하면 type="get"이다.
   	//	 dataType:"json", // Javascript Standard Object Notation.  dataType은 /MyMVC/member/idDuplicateCheck.up 로 부터 실행되어진 결과물을 받아오는 데이터타입을 말한다. T 대문자!!!!!!
         				  // 만약에 dataType:"xml" 으로 해주면 /MyMVC/member/idDuplicateCheck.up 로 부터 받아오는 결과물은 xml 형식이어야 한다. 
         				  // 만약에 dataType:"json" 으로 해주면 /MyMVC/member/idDuplicateCheck.up 로 부터 받아오는 결과물은 json 형식이어야 한다.
     //   async: true,  // async: true 는 비동기 방식을 말한다. async 을 생략하면 기본값이 비동기 방식인 async: true 이다.
         			   // async: false 는 동기 방식을 말한다. 지도를 할때는 반드시 동기방식인 async: false 를 사용해야만 지도가 올바르게 나온다.
   		 success: function(text){ 
   			 // dataType:"json" 을 생략하면
   			 // 파라미터 json 에 "{"isExists":true}" 또는 "{"isExists":false}" 의 string(문자열)타입의 결과물이 들어오게 된다.
   			 
   			 // dataType:"json" 을 생략하지 않고 넣어주면 
   			 // 파라미터 json 에 {"isExists":true} 또는 {"isExists":false} 인 object(객체)타입의 결과물이 들어오게 된다.
   			 
   			 const json = JSON.parse(text);
   			 // JSON.parse(text); 은 JSON.parse("{"isExists":true}"); 또는 JSON.parse("{"isExists":false}"); 와 같은 것인데
              // 그 결과물은 {"isExists":true} 또는 {"isExists":false} 와 같은 문자열을 자바스크립트 객체로 변환해주는 것이다. 
              // 조심할 것은 text 는 반드시 JSON 형식으로 되어진 문자열이어야 한다. 
   			 
   			 if(json.isExists) {
   			 	// 입력한 useris 가 이미 사용중이라면
   			 	$("span#idcheckResult").html($("input#userid").val()+" 은 중복된 ID 이므로 사용불가합니다.").css("color","red");
   			 	$("input#userid").val("");
   			 }
   			 else if(!json.isExists && $("input#userid").val().trim() != "") { 
   				// 입력한 userid 가 존재하지 않는 경우라면
   				$("span#idcheckResult").html($("input#userid").val()+" 은 사용가능합니다.").css("color","navy"); 
   			 }
   		 },
   		 
   		 error: function(request, status, error){
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
          }
   	 });
    	 
    	 
      } // end of function isExistIdCheck() ----------------   		
			
	// "이메일중복확인" 을 클릭했을 때 이벤트 처리하기	
   	function isExistEmailCheck() {
   		
	   	b_flag_emailDuplicate_click = true;
 	    // "이메일중복확인" 을 클릭했는지 클릭을 안 했는지 여부를 알아오기 위한 용도.
 	    	 
 	    // 입력하고자 하는 이메일이 데이터베이스 테이블에 존재하는지, 존재하지 않는지 알아와야 한다.
   	     /*
           Ajax (Asynchronous JavaScript and XML)란?
           ==> 이름만 보면 알 수 있듯이 '비동기 방식의 자바스크립트와 XML' 로서
               Asynchronous JavaScript + XML 인 것이다.
               한마디로 말하면, Ajax 란? Client 와 Server 간에 XML 데이터를 JavaScript 를 사용하여 비동기 통신으로 주고 받는 기술이다.
               하지만 요즘에는 데이터 전송을 위한 데이터 포맷방법으로 XML 을 사용하기 보다는 JSON(Javascript Standard Object Notation) 을 더 많이 사용한다. 
               참고로 HTML은 데이터 표현을 위한 포맷방법이다.
               그리고, 비동기식이란 어떤 하나의 웹페이지에서 여러가지 서로 다른 다양한 일처리가 개별적으로 발생한다는 뜻으로서, 
               어떤 하나의 웹페이지에서 서버와 통신하는 그 일처리가 발생하는 동안 일처리가 마무리 되기전에 또 다른 작업을 할 수 있다는 의미이다.
       	 */ 
	         $.ajax({
           		 url:"<%= ctxPath%>/member/emailDuplicateCheck.go",
           		 data:{"email":$("input#email").val()},    
           		 type: "post", // 조심 !!! ajax는 method: get 이나 post를 사용하지 않고 type으로 사용한다.type 을 생략하면 type="get"이다.
           		 dataType:"json", 
          //     async: true,  // async: true 는 비동기 방식을 말한다. async 을 생략하면 기본값이 비동기 방식인 async: true 이다.
                 			   // async: false 는 동기 방식을 말한다. 지도를 할때는 반드시 동기방식인 async: false 를 사용해야만 지도가 올바르게 나온다.
           		 success: function(json){ // 파라미터 json 에 {"isExists":true} 또는 {"isExists":false} 이 들어오게 된다.
           			 if(json.isExists) {
           			 	// 입력한 email이 이미 사용중이라면
           			 	$("span#emailCheckResult").html($("input#email").val()+" 은 중복된 email 이므로 사용불가합니다.").css("color","red");
           			 	$("input#email").val("");
           			 }
           			 else if(!json.isExists && $("input#email").val().trim() != ""){ 
           				// 입력한 email 가 존재하지 않는 경우라면
           				$("span#emailCheckResult").html($("input#email").val()+" 은 사용가능합니다.").css("color","navy"); 
           			 }
           		 },
           		 
           		 error: function(request, status, error){
                    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                  }
           	 });              
          		 
           	 
           	 
 	      } // end of function isExistEmailCheck()----------------		
			
	// 가입하기 버튼 클릭시 호출되는 함수 
	function goRegister(){
	   
	   // **** 필수 입력사항에 모두 입력이 되었는지 검사한다. ****//
	   let b_Flag_requiredInfo = false;
	   
	   $("input.requiredInfo").each(function(index, elmt){
		   if($(elmt).val().trim() == "") {
			   alert("*표시된 필수입력사항은 모두 입력하셔야 합니다.");
			   b_Flag_requiredInfo = true;
			   return false; // break; 라는 뜻이다.
		   }
	   });
	   
	   if(b_Flag_requiredInfo) {
		   return; // 함수종료
	   }

	   ///////////////////////////////////////////////////////////////////////////////////
	   
	   // "아이디중복확인" 을 클릭했는지 여부 알아오기
	   if(!b_flag_idDuplicate_click) {
			// "아이디중복확인" 버튼을 클릭 안 했을 경우
			alert("아이디중복확인을 클릭하셔야 합니다.");
			return; // 함수종료
	   } 
	   
	   // "이메일중복확인" 을 클릭했는지 여부 알아오기
	   if(!b_flag_emailDuplicate_click) {
			// "이메일중복확인" 버튼을 클릭 안 했을 경우
			alert("이메일중복확인을 클릭하셔야 합니다.");
			return; // 함수종료
	   } 

	   /////////////////////////////////////////////////////////////////////////
	   
	   const frm = document.registerFrm;
	   frm.action = "memberRegister.go";
	   frm.method = "post";
	   frm.submit();
	   
   } // end of function goRegister()		

</script>

</head>
<body>


<div class="login_cont member_cont">
	<div class="login_in">
		<a href="/SemiProject_3Zoe/">
		<h1><img src="<%= ctxPath%>/ssh.img/logo.png" alt="워너에듀 로고" class="svg_logo"/></h1>
		</a>
		<h3>새로운 계정으로 회원가입 하세요!</h3>

		<div class="process_cont">
			<dl>
				<dt><img src="<%= ctxPath%>/ssh.img/process_01.png" alt="방법선택" /></dt>
				<dd>방법선택</dd>
			</dl>
			<dl>
				<dt><img src="<%= ctxPath%>/ssh.img/process_02.png" alt="약관동의" /></dt>
				<dd>약관동의</dd>
			</dl>
			<dl class="up">
				<dt><img src="<%= ctxPath%>/ssh.img/process_03_up.png" alt="정보입력" /></dt>
				<dd>정보입력</dd>
			</dl>
			<dl>
				<dt><img src="<%= ctxPath%>/ssh.img/process_04.png" alt="가입완료" /></dt>
				<dd>가입완료</dd>
			</dl>
		</div>
	</div>

	<form name="registerFrm">
	
	<div class="mem_cont">
		<h4 class="mem_tit marb40 inline">회원정보 입력 <span class="tx"><span class="pointColor">*</span> 필수 입력 정보입니다.</span></h4>

		<div class="myinfo_cont refund_info">
			
			<dl>
				<dt>아이디 <span class="pointColor">*</span></dt>
				<dd>
					<input name="userid" class="input requiredInfo" id="userid" maxlength="20" type="text"  placeholder="영문 또는 숫자 2~20자리" />
					<!-- 아이디중복체크 -->
             		<span style="display: inline-block; font-family: 'Noto Sans KR', Malgun Gothic,'Malgun Gothic', 'Outfit', sans-serif; width: 100px; height: 22px; border: solid 1px #1bceb8; border-radius: 10px; font-size: 10pt; text-align: center; margin-left: 5px; margin-top: 5px; background-color: #1bceb8; color: white; font:bold; cursor: pointer;" onclick="isExistIdCheck();" >아이디 중복확인</span>
             		<span id="idcheckResult"></span>
					<span class="error" style= "color:red; font-size: 14px;">&nbsp;&nbsp;영문으로 시작하는 2-20자 영문, 숫자 조합을 입력하세요.</span>
				</dd>
			</dl>
			
			<dl>
				<dt>비밀번호 <span class="pointColor">*</span></dt>
				<dd>
					<input name="pwd" class="input requiredInfo" id="pwd" maxlength="50" type="password" placeholder="영문, 숫자, 특수문자 조합 8~15자" />
					<span class="error" style= "color:red; font-size: 14px;">&nbsp;암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
				</dd>
			</dl>

			<dl>
				<dt>비밀번호 재입력 <span class="pointColor">*</span></dt>
				<dd>
					<input name="pwdcheck" class="input requiredInfo" id="pwdcheck" maxlength="50" type="password" placeholder="영문, 숫자, 특수문자 조합 8~15자" />
					<div class="comment" id="checkPasswordArea">
						<span class="error" style= "color:red; font-size: 14px;">&nbsp;암호가 일치하지 않습니다.</span>
					</div>
				</dd>
			</dl>
			
			<dl>
				<dt>이름 <span class="pointColor">*</span></dt>
				<dd>
					<input name="name" class="input requiredInfo" type="text" id="name" maxlength="20" />
					<div class="comment">
						<span class="error" style= "color:red; font-size: 14px;">&nbsp;이름은 필수입력사항입니다.</span>
					</div>
				</dd>
			</dl>
			
			
			<dl>
				<dt>
					이메일 <span class="pointColor">*</span>
				</dt>
				
				<dd>
					<input name="email" id="email" type="text" class="input input_m2 requiredInfo" >
					<span class="error" style= "color:red; font-size: 14px;">&nbsp;이메일 형식에 맞지 않습니다.</span>
					<span style="display: inline-block; font-family: 'Noto Sans KR', Malgun Gothic,'Malgun Gothic', 'Outfit', sans-serif; width: 100px; height: 22px; border: solid 0px #1bceb8; border-radius: 10px; font-size: 10pt; text-align: center; margin-left: 10px; background-color: #1bceb8; color: white; font:bold; cursor: pointer;" onclick="isExistEmailCheck();">이메일 중복확인</span> 
             		<span id="emailCheckResult"></span>	
					<div class="check_box">
						<label><input name="checkEmail" value="1" type="radio" class="radio" >수신동의</label>
						<label><input name="checkEmail" value="0" type="radio" class="radio" >수신거부</label>
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
					<input name="mobile2" class="input input_num requiredInfo" type="text" id="mobile2" maxlength="4">
					<span class="hipen">-</span>
					<input name="mobile3" class="input input_num requiredInfo" type="text" id="mobile3" maxlength="4" onchange=''>
					<span class="error" style= "color:red; font-size: 14px;">&nbsp;휴대폰형식이 아닙니다</span>
					<div class="check_box">
						<label><input name="checkMobile" value="1" type="radio" class="radio" />수신동의</label>
						<label><input name="checkMobile" value="0" type="radio" class="radio" />수신거부</label>
					</div>
				</dd>
			</dl>
			
			<div class="btn_list">
				<input type="button" class="moreBtn pointColor pointBorder" onclick="location.href='javascript:history.go(-1)'" value="이전으로" />
				<input type="button" class="moreBtn bgColor pointBorder" id="btn_submit" onclick="goRegister()" value="회원가입하기" />
			</div>

			
		</div>
	   </div>	
	</form>
</div>
	
 


	
</body>
</html>