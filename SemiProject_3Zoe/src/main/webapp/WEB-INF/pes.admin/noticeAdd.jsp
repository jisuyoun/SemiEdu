<%@page import="pes.notice.model.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%
    String ctxPath = request.getContextPath();
%>   

<jsp:include page="adminHeader.jsp"/>

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/RegisterStyle.css" />


<style>

	table#tblProdInput {
		border: solid gray 1px; 
	    border-collapse: collapse; 
	}
	                       
	table#tblProdInput td {
		border: solid gray 1px; 
	    padding-left: 10px;
	    height: 50px; 
	}
	                       
	.prodInputName {
	 	background-color: #e6fff2; 
	    font-weight: bold; 
	}                                                 
	
	.error {
		color: red; 
		font-weight: bold; 
		font-size: 9pt;
	}
	
	tr.memberInfo:hover {
		background-color: #e6ffe6;
		cursor: pointer;
	}
	
	p {
		font-weight: bold;
	}
	
	
	div#content3 {
		height: auto !important;
	}
	
	.item2 {
		display: block !important;
		padding: 0 auto;
		align-items: center;
		padding: 70px 0 30px 0;
		height: auto;
	}
	
	form.prodInputFrm {
		margin: 0 auto;
		width: 90%;
	}

</style>


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
	         
	        console.log(input_file.files[0]); // 대괄호표기법 대신 .표기법
	        
	     	// File 객체의 실제 데이터(내용물)에 접근하기 위해 FileReader 객체를 생성
	        const fileReader = new FileReader();
	         
	        fileReader.readAsDataURL(input_file.files[0]); 
	      
	        fileReader.onload = function() { // 파일 읽기 완료 성공시에만 작동
	        console.log(fileReader.result);

	            document.getElementById("previewImg").src = fileReader.result;
	         };
	    });	    

		 
		 // 게시글 등록하기
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
		 
		 // 작성취소
		 $("input[type='reset']").click(function(){
			 $("span.error").hide();
			 $("div.divfileattach").empty();
			 $("img#previewImg").hide();
		 });
		 
		    
	});//end of $(document).ready(function(){})-------------------------------
	
	
	
</script>

<div class="main1" >
  	
  	<div id ="content3" >
  		<div class="content3Div">
  			<p style="font-size: 20pt; font-weight: bold;">[ 공지사항 게시물 작성 ]</p>
  			
  			<div class="item2">
		
			<div align="center" style="margin-bottom: 20px;">
	
				<form name="prodInputFrm"
				      action="<%= request.getContextPath()%>/pes.admin/noticeAdd.go"
				      method="POST"         
				      enctype="multipart/form-data"> 
				      
				<table id="tblProdInput" style="width: 80%;">
				<tbody>
				   <tr>
				      <td width="25%" class="prodInputName" style="padding-top: 10px;">글번호</td>
				      <td width="75%" align="left" style="padding-top: 10px;" >
							<span><b>${requestScope.notice_seq}</b></span>
							<%--  <%=request.getAttribute("notice_seq") %>  --%>
				      </td>   
				   </tr>
				   <tr>
				      <td width="25%" class="prodInputName">공지사항 제목</td>
				      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;" >
				         <input type="text" style="width: 850px;" name="title" class="box infoData" />
				         <span class="error">필수입력</span>
				      </td>
				   </tr>
				   <tr>
				      <td width="25%" class="prodInputName">작성자</td>
				      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
				         <span><b>${(sessionScope.loginuser).name}</b>님</span>
				         <input type="hidden" name="writer" value="${(sessionScope.loginuser).name}">
				      </td>
				   </tr>
				   
				   <tr>
				      <td width="25%" class="prodInputName">공지글</td>
				      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
				         <textarea name="contents" rows="10" cols="90"></textarea>
				         <span class="error">필수입력</span>
				      </td>
				   </tr>
				   
				   
				   <%-- ==== 첨부파일 타입 추가하기 ==== --%>
				    <tr>
			          <td width="25%" class="prodInputName" style="padding-bottom: 10px;">이미지파일(선택)</td>
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
				          <input type="button" value="공지사항 등록" id="btnRegister" style="width: 150px; margin-top:50px; padding: 5px;" /> 
				          &nbsp;
				          <input type="reset" value="취소"  style="width: 150px; padding: 5px;" />   
				      </td>
				   </tr>
				  
				</tbody>
				</table>
				<input type="hidden" value="0" name="readcount">
				</form>
			</div>
		
		</div>
  		</div>
  	</div>
</div>	
	
	

