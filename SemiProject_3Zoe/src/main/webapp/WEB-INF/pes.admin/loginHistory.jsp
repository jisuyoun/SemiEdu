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
  	
  	<div id ="content3" >
  		<div class="content3Div" >
  			<p>회원 로그인 기록</p>
  			
  			<div class="item2">
 				<p class="pC3">회원 로그인 기록 FORM</p>
  			</div>
  		</div>
  	</div>
</div>	
	
	

