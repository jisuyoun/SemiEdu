<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%	
    String ctxPath = request.getContextPath();
%>   

<jsp:include page="adminHeader.jsp"/>

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/productRegisterStyle.css" />


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
	

	
	$(document).ready(function(){
		
		$("span.error").hide();

		// 스피너 달아주기 
	    $("input#spinnerImgQty").spinner({
	    	
	         spin:function(event,ui){
	          if(ui.value > 10) {
	             $(this).spinner("value", 10);
	             return false;
	          }
	          else if(ui.value < 0) {
	             $(this).spinner("value", 0);
	             return false;
	          }
	       }  
		});// end of $("input#spinnerImgQty").spinner({})------------		 
		    
		    
		$("input#spinnerImgQty").bind("spinstop", function(){
			
			let html = ``;
			let cnt =  $(this).val();
			
			console.log("~~~ 확인용 cnt : "+ cnt);
		
			for(let i=0; i<Number(cnt); i++){
				
				html += `<br><input type="file" name="attach\${i}" class="btn btn-default img_file" accept='image/*' />`;

			}//end of for---------------------------------
		
			$("div#divfileattach").html(html);
			$("input#attachCount").val(cnt);
			
		 });//end of $("input#spinnerImgQty").bind("spinstop", function(){})------------
		    
		 
		 
	    // 이미지파일 미리 보여주기
	    $(document).on("change", "input.img_file", function(e){
	    	
	    	const input_file = $(e.target).get(0);
	    	
	        console.log(input_file.files);
	        
	        console.log(input_file.files[0]); // 배열 아니고 대괄호표기법
	         
	        console.log(input_file.files[0].name); // 대괄호표기법 대신 .표기법
	        
	     	// File 객체의 실제 데이터(내용물)에 접근하기 위해 FileReader 객체를 생성
	        const fileReader = new FileReader();
	         
	        fileReader.readAsDataURL(input_file.files[0]); 
	      
	        fileReader.onload = function() { // 파일 읽기 완료 성공시에만 작동
	        console.log(fileReader.result);

	            document.getElementById("previewImg").src = fileReader.result;
	         };
	    });	    

		 
		 // 제품등록하기
		 $("input#btnRegister").click(function(){
			
			 $("span.error").hide();
			 
			 let flag = false;
			 
			 $(".infoData").each(function(index, elmt){
				 const val = $(elmt).val().trim();
				 if(val == ""){
					 $(elmt).next().show();
					 flag = true;
					 return false;
				 }
			 });
			 
			 if(!flag){
				 const frm = document.prodInputFrm;
				 frm.submit();
			 }
		 });
		 
		 // 취소
		 $("input[type='reset']").click(function(){
			 $("span.error").hide();
			 $("div.divfileattach").empty();
			 $("img#previewImg").hide();
		 });
		 
		    
	});//end of $(document).ready(function(){})-------------------------------
	
</script>

<div class="main1" >
  
<div id ="content3" >
	<div class="content3Div" >
		<p style="font-size: 20pt; font-weight: bold;">[ 신규강좌등록 ]</p>
		
		<div class="item2">
		
		<div align="center" style="margin-bottom: 20px;">

			<form name="prodInputFrm"
			      action="<%= request.getContextPath()%>/pes.admin/productRegister.go"
			      method="POST"         
			      enctype="multipart/form-data"> 
			      
			<table id="tblProdInput" style="width: 80%;">
			<tbody>
			   <tr>
			      <td width="25%" class="prodInputName" style="padding-top: 10px;">카테고리</td>
			      <td width="75%" align="left" style="padding-top: 10px;" >
			         <select name="fk_categoryCode" class="infoData"> <%-- 필수입력 class => infoData --%>
			            <option value="">:::선택하세요:::</option> 
			            <c:forEach var="map" items="${requestScope.categoryList}">
			            	<option value="${map.categoryName}">${map.categoryName}</option>
			            </c:forEach>
			            
			         </select>
			         <span class="error">필수입력</span>
			      </td>   
			   </tr>
			   <tr>
			      <td width="25%" class="prodInputName">강의명</td>
			      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;" >
			         <input type="text" style="width: 300px;" name="courseName" class="box infoData" />
			         <span class="error">필수입력</span>
			      </td>
			   </tr>
			   <tr>
			      <td width="25%" class="prodInputName">강사명</td>
			      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
			         <input type="text" style="width: 300px;" name="teacher" class="box infoData" />
			         <span class="error">필수입력</span>
			      </td>
			   </tr>
			   <tr>
			      <td width="25%" class="prodInputName">강의기간</td>
			      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
			         <input type="text" style="width: 100px;" name="courseTerm" class="box infoData" /> 일
			         <span class="error">필수입력</span>
			      </td>
			   </tr>
			   <tr>
			      <td width="25%" class="prodInputName">판매금액</td>
			      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
			         <input type="text" style="width: 100px;" name="price" class="box infoData" /> 원
			         <span class="error">필수입력</span>
			      </td>
			   </tr>
			   <tr>
			      <td width="25%" class="prodInputName">할인 판매금액</td>
			      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
			         <input type="text" style="width: 100px;" name="salePrice" class="box infoData" /> 원
			         <span class="error">필수입력</span>
			      </td>
			   </tr>
			   <tr>
			      <td width="25%" class="prodInputName" style="padding-bottom: 10px;">제품포인트</td>
			      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden; padding-bottom: 10px;">
			         <input type="text" style="width: 100px;" name="point" class="box infoData" /> POINT
			      </td>
			   </tr>
			   <tr>
			      <td width="25%" class="prodInputName">강의목록</td>
			      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
			         <textarea name="courseList" rows="5" cols="60"></textarea>
			         <span class="error">필수입력</span>
			      </td>
			   </tr>
			   <tr>
			      <td width="25%" class="prodInputName">강의 이미지</td>
			      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
			         <input type="file" name="img1" class="infoData img_file" accept='image/*' /><span class="error">필수입력</span>
			         <input type="file" name="img2" class="infoData img_file" accept='image/*' /><span class="error">필수입력</span>
			      </td>
			   </tr>

			   
			   <%-- ==== 첨부파일 타입 추가하기 ==== --%>
			    <tr>
			          <td width="25%" class="prodInputName" style="padding-bottom: 10px;">추가이미지파일(선택)</td>
			          <td>
			             <label for="spinnerImgQty">파일갯수 : </label>
			          <input id="spinnerImgQty" value="0" style="width: 30px; height: 20px;">
			             <div id="divfileattach"></div>
			              
			             <input type="hidden" name="attachCount" id="attachCount" />
			              
			          </td>
			    </tr>
			    
			    <%-- ==== 이미지파일 미리보여주기 ==== --%>
			    <tr>
			          <td width="25%" class="prodInputName" style="padding-bottom: 10px;">이미지파일 미리보기</td>
			          <td>
			             <img id="previewImg" width="300" />
			          </td>
			    </tr>
			   
			   <tr style="height: 70px;">
			      <td colspan="2" align="center" style="border-left: hidden; border-bottom: hidden; border-right: hidden;">
			          <input type="button" value="강의등록" id="btnRegister"  style="width: 150px; margin-top:50px; padding: 5px;" /> 
			          &nbsp;
			          <input type="reset" value="취소"  style="width: 150px; padding: 5px;" />   
			      </td>
			   </tr>
			</tbody>
			</table>
			</form>
		</div>
		
		</div>
	</div>
</div>
</div>	
	


