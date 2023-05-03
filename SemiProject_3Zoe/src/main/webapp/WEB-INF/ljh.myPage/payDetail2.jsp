<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>   
<jsp:include page="header.jsp"/>
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
	
	table.table{
		border-top:solid 1px black !important;
	}
	#thirdTable > tbody > tr > td:nth-child(odd) { 
		background-color: #e9ecef;
		width:150px;
		text-align:center;
		
	}
	
	#thirdTable > tbody > tr > td:nth-child(even) {
		padding-left:20px;
	}

	
</style>


<script type="text/javascript">



</script>  
  
  



<div class="main1">
  	
  	<div class="content4" style="height:300px;">
  		
  		<div>
  			<ul class="navbar-nav" style="width: 100%; display: flex; justify-content: space-between;">
			    <li class="nav-item " style="display: flex; align-items: center; ">
			      	<span><b>결제내역 조회</b></span>
			 
			  </ul>
	  
  		</div>
  	
  	  
  	  <table  class="table" style="margin-top:30px; text-align:center;  font-size:12pt;">
  	  	<thead class="thead-light" style="height:20px;">
  	  		<tr>
		  	  	<th>No</th>
		  	  	<th >주문명</th>
		  	  	<th>결제금액</th>
		  	  	<th>결제수단</th>
		  	  	<th>주문일</th>
		  	  	<th>상태</th>
	  	  	</tr>
  	  	</thead>
  	  	
  	  	<tbody>
		    <tr>
		      <td>1</td>
		      <td>정보처리기사 필기 외 2건</td>
		      <td>237,000원</td>
		      <td>2023.05.03</td>
		      <td>가상계좌</td>
		      <td>결제완료</td>
		    </tr>

		  </tbody>
  	  </table>
  	  
  	  <button type="button" class="btn btn-outline-secondary" style="width:80px; height:48px; background-color:white; ">목록</button>
  	</div>
  	
  	
  	
  	
  	<div class="content4" style="height:auto; margin-top:30px;">
  		
  		<div>
  			<ul class="navbar-nav" style="width: 100%; display: flex; justify-content: space-between;">
			    <li class="nav-item " style="display: flex; align-items: center; ">
			      	<span><b>주문 상세 내역</b></span>
			 
			  </ul>
	  
  		</div>
  	
  	  
  	  <table  class="table" style="margin-top:30px; text-align:center; font-size:12pt;">
  	  	<thead class="thead-light" style="height:20px; ">
  	  		<tr>
		  	  	<th>No</th>
		  	  	<th>주문 목록</th>
		  	  	<th>판매가</th>
		  	  	<th>할인금액</th>
		  	  	<th>결제금액</th>
	  	  	</tr>
  	  	</thead>
  	  	
  	  	<tbody>
		    <tr>
		      <td>1</td>
		      <td>정보처리기사</td>
		      
		      <td>
		      	<span style="text-decoration:line-through; color:gray;">130,000</span>
		      	<br>
		      	<span>79,000원</span>
		      </td>
		      
		      <td style=" color:gray;">0원</td>
		      <td>79,000원</td>
		    </tr>

		  </tbody>
  	  </table>
  	  
  	 </div>
  	 
 	 
 	 
 	 
 	   	<div class="content4" style="height:auto; margin-top:30px;">
	 		
	 		<div>
	 			<ul class="navbar-nav" style="width: 100%; display: flex; justify-content: space-between;">
			    <li class="nav-item " style="display: flex; align-items: center; ">
			      	<span><b>결제 정보</b></span>
			 
			  </ul>
	  
	 		</div>
	 	
	 	  
	 	  <table id="thirdTable" class="table table-bordered" style="margin-top:30px;  font-size:12pt;">
	 	  	<tr>
		  	  <td>주문번호</td>
		      <td>정보처리기사 필기 외 2건</td>
	  	  	</tr>
	  	  	
	  	  	<tr>
		  	  <td>총결제금액</td>
		      <td>237,000원</td>
	  	  	</tr>
	  	  	
	  	  	<tr>
		  	  <td>주문일자</td>
		      <td>정보처리기사 필기 외 2건</td>
	  	  	</tr>
	  	  	
	  	  	<tr>
		  	  <td>적립포인트</td>
		      <td>정보처리기사 필기 외 2건</td>
	  	  	</tr>
	
	 	  </table>
 	  
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