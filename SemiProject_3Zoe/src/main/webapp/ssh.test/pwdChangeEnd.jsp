<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
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
	
	div#div_updateResult {
		font-size: 17pt;
	}
	
	div#logoimg {
		text-align: center;
	}
	
</style>

<title>비밀번호 변경</title>

<script type="text/javascript">
	

	$(document).ready(function(){
		
		
		});
	

		
	}); // end of $(document).ready(function()--------------------------------------
			


</script>

</head>
<body>


<div class="login_cont member_cont">
	

	<form name="pwdUpdateEndFrm">

	<div id="logoimg"><img src="<%= ctxPath%>/ssh.img/logo.png" alt="워너에듀 로고" class="svg_logo"/></div>
	<div class="mem_cont">
		
		<h4 class="mem_tit marb40 inline" style="text-align: center; font-size: 20pt;">비밀번호 변경 완료<span class="tx"></h4>
		
		
		
		<div class="myinfo_cont refund_info">
			
		 <div id="div_updateResult" align="center">
		        사용자 ID ${requestScope.userid}님의 암호가 새로이 변경되었습니다.<br>로그인을 다시하여 주십시오 <br><br>
			<input type="button" align="center" style="background-color:#1bceb8; color:white; border-radius:30px; width:155px; border:none; padding:10px;" class="bgColor pointBorder" id="btn_submit" onclick="location.href='<%=request.getContextPath()%>/login/login.go'" value="로그인 이동" />        
		</div>
		
		</div>
	   </div>	
	</form>
	
	
	    
</div>
	
 


	
</body>
</html>