<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String ctxPath = request.getContextPath();
//    /MyMVC
%>

<jsp:include page="../header.jsp" />

<%-- 직접만든 css --%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/cosRegisterStyle.css" />

<script type="text/javascript">

	$(document).ready(function(){
		
		let flag = false;
		
		let checkboxFlag = false;
		
		/* 이미지 누르면 리스트 뜨기 시작 */
		$("div#CRButton_one").click(function(){
			
			$("input#CRInput_Text").val("1");
			
			$("div.CRSildeMenu").show();
			$("div#CRDeleteAll").show();
			
			$("span#CRCosIntroduceOne").html("정보처리기사란?");
			$("span#CRCosIntroduceTwo").html("컴퓨터를 효과적으로 활용하기 위해 프로그램을 개발하는 업무를 수행한다.");
			$("span#CRCosIndroduceThree").html("당장 시작해야하는 이유!!");
			$("span#CRCosIntroduceFour").html("채용 지원시 가산점 부여!");
			$("span#CRCosIntroduceFive").html("비전공자도 IT 취업이 가능한 필수 자격증!");
			$("span#CRCosIntroduceSix").html("고용노동부에서 공개한 구인 공고 기사 분야 1순위 자격증!");
			
			$("div.dropdown").css("display", "").css("both","clear");
			$("div.CRSearchBox").show();
			
			$("img#CRChangeImgOne").show();
			$("img#CRChangeImgTwo").hide();
			$("img#CRChangeImgThree").hide();
			$("img#CRChangeImgFour").hide();

			/* $("button#CRDeleteButton").addClass("CRButtonPosition"); */
			
			$("button#CRDeleteButton").show();
			
			window.scrollTo({top:1000, behavior:'smooth'});	
			
		});
		
		
		
	
		$("div#CRButton_two").click(function(){
			
			$("input#CRInput_Text").val("2");
			
			$("div#CRDeleteAll").show();
			
			$("div.CRSildeMenu").show();
			
			$("span#CRCosIntroduceOne").html("빅데이터분석기사란?");
			$("span#CRCosIntroduceTwo").html("빅데이터 이해를 기반으로 빅데이터 분석 기획, 빅데이터 수집, 저장, 처리, 빅데이터 분석 및 시각화를 수행한다.");
			$("span#CRCosIndroduceThree").html("당장 시작해야하는 이유!!");
			$("span#CRCosIntroduceFour").html("국내 빅데이터산업 시장 지속적 성장!");
			$("span#CRCosIntroduceFive").html("빅데이터 분석전문가 분야 수요 증가!");
			$("span#CRCosIntroduceSix").html("전공 상관 없이, 대학 졸업자면 모두 응시 가능!");
			
			$("div.dropdown").show();
			$("div.CRSearchBox").show(); 
			
			$("img#CRChangeImgOne").hide();
			$("img#CRChangeImgTwo").show();
			$("img#CRChangeImgThree").hide();
			$("img#CRChangeImgFour").hide();
			
			$("button#CRDeleteButton").show();
			
			window.scrollTo({top:800, behavior:'smooth'});

		});
		
		
		
		
		$("div#CRButton_three").click(function(){
		
			$("input#CRInput_Text").val("3");
			
			$("div#CRDeleteAll").show();
			
			$("div.CRSildeMenu").show();
			
			$("span#CRCosIntroduceOne").html("전자계산기조직응용기사란?");
			$("span#CRCosIntroduceTwo").html("크기와 성능이 각기 다른 컴퓨터를 업무의 양과 성격에 알맞게 설치하고 효과적으로 운영, 관리를 수행한다.");
			$("span#CRCosIndroduceThree").html("당장 시작해야하는 이유!!");
			$("span#CRCosIntroduceFour").html("비전공자도 도전이 가능한 자격증!");
			$("span#CRCosIntroduceFive").html("산업화, 정보화, 국제화 사회에서 처리해야 하는 정보의 양 급증으로 인한 대규모 전산망 증가!");
			$("span#CRCosIntroduceSix").html("그에 따른 인력 수요 증가!");
			 
			$("div.dropdown").show();
			$("div.CRSearchBox").show();
			
			$("img#CRChangeImgOne").hide();
			$("img#CRChangeImgTwo").hide();
			$("img#CRChangeImgThree").show();
			$("img#CRChangeImgFour").hide();

			$("button#CRDeleteButton").show();
			
			window.scrollTo({top:800, behavior:'smooth'});
			
		});
		
		
		
		
		$("div#CRButton_four").click(function(){
		
			$("input#CRInput_Text").val("4");
			
			$("div#CRDeleteAll").show();
			
			$("div.CRSildeMenu").show();
			
			$("span#CRCosIntroduceOne").html("패키지");
			$("span#CRCosIntroduceTwo").html("여러 강의를 수강하실 분들을 위해 준비했습니다!");
			$("span#CRCosIndroduceThree").html("혜택");
			$("span#CRCosIntroduceFour").html("기본수강기간 1년!");
			$("span#CRCosIntroduceFive").html("패키지 강의 중 하나라도 불합격 인증 시 6개월 연장 혜택!");
			$("span#CRCosIntroduceSix").html("    ");
			
			$("div.dropdown").show();
			$("div.CRSearchBox").show(); 
			
			$("img#CRChangeImgOne").hide();
			$("img#CRChangeImgTwo").hide();
			$("img#CRChangeImgThree").hide();
			$("img#CRChangeImgFour").show();

			$("button#CRDeleteButton").show();
			
			window.scrollTo({top:800, behavior:'smooth'});
		});
		/* 이미지 누르면 리스트 뜨기 끝 */
			
		
		
		/* 리스트 불러오기 시작 */
		$("div#CRAllImg").click(function(){
			// alert("확인용 값들어옴!!");
			$.ajax({
				url:"<%= request.getContextPath()%>/cos/yjs_CosDisplayJSON.go",
				data:{
					"ClickData":$("input#CRInput_Text").val()
				},   
				dataType:"json", /* dataType 을 생략하면 string 타입으로 들어온다. */
				/* async:false, */
				success:function(json){
				
					let html = "";
					
					if (json.length > 0) {
						
						$.each(json, function(index, item){
							if(index == 0) {
								html = "<div class='CRCosList  col-lg-12'>"
							}
							else {
								html = "<div class='CRCosList_1  col-lg-12'>"
							}
							html += "	<ul>"
								  +	"		<li><input type='checkbox' class='CRDeleteCheckBox' name='CRDeleteCheckBox' value='" + item.courseCode + "' />"
								  + "			<a href ='<%= ctxPath%>/yjs.cos/yjs_OrderPage.go?courseCode="+ item.courseCode +"'><img src='<%= ctxPath%>/yjs.images/"+item.img1+"' class='CRSellImg' /></a>" 
						 	  	  + "			<a data-toggle='tooltip' title='찜!'><label for='CRheartCheck" + index + "'><i id='heart' class='fa-regular fa-heart' style='color: #cccccc;'></i>"
						  	 	  + "			<input type='checkbox' id='CRheartCheck" + index + "' name='CRHeartCheckName' value='" + item.courseCode + "' style='display:none;' /></label></a>"
								  + "       </li>"
								  + "	</ul>"	
								  + "	<div class='CRListMainPosition col-lg-4'>"
								  + "		<ul>"
								  + "			<li>"
								  + "				<a href ='<%= ctxPath%>/yjs.cos/yjs_OrderPage.go?courseCode="+ item.courseCode +"'><h4 class='CRCosTitleName' style='color:black'>"+item.courseName+"</h4></a>"
								  + "				<h5 class='CRCosTeacher'>강사명 <a style='margin-left: 10px;'>" + item.teacher + "</a></h5>"
								  + "				<div class='CRDate'>"
								  + "				기간 <a style='margin-left: 28px;'>"+item.courseterm+"일</a>"
								  + "				</div>"
								  + "			</li>"
								  + "		</ul>"
								  + "	</div>"
								  + "	<div class='CRLastListPostion col-lg-2'>"
								  + "		<ul>"
								  + "			<li>"
								  + "				<div class='CRCosPrice'>"+item.price+"</div>"
								  + "				<div class='CRCosSalePrice'>"+item.salePrice+"</div>";
								  + "			</li>"
								  + "		</ul>"
								  + "	</div>";
								  
							html += "	<div class='CRButton'>"
							  	 + " 		<input type='hidden' id='courseCode' /> "
							  	 + "		<button type='button' class='CRButtonGoBag'  value='" + item.courseCode + "' >"
							  	 + "			<i class='fa-solid fa-pen' style='color: #ffffff; margin-right=10px;'></i>장바구니"
							  	 + "		</button>"
							  	 + "		<button type='button' class='CRButtonGoApplication' value='" + item.courseCode + "'>"
							  	 + "			<i class='fa-solid fa-cart-shopping' style='color: #1bceb8; margin-right=10px;'></i>수강신청"
							  	 + "		</button>"
							  	 + "	</div>"
							  	 + "</div>";
							
						
							$("div.CRSildeMenu").append(html);
								  
						}); // end of $.each(json, functioin(index, item){} -------------------------------

					} // end of if ------------------------------------------------------------------------
					else if(json.length == 0) {
						alert("강의 준비중입니다.");
						
						$("div.CRCosList").hide();
						$("div.CRCosList_1").hide();
						$("button#CRDeleteButton").hide();
						$("div.dropdown").hide();
						$("div.CRSearchBox").hide(); 
						
						return; 
					} // end of else if --------------------------------------------------------------------
					
				},
				error: function(request, status, error){
		 			alert("강의를 불러올 수 없습니다. 관리자에게 문의해주세요.");
		        }
			}) // end of ajax
		});
		/* 리스트 불러오기 끝 */
			
			
			
		/* 이미지 다시 누르면 처음으로 돌아가기 시작 */
		$("img#CRChangeImgOne").click(function(){
		
			$("div.CRCosList").hide();
			$("div.CRCosList_1").hide();
			
			$("div.dropdown").hide();
			$("div.CRSearchBox").hide(); 
	
			$(this).hide();
			
			$("button#CRDeleteButton").hide();
			
			window.scrollTo({top:0, behavior:'smooth'});
		});
		
		$("img#CRChangeImgTwo").click(function(){
			
			$("div.CRCosList").hide();
			$("div.CRCosList_1").hide();
			
			$("div.dropdown").hide();
			$("div.CRSearchBox").hide(); 

			$(this).hide();
			
			$("button#CRDeleteButton").hide();
			
			window.scrollTo({top:0, behavior:'smooth'});

		});
		
		$("img#CRChangeImgThree").click(function(){
			
			$("div.CRCosList").hide();
			$("div.CRCosList_1").hide();
			
			$("div.dropdown").hide();
			$("div.CRSearchBox").hide(); 

			$(this).hide();

			$("button#CRDeleteButton").hide();
			
			window.scrollTo({top:0, behavior:'smooth'});
			
		});
		

		$("img#CRChangeImgFour").click(function(){
			
			$("div.CRCosList").hide();
			$("div.CRCosList_1").hide();
			
			$("div.dropdown").hide();
			$("div.CRSearchBox").hide(); 
			
			$(this).hide();
			
			$("button#CRDeleteButton").hide();
			
			window.scrollTo({top:0, behavior:'smooth'});

		});
		/* 이미지 다시 누르면 처음으로 돌아가기 끝 */
		
		
		
		
		/* 찜 했나 알아오기 시작 */
			<%-- $.ajax({
				url:"<%= request.getContextPath()%>/cos/yjs_CosSelectLikeJSON.go",
				type:"POST",
				data:{
					"userid":"${sessionScope.loginuser.userid}"
				},
				dataType:"json",
				success:function(json){
					alert(json.courseCode);
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});   --%>
			/* 찜 했나 알아오기 끝 */
			
			
			
		
		
		
		/* 찜 시작 */
		$(document).on("change", 'input[name="CRHeartCheckName"]', function(){
		
			if(!checkboxFlag) {
				
				//alert("찜목록 추가");
				
				var checkedHeart = "";
				
				$("input[type=checkbox][name=CRHeartCheckName]:checked").each(function(){
					checkedHeart = $(this).val();
				});
				
				$.ajax({
					url:"<%= request.getContextPath()%>/cos/yjs_CosLikeJSON.go",
					type:"POST",
					data:{"checkedHeart":checkedHeart,
						  "userid":"${sessionScope.loginuser.userid}"},
					dataType:"json",
					success:function(json){
						if(json.n == 1) {
							alert("찜 완료");
							$("i#heart").removeClass("fa-regular fa-heart");
							$("i#heart").addClass("fa-solid fa-heart").css("color", "#ff0000");
							checkboxFlag=true;
						}
						else {
							alert("로그인을 해주세요");
							return;
						}
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});  
			}
			else if(checkboxFlag) {
				
				let discheckedHeartArr = [];
				
				$("input[type=checkbox][name=CRHeartCheckName]:change").each(function(){
					var discheckedHeart = $(this).val();
					discheckedHeartArr.push(discheckedHeart);
				});
				
				var discheckedHeartJoin = discheckedHeartArr.join();
				
				
				$.ajax({
					url:"<%= request.getContextPath()%>/cos/yjs_CosDislikeJSON.go",
					type:"POST",
					data:{"discheckedHeart":discheckedHeartJoin,
						  "userid":"${sessionScope.loginuser.userid}"},
					dataType:"json",
					success:function(json){
						alert("찜 취소");
						$("i#heart").removeClass("fa-solid fa-heart");
						$("i#heart").addClass("fa-regular fa-heart").css("color", "#cccccc"); 
						checkboxFlag=false;
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});  
				
				checkboxFlag = false;
			}
		});
		/* 찜 끝 */
		
		/* 찜 토글 시작 */
		/* $(document).on("click", "#heart", function(){
			if(!flag) {
				$(this).removeClass("fa-regular fa-heart");
				$(this).addClass("fa-solid fa-heart").css("color", "#ff0000");
				
				
				flag = true;
			
				
				
				// alert($("input[type=checkbox][name=CRHeartCheck]:checked").val());
			}	
			
			else {
				$(this).removeClass("fa-solid fa-heart");
				$(this).addClass("fa-regular fa-heart").css("color", "#cccccc"); 
				flag = false;
				
				
			}
			
			
		}); */
		
		
		
		$(document.body).tooltip({
			selector: "[data-toggle='tooltip']"
		});
		/* 찜 토글 끝 */		
	
			
		
		/* 글삭제하기 누르면 체크박스 시작 */
		$(".CRDeleteCheckBox").hide();
		$(".CRButtonPosition").hide();
		
		let deleteFlag = true;
		
		let checked_Arr = [];
		
		$("button#CRDeleteButton").click(function(){
			if (deleteFlag) {
				// 강의삭제하기 버튼을 한 번 누른 경우
				$(".CRDeleteCheckBox").show();
				$("#CRHideButton").show();
				
				deleteFlag = false;
			}
			
			
			/* 글삭제하기 시작 */
			else {
				// 강의삭제하기 버튼을 한 번 누른 후 또 누른 경우
				
				$("input[type=checkbox][name=CRDeleteCheckBox]:checked").each(function(){
					var checked = $(this).val();
					checked_Arr.push(checked);
				});
				
				if(checked_Arr.length == 0){
					alert("삭제할 강의를 선택해주세요.\n\n삭제를 원하지 않을 경우 되돌아가기 버튼을 눌러주시기 바랍니다.");
					return;
				}
				
				const checkedJoin = checked_Arr.join();
				
				// 체크한 체크박스들의 value 를 배열 Checked_Arr 에 넣어주고, join 을 이용하여 합쳐준다.
				if(confirm("정말로 삭제하시겠습니까?")){
					$.ajax({
						url:"<%= request.getContextPath()%>/cos/yjs_CosDeleteJSON.go",
						type:"POST",
						data:{"checkedJoin":checkedJoin},
						dataType:"json",
						success:function(json){
							alert("삭제가 완료되었습니다.");
							javascript:history.go(0);
						},
						error: function(request, status, error){
							alert("글 삭제하는데 문제가 생겼습니다. 담당자에게 문의하세요.");
						}
					}); 
				} // end of if(삭제?)
				
			}
		});
		/* 글삭제하기 누르면 체크박스 끝 */
		
		
		
		
		/* 되돌아가기 버튼 시작 */
		$("button#CRHideButton").click(function(){
			$("#CRDeleteButton").hide();
			$(this).hide();
			
			$("div.dropdown").hide();
			$("div.CRSearchBox").hide(); 
			
			$("span#CRCosIntroduceOne").html("");
			$("span#CRCosIntroduceTwo").html("");
			$("span#CRCosIndroduceThree").html("");
			$("span#CRCosIntroduceFour").html("");
			$("span#CRCosIntroduceFive").html("");
			$("span#CRCosIntroduceSix").html("");

			window.scrollTo({top:0, behavior:'smooth'});
			
			deleteFlag = true;
		});
		/* 되돌아가기 버튼 끝 */
		
		
		
		/* 되돌아가기 버튼 시작 */
		$("button#CRHideButton").click(function(){
			$(".CRChangeImg").hide();
			$(".CRDeleteCheckBox").hide();
			$(this).hide();
			deleteFlag = true;
		});
		/* 되돌아가기 버튼 시작 */
		
		/* 장바구니 시작 */
		$(document).on("click", ".CRButtonGoBag", function(){
			
			if("${sessionScope.loginuser.userid}" != ""){
			
				var form = document.createElement("form"); //태그 만들기 createElement
	
		        form.setAttribute("method", "post");  //태그 method속성 주기 => Post 방식
	
		        form.setAttribute("action", "<%= ctxPath%>/yjs.cos/yjs_ShoppingBagPage.go"); //태그 action속성 주기 => 요청 보낼 주소
	
		       
		        var hidden1 = document.createElement("input"); //인풋태그 생성
	
		        hidden1.setAttribute("type", "hidden"); //태그 type속성 주기
	
		        hidden1.setAttribute("name", "courseCode"); //태그 name속성 주기
	
		        hidden1.setAttribute("value", $(this).val()); //태그 value속성 주기
	
		        form.appendChild(hidden1); //form 변수(그러니까 form태그)의 자식(child)으로 hidden1을 붙여준다
				 
		         
		        var hidden2 = document.createElement("input"); 
	
		        hidden2.setAttribute("type", "hidden");
	
		        hidden2.setAttribute("name", "userid");
	
		        hidden2.setAttribute("value", "${sessionScope.loginuser.userid}");
	
		        form.appendChild(hidden2);
		       
		         
				document.body.appendChild(form); //body태그의 자식으로 form 태그 붙여주기
	
		        form.submit(); //submit함수로 form전송
				
		        
		        
			}
			else {
				alert("로그인이 필요한 서비스 입니다!");
			} 
			
		});
		/* 장바구니 끝 */
		
		
		/* 결제하기 시작 */
		$(document).on("click", ".CRButtonGoApplication", function(){
			
			if("${sessionScope.loginuser.userid}" != ""){
			
				var form = document.createElement("formPay"); //태그 만들기 createElement
	
		        form.setAttribute("method", "post");  //태그 method속성 주기 => Post 방식
	
		        form.setAttribute("action", "<%= ctxPath%>/hyh.order/payment.go"); //태그 action속성 주기 => 요청 보낼 주소
	
		       
		        var hidden1 = document.createElement("input"); //인풋태그 생성
	
		        hidden1.setAttribute("type", "hidden"); //태그 type속성 주기
	
		        hidden1.setAttribute("name", "courseCode"); //태그 name속성 주기
	
		        hidden1.setAttribute("value", $(this).val()); //태그 value속성 주기
	
		        form.appendChild(hidden1); //form 변수(그러니까 form태그)의 자식(child)으로 hidden1을 붙여준다
				 
		         
		        var hidden2 = document.createElement("input"); 
	
		        hidden2.setAttribute("type", "hidden");
	
		        hidden2.setAttribute("name", "userid");
	
		        hidden2.setAttribute("value", "${sessionScope.loginuser.userid}");
	
		        form.appendChild(hidden2);
		       
		         
				document.body.appendChild(formPay); //body태그의 자식으로 form 태그 붙여주기
	
		        form.submit(); //submit함수로 form전송
				
		        
		        
			}
			else {
				alert("로그인이 필요한 서비스 입니다!");
			} 
			
		});
		/* 결제하기 끝 */
		
		
		/* 강의 등록하기 시작 */
		$("button#CRWritingButton").click(function(){
			location.href="<%= ctxPath%>/pes.admin/productRegister.go"
		});
		/* 강의 등록하기 끝 */
		
	}); // end of $(document).ready(function(){}) -------------------------

	// function declaration
		
	/* 체크박스 전체선택 또는 전체 해제 시작 */ 
	function AllCheck(bool) {
		
		const checkboxList = document.getElementsByName("CRDeleteCheckBox");
		
		for(let checkbox of checkboxList) {
			
			checkbox.checked = bool;
			
		} // end of for ------------------------------------------
		
	}
	/* 체크박스 전체선택 또는 전체 해제 끝 */ 

	
	
</script>

<%-- 최상단메뉴바 시작 --%>
<h1 id="CRMainName">수강신청</h1>
<div id="CRMainMenu">
	<i class="fa-solid fa-house" style="color: #ffffff; font-size: 15pt;"></i>
	<a id="CRLine" style="font-size: 15pt;">|</a>

	<button class="btn btn-secondary dropdown-toggle" type="button"
		id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
		aria-expanded="false">수강신청</button>
	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		<a class="dropdown-item" href="#" style="color: #00b377;">수강신청</a> <a
			class="dropdown-item" href="#">고객센터</a>
	</div>
</div>
<%-- 최상단메뉴바 끝 --%>



<%-- !!!!!! 관리자아이디로 글쓰기 버튼과 삭제하기 버튼이 보인다. --%>
<%-- 글쓰기 버튼 시작 --%>
<c:if test="${sessionScope.loginuser.userid == 'testadmin'}">
	<div id="CRButtonPosition">
		<button id="CRWritingButton">강의등록하기</button>
	</div>
	<div id="CRButtonShowPosition">
		<button id="CRHideButton" class="CRButtonPosition">되돌아가기</button>
		<button id="CRDeleteButton" class="CRButtonPosition">강의삭제하기</button>
	</div>
</c:if>
<%-- 글쓰기 버튼 시작 --%>




<%-- 강의선택 아이콘 시작 --%>
<c:if test="${sessionScope.loginuser.userid != 'testadmin'}">
	<h1 class="CRMainTitle">수강하고자 하는 강의를 선택하세요</h1>
</c:if>
<c:if test="${sessionScope.loginuser.userid == 'testadmin'}">
	<h1 class="CRMainTitle">삭제하고자 하는 강의를 선택하세요</h1>
</c:if>


<%-- 선택한 이미지를 servlet 으로 보내기 위한 input 시작 --%>
<input type="hidden" id="CRInput_Text" name="CRInput_Text" />
<%-- 선택한 이미지를 servlet 으로 보내기 위한 input 끝 --%>

<div id="CRAllImg">

	<div class="flip-box" style="margin: 0 0;">
		<div class="flip-box-inner">
			<div class="flip-box-front">
				<img class="CRButton-div" src="<%= request.getContextPath()%>/yjs.images/Program icon.png" />
			</div>
			<div class="flip-box-back" id="CRButton_one" value="1">
				<h3 class="CRh3">정보처리기사</h3>
			</div>
		</div>
	</div>


	<div class="flip-box">
		<div class="flip-box-inner">
			<div class="flip-box-front">
				<img class="CRButton-div" src="<%= request.getContextPath()%>/yjs.images/monitor.png" />
			</div>
			<div class="flip-box-back" id="CRButton_two">
				<h3 class="CRh3">데이터관련</h3>
			</div>
		</div>
	</div>

	<div class="flip-box">
		<div class="flip-box-inner">
			<div class="flip-box-front">
				<img class="CRButton-div" src="<%= request.getContextPath()%>/yjs.images/circuit.png" />
			</div>
			<div class="flip-box-back" id="CRButton_three">
				<h3 class="CRh3">전자계산기</h3>
			</div>
		</div>
	</div>

	<div class="flip-box" style="margin: 0 0;">
		<div class="flip-box-inner">
			<div class="flip-box-front">
				<img class="CRButton-div" src="<%= request.getContextPath()%>/yjs.images/Exam study icon.png" />
			</div>
			<div class="flip-box-back" id="CRButton_four">
				<h3 class="CRh3">패키지</h3>
			</div>
		</div>
	</div>
</div>
<%-- 강의선택 아이콘 끝 --%>




<div id="CRContentContainerMar">
	<%-- 나타나는 강의 아이콘 및 강의 소개 시작 --%>
	<div id=CRAllContent class="col-lg-12">
		<div class="col-lg-6" style="float: left; clear: both;">
			<img class="CRChangeImg" id="CRChangeImgOne" src="<%= request.getContextPath()%>/yjs.images/Program icon.png" /> 
			<img class="CRChangeImg" id="CRChangeImgTwo" src="<%= request.getContextPath()%>/yjs.images/monitor.png" /> 
			<img class="CRChangeImg" id="CRChangeImgThree" src="<%= request.getContextPath()%>/yjs.images/circuit.png" /> 
			<img class="CRChangeImg" id="CRChangeImgFour" src="<%= request.getContextPath()%>/yjs.images/Exam study icon.png" />
		</div>
		<div class="col-lg-6" style="float: left; clear: both;">
			<span class="CRCosIntroduce" id="CRCosIntroduceOne" style="font-weight: bold; font-size: 20pt;"></span> 
			<span class="CRCosIntroduce" id="CRCosIntroduceTwo" style="margin-bottom: 30pt;"></span> 
			<span class="CRCosIntroduce" id="CRCosIndroduceThree" style="font-weight: bold; font-size: 20pt;"></span>
			<span class="CRCosIntroduce" id="CRCosIntroduceFour"></span> 
			<span class="CRCosIntroduce" id="CRCosIntroduceFive"></span> 
			<span class="CRCosIntroduce" id="CRCosIntroduceSix"></span>
		</div>
	</div>
	<%-- 나타나는 강의 아이콘 및 강의 소개 끝 --%>




	<%-- 정렬 시작 --%>
	<div id="dropdown" class="dropdown" style="display: none; clear: both;">
		<button type="button" id="dropdownbtn"
			class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			정렬</button>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="#">정렬</a> <a class="dropdown-item"
				href="#">가격 낮은 순</a> <a class="dropdown-item" href="#">가격 높은 순</a>
		</div>
	</div>
	<%-- 정렬 끝 --%>




	<%-- 검색창 시작 --%>
	<div class="CRSearchBox">
		<form action="#">
			<input class="CRSearchTxt" type="text" placeholder="검색어를 입력해주세요"
				name="search">
			<button class="CRSearchBtn" type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>
	</div>
	<%-- 검색창 끝 --%>

	<div id="CRDeleteAll">
		<label for="CRDeleteAll" class='CRDeleteCheckBox'>전체선택</label><input type="checkbox" id="CRDeleteAll" class='CRDeleteCheckBox' onclick='AllCheck(this.checked)' />
	</div>


	<%-- 상품 리스트 나오는 곳 시작 --%>
	<div class="CRSildeMenu" id="CRSildeMenuOne">

	
	</div>
</div>


</body>
<jsp:include page="../footer.jsp" />