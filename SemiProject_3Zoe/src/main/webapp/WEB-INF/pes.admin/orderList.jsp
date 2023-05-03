<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>   

<jsp:include page="adminHeader.jsp"/>


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

	
</style>


<script type="text/javascript">

	
//  ==== 전체 datepicker 옵션 일괄 설정하기 ==== //	
//  한번의 설정으로 $("input#fromDate"), $("input#toDate") 의 옵션을 모두 설정할 수 있다.  
    $(function() {
        //모든 datepicker에 대한 공통 옵션 설정
        $.datepicker.setDefaults({
             dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시됨. both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시됨.  
             ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
          ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
         ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
         // ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
         // ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
        });

        //input을 datepicker로 선언
        $("input#fromDate").datepicker();                    
        $("input#toDate").datepicker();
        
        
    });

</script>  
  
  



<div class="main1">
  	
  	<div class="content4">
  		
  		<div>
  			<ul class="navbar-nav" style="width: 100%; display: flex; justify-content: space-between;">

		
			    <li class="nav-item " style="display: flex; align-items: center; ">
			      	<span><b>결제내역 조회</b></span>
			 
			 

			  </ul>
	  
  		</div>
  		<div style="display:flex; justify-content: center; align-items: center; background-color:#f3f7f8; margin-top:30px; height:120px;">
  			
 
  				<button type="button" class="btn btn-outline-secondary" style="width:90px; height:60px; background-color:white; margin-right:10px;">1개월전</button>
  				<button type="button" class="btn btn-outline-secondary" style="width:90px; height:60px; background-color:white; margin-right:10px;">3개월전</button>
  				<button type="button" class="btn btn-outline-secondary" style="width:90px; height:60px; background-color:white; margin-right:10px;">6개월전</button>
  				
  				<input type="text"  id="fromDate" style=" margin-right:10px; width:200px; height:60px;">&nbsp; ~&nbsp; 
                <input type="text" id="toDate" style=" margin-right:10px; width:200px; height:60px;">
                
                <button type="button" class="btn btn-dark" style="width:90px; height:60px; font-size:20px; margin-right:10px; margin-left:10px;">검색</button>

  	  </div>

  	  
  	  <table  class="table" style="margin-top:50px; text-align:center;">
  	  	<thead class="thead-light" style="height:20px; ">
  	  		<tr>
		  	  	<th>No</th>
		  	  	<th>주문명</th>
		  	  	<th>결제금액</th>
		  	  	<th>결제수단</th>
		  	  	<th>주문일</th>
		  	  	<th>상태</th>
	  	  	</tr>
  	  	</thead>
  	  	
  	  	<tbody>
		    <tr>
		      <td>1</td>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		    </tr>
		    <tr>
		      <td>1</td>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		    </tr>
		    <tr>
		      <td>1</td>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		    </tr>
		  </tbody>
  	  </table>
  	</div>
  	
  	
  	<!-- 삭제예정 -->
  	<button type="button" onclick = "location.href = '<%= ctxPath %>/pes.admin/orderDetail.go'">상세페이지로 가는 버튼</button>
  
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