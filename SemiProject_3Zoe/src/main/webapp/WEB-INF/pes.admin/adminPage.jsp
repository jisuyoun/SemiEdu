<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>   

<jsp:include page="adminHeader.jsp"/>

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
	
</script>

<div class="main1" >
  
  
  	<div id ="content2" >
  		<div class="content2Div" >
  			<p>공지사항</p>
  			
  			<div class="item2" >
 				<p class="pC3" >공지사항이 없습니다.</p>
  			</div>
  		</div>
  		
  		<div class="content2Div" >
  			<p>신규회원</p>
  			
  			<div class="item2" >
 				<p class="pC3" >신규회원이 없습니다.</p>
  			</div>
  		</div>
  	</div>
  	
  	
  	<div id ="content3" >
  		<div class="content3Div" >
  			<p>신규 결제내역</p>
  			
  			<div class="item2">
 				<p class="pC3" >신규 결제내역이 없습니다.</p>
  			</div>
  		</div>
  	</div>
</div>	
	
	

