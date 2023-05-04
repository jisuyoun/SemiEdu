<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">

	input.chkboxCos{
		zoom: 1.5; 
		border-radius:10px;
		border:solid 1px lightgray;
		margin-right:5px;
	}
	
	div.item3{

		border-bottom:solid 1px gray;
		 height:70%; 
		 margin-top:10px; 
		 display: flex; 
		 justify-content: center; 
		 align-items: center;
	}
	
		label.labelTag{
		font-size:11pt; position:relative; top:3px;
	}
	

	
</style>
  
<jsp:include page="header.jsp"/>


<div class="main1">
  	
  	<div class="content4" style="height:auto;">
  		
  		<div>
  			<ul class="navbar-nav" style="width: 100%; display: flex; margin-bottom:15px; justify-content: space-between;">

		
			    <li class="nav-item " style="display: flex; align-items: center; ">
			      	<span style="margin-bottom:10px;"><b>증명서 발급</b></span>
			      	
			 <%-- 
			      	<input type="checkbox" class="chkboxCos"  style=" margin-left:30px; "></input> <label style="font-size:11pt;" class="labelTag">수료 과정만 보기</label>
		

			      	<select style=" height:50px; color:gray; text-align:center; margin-left:1060px; width:150px; height: 45px; font-size:13pt;">
							<option>최근 신청순</option>
							<option>오래된 신청순</option>
							<option >과정명 오름차순</option>
							<option >과정명 내림차순</option>
							<option>시작일 오름차순</option>
							<option>시작일 내림차순</option>
							<option>종료일 오름차순</option>
							<option>종료일 내림차순</option>
		
					</select> 
  --%>
			    </li>
			  </ul>
			  
			  
			<!-- 만약 증명서가 아무것도 없다면 -->
			<c:if test="${empty requestScope.cosList}"> 
				<hr style="border:solid 0.5px black; margin-top:20px;">
		  		<div class="item3">해당 과정이 없습니다.</div>
	  		</c:if>
	  		
	  		<!-- 만약 증명서가 있으면 -->
	  		<c:if test="${not empty requestScope.cosList}"> 
	  		<div class="row row-cols-1 row-cols-md-4">
	  		
	  		<c:forEach var="cos"  items="${requestScope.cosList}" >
	  		
			  <div class="col mb-4">
			    <div class="card h-100" style="border-radius:25px;">
		
			      <img src="../yjs.images/${cos.img1}" style="border-radius:25px 25px 0 0; "  class="card-img-top" alt="${cos.courseName}">
			     
			      
			      <div class="card-body"  >
			        <h5 class="card-title">${cos.courseName}</h5>
			        <p class="card-text" style="font-size:12pt; cursor:pointer;">증명서발급</p>
			        <a href="<%= ctxPath%>/ljh.member.controller/fileDownload.up?courseCode=${cos.courseCode}"></a>
			      </div>
			    </div>
			    
			  </div>
			  </c:forEach>
			  
			 </div>
			 
			</c:if>
	  
  		</div>

  	</div>
  
</div>
	
	
	
<script type="text/javascript">
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
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
</script>
	
</body>
</html>