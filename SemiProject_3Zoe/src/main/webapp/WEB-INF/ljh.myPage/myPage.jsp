<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>   
 

  
<jsp:include page="header.jsp"/>

<div class="main1" >
  
  	<div id="content1" >
  	
  		<div class="item" >
  			<div class="pic">
  				<img src="https://www.wannaedu.com/theme/6/img/mypage/main/state_icon01.png"/>
  			</div>
  			
  			<div >
  				<p class="pC2">
  					<span class="spanC" >0</span>건
  				</p>
  				<p class="pC">수강중인 과정</p>
  			</div>
  		</div>
  		
  		<div class="item">
  			<div class="pic">
  				<img src="https://www.wannaedu.com/theme/6/img/mypage/main/state_icon02.png"/>
  			</div>
  			
  			<div stlye="">
  				<p class="pC2">
  					<span class="spanC" >0</span>건
  				</p>
  				<p class="pC">종료예정 과정<br>(15일 이내)</p>
  			</div>
  		</div>
  		
  		<div class="item">
  			<div class="pic">
  				<img src="https://www.wannaedu.com/theme/6/img/mypage/main/state_icon03.png"/>
  			</div>
  			
  			<div stlye="">
  				<p class="pC2">
  					<span class="spanC" >0</span>건
  				</p>
  				<p class="pC">수료완료</p>
  			</div>
  		</div>
  		
  		<div class="item">
  			<div class="pic">
  				<img src="https://www.wannaedu.com/theme/6/img/mypage/main/state_icon04.png"/>
  			</div>
  			
  			<div stlye="">
  				<p class="pC2">
  					<span class="spanC" >0</span>건
  				</p>
  				<p class="pC">결제내역</p>
  			</div>
  		</div>
  		
  		
  	</div>
  
  	<div id ="content2" >
  		<div class="content2Div" >
  			<p>공지사항</p>
  			
  			<div class="item2" >
 				<p class="pC3" >공지사항이 없습니다.</p>
  			</div>
  		</div>
  		
  		<div class="content2Div" >
  			<p>Q&A</p>
  			
  			<div class="item2" >
 				<p class="pC3" >상담내역이 없습니다.</p>
  			</div>
  		</div>
  	</div>
  	
  	
  	<div id ="content3" >
  		<div class="content3Div" >
  			<p>수행중인 과정</p>
  			
  			<div class="item2">
 				<p class="pC3" >수강중인 과정이 없습니다.</p>
  			</div>
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