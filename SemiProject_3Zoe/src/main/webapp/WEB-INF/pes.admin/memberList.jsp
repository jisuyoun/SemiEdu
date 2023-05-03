<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String ctxPath = request.getContextPath();
%>   


<jsp:include page="adminHeader.jsp"/>


<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/memberListStyle.css" />

<script type="text/javascript">

	/* dropdown buttons to toggle */
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;
	
	for (i = 0; i < dropdown.length; i++) {
	  dropdown[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var dropdownContent = this.nextElementSibling;
	    if (dropdownContent.style.display === "block") {
	      dropdownContent.style.display = "none";
	    } else {
	      dropdownContent.style.display = "block";
	    }
	  });
	}
	
	
	/* 회원 검색 */
	$(document).ready(function(){
		
		 // trim 을 사용하지 않았을 경우 띄어쓰기만 하고 검색한 것도 검색 후 검색창에 유지된다.
		if("${requestScope.searchType}" != "" &&
		   "${requestScope.searchWord}" != ""){	
			$("select#searchType").val("${requestScope.searchType}");
			$("input#searchWord").val("${requestScope.searchWord}");
		}
		 
		$("select#sizePerPage").val("${requestScope.sizePerPage}");
	
		$("input#searchWord").keyup(function (e) {
			
			if(e.keyCode == 13){ // 검색어에서 엔터를 하면 검색하러 가도록 한다. 
				goSearch();
			}			
		});
		
		
		$("select#sizePerPage").bind("change", function(){ 
			goSearch();
		});//end of $("select#sizePerPage").bind("change", function(){})----------
		
		
		// 특정 회원을 클릭하면 그 회원의 상세정보를 보여주기
		$("tr.memberInfo").click( (e) => {
		//	alert( $(e.target).parent().find(".userid").text() );
		
			const userid = $(e.target).parent().find(".userid").text();
			location.href="<%= ctxPath%>/pes.admin/memberOneDetail.go?userid="+userid;
		});
		
	});// end of $(document).ready(function(){})-----------------------------
	
	
	// Function Declaration
	function goSearch(){
		
		const frm = document.memberFrm;		

		if( frm.searchWord.value.trim() == "" ){
			alert("검색어를 올바르게 입력하세요.");
			return; //함수종료
		}

		frm.action = "memberList.go";
		frm.method = "get";
		frm.submit();
	};


</script>

<div class="main1" >
  	
<div id ="content3" >
	<div class="content3Div" >
		<p style="font-size: 20pt; font-weight: bold;">[ 회원전체목록 ]</p>
		
		<div class="item2">
		
		<form name="memberFrm">
		<select id="searchType" name="searchType">
			<option value="">선택하세요</option>
			<option value="name">회원명</option>
			<option value="userid">아이디</option>
			<option value="mobile">연락처</option>
		</select>
		
		<%-- 검색기능 --%>
		<input type="text" id="searchWord" name="searchWord" />
		<input type="text" style="display: none;" /> 
		 
		<button type="button" class="btn btn-secondary" style="margin-left: 10px; margin-right: 30px;" onclick="goSearch();">검색</button>
		
		<span style="color: gray; font-weight: bold; font-size: 12pt;">개수-</span>
	      <select id="sizePerPage" name="sizePerPage">
	         <option value="10">10개</option>
	         <option value="5">5개</option>
	         <option value="3">3개</option>
	      </select>

		</form>
		
		<table id="memberTbl" class="table table-bordered" style="width: 90%; margin-top: 20px;">
	        <thead>
	           <tr>
	              <th>아이디</th>
	              <th>회원명</th>
	              <th>이메일</th>
	              <th>연락처</th>
	           </tr>
	        </thead>	
	        
	        <tbody>
	        	<c:if test="${not empty requestScope.memberList}"> 
		        	<c:forEach var="mvo" items="${requestScope.memberList}">
		        		<tr class="memberInfo">
			              <td class="userid">${mvo.userid}</td>
			              <td>${mvo.name}</td>
			              <td>${mvo.email}</td>
			              <td>${mvo.mobile}</td>
			           </tr>
		        	</c:forEach>
		        </c:if>
		        
		        <c:if test="${empty requestScope.memberList}">
		        	<tr>
		              <td colspan="4">가입된 회원이 없습니다.</td>
	           		</tr>
		        </c:if>	
	        </tbody>
		</table> 
		
		 <nav class="my-5">
	        <div style='display:flex; width:80%;'>
	          <ul class="pagination" style='margin:10px auto;'>${requestScope.pageBar}</ul>
	       </div>
	     </nav>         

		</div>
	
	</div>
</div>
  	
</div>	
	

