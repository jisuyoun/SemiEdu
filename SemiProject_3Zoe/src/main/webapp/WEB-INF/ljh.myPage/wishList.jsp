<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>   

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
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
	

	
</style>
  

<script type="text/javascript">


	
	
	function deleteWishList(courseCode){
		$.ajax({
            url:"<%= ctxPath%>/ljh.member.controller/deleteWishList.go",
            data:{"courseCode":courseCode},    
            type: "post", 
            dataType:"json",
            success: function(json){ //삭제가 성공하면
               if(json.deleteWish==1){
            	   document.location.reload(true);
               }
               
            },
            
            error: function(request, status, error){
              alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
         });              
	}

</script> 
   
<jsp:include page="header.jsp"/>


<div class="main1">
  	
  	<div class="content4" style="height:auto; padding-bottom:10px;" >
  		
  		<div>
  		
 			<p style="margin-bottom:20px;"><b>위시리스트</b></p>
		 
		    <!-- 만약 위시리스트가 아무것도 없다면 -->
			<c:if test="${empty requestScope.cosList}"> 
				<hr style="border:solid 0.5px black; margin-top:20px;">
		  		<div class="item3">해당 과정이 없습니다.</div>
	  		</c:if>
	  		
	  		<!-- 만약 위시리스트가 있으면 -->
	  		<c:if test="${not empty requestScope.cosList}"> 
	  		<div class="row row-cols-1 row-cols-md-4">
	  		
	  		<c:forEach var="cos"  items="${requestScope.cosList}" >
	  		
			  <div class="col mb-4">
			    <div class="card h-100" style="border-radius:25px;">
			    <i class="fa-solid fa-heart fa-lg" id="i${cos.courseCode}" onclick="deleteWishList(${cos.courseCode})" style="color:#1bceb8; cursor:pointer; position:absolute; right:20px; top:30px;"></i>
			      
			      <a href="<%= ctxPath%>/yjs.cos/yjs_OrderPage.go?courseCode=${cos.courseCode}">
			      	<img src="../images/${cos.img1}" style="border-radius:25px 25px 0 0; "  class="card-img-top" alt="${cos.courseName}">
			      </a>
			      
			      <div class="card-body" onClick="location.href =''" style="cursor:pointer;">
			        <h5 class="card-title">${cos.courseName}</h5>
			        <p class="card-text" style="font-size:12pt;">기간 <span style="margin-left:15px; font-size:12pt; color:gray;">${cos.courseTerm}일</span></p>
			        <p class="card-text" style="color:#1bceb8; font-weight:bold;"><fmt:formatNumber value="${cos.salePrice}" pattern="#,###"/>원</p>
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