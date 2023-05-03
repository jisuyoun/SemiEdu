<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>

<style>
	
	<%-- 상단 title 시작 --%>

	div.yh_bar {
	    width: 100%;
	    height: 200px;
	    background-size: contain;
	    top: 0;
	    left: 0;
	}
	
	#page_title {
	    position: relative;
	    font-size: 40pt;
	    top: -140px;
	    color: #fff;
	    text-align: center;
	    font-weight: bold;
	}

	.es_dropbtn {
		position: relative;
	    color: white;
	    font-size: 14px;
	    border: none;
	    cursor: pointer; 
	    top: -130px;
	    left: 1300px;
	    background-color: inherit;
	}
	
	.es_dropdown {
	    position: relative;
	    display: inline-block;
	   
	}
	
	.es_dropdown-content {
	    display: none;
	    position: absolute;
	    background-color: white;
	    border-radius: 10px;
	    margin-top: 10px; 
	    min-width: 120px;
	    overflow: auto;
	    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	    border: solid 1px #ddd;
	    font-size: 12pt;
	}
	
	.es_dropdown-content a {
	    color: gray;
	    padding: 5px 2px;
	    text-decoration: none;
	    display: block;
	}

	.es_dropdown-content a:hover {
		color: #1BCEB8;
	} 

	.show {display: block;}
	<%-- 상단 title 끝 --%>	
	

	h3.yh_title {
    font-size: 20pt;
    font-weight: 300;
    letter-spacing: -1.5pt;
    line-height: 1.3;
    color: #222;
	}
	
	div.yh_graybox {
	
		padding: 60px 0 100px !important;
		position: relative;
		background-color: #f3f7f8 !important;	
	 
    }
	
	div.yh_outline {
    	width: 64%;
    	position: relative;
    	margin: 0 auto;
    	min-width: 320px;
    
    }
    
	.rolling_panel { 
		height: 305px;
		position: relative; 
		margin: 50px auto; 
		border: 1px solid #c7c7c7;
		padding: 0 20px;
		overflow: hidden;

	 }
    .rolling_panel ul { 
    	position: relative; 
    	margin: 0 auto; 
    	padding: 0; 
    	list-style: none; 
    }
    .rolling_panel ul li { 
    	float: left; 
    	width: 390px; 
    	height: 140px;
    	margin-top: 50px;
    	margin-bottom: 50px;
    }
    
    .promotion_3 {
    	text-align: center;
    }
    
    .yh_container {
    	position: relative;
    	margin: 50px auto;
    	width: 1200px;
    }
    
	

</style>

<title>Insert title here</title>

<body>


	<jsp:include page="../header.jsp" />
	
	<%-- 상단 title 시작 --%>
	<div class="yh_bar">
		<img class="bar" src="<%= ctxPath %>/images/bar배경.png" style="width: 100%; height: 200px;"/>
		<h2 id="page_title">수강후기</h2>

		<button onclick= "location.href='<%= ctxPath%>/index.go'" class="es_dropbtn"><i class="fa-solid fa-house" style="color: #ffffff; font-size: 16pt; margin: 0 10px;"></i>|</button>

	    <button onclick="myFunction()" class="es_dropbtn" style="color:#ffffff; font-size: 14pt;"> 고객센터 <i class="fa-solid fa-circle-chevron-down" style="color: #ffffff; margin: 0 10px;"></i>|
		    <div id="myDropdown" class="es_dropdown-content">
		       <a href="#">수강신청</a>
		       <a href="<%= ctxPath%>/customerService/announcement.go">고객센터</a>
		    </div>
	    </button>
	    
	    <button onclick="myFunction2()" class="es_dropbtn" style="color:#ffffff; font-size: 14pt;"> 공지사항 <i class="fa-solid fa-circle-chevron-down" style="color: #ffffff; margin: 0 10px;"></i>|
		    <div id="myDropdown2" class="es_dropdown-content">
		       <a href="<%= ctxPath%>/customerService/announcement.go">공지사항</a>
		       <a href="<%= ctxPath%>/customerService/question.go">자주하는질문</a>
		       <a href="#">수강후기</a>
		       <a href="#">이벤트</a>
		    </div>
	    </button>

	</div>	
	<%-- 상단 title 끝 --%>
		
	
	<div class="yh_graybox">
		<div class="yh_outline">
			<h3 class="yh_title">수강후기</h3>
			
			<div class="rolling_panel">
			<button id="prev" style="width: 50px; height: 50px;"><i class="fa-solid fa-circle-chevron-left"></i></button>
			<button id="next" style="width: 50px; height: 50px;"><i class="fa-solid fa-circle-chevron-right"></i></button>

	            <ul>
	         		 <li class="slick-slide">
	                	<a class="a-review">
	                		<di>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-user OPUserIcon" style="color: #000000;"></dd>
			            	</di>
			            <span>사용자이름</span>
			            <h4>필기 합격 이후 실기 후기로 찾아뵐게요</h4>
			            <h5></h5>
			            <p>기존 워너에듀</p>
	                	</a>
	                </li>
	                
	                <li class="slick-slide">
	                	<a class="a-review">
	                		<di>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-user OPUserIcon" style="color: #000000;"></dd>
			            	</di>
			            <span>사용자이름</span>
			            <h4>필기 합격 이후 실기 후기로 찾아뵐게요</h4>
			            <h5></h5>
			            <p>기존 워너에듀</p>
	                	</a>
	                </li>
	                
	                <li class="slick-slide">
	                	<a class="a-review">
	                		<di>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-user OPUserIcon" style="color: #000000;"></dd>
			            	</di>
			            <span>사용자이름</span>
			            <h4>필기 합격 이후 실기 후기로 찾아뵐게요</h4>
			            <h5></h5>
			            <p>기존 워너에듀</p>
	                	</a>
	                </li>
	                
	                <li class="slick-slide">
	                	<a class="a-review">
	                		<di>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-user OPUserIcon" style="color: #000000;"></dd>
			            	</di>
			            <span>사용자이름</span>
			            <h4>필기 합격 이후 실기 후기로 찾아뵐게요</h4>
			            <h5></h5>
			            <p>기존 워너에듀</p>
	                	</a>
	                </li>
	                
	                <li class="slick-slide">
	                	<a class="a-review">
	                		<di>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-user OPUserIcon" style="color: #000000;"></dd>
			            	</di>
			            <span>사용자이름</span>
			            <h4>필기 합격 이후 실기 후기로 찾아뵐게요</h4>
			            <h5></h5>
			            <p>기존 워너에듀</p>
	                	</a>
	                </li>
	                
	                <li class="slick-slide">
	                	<a class="a-review">
	                		<di>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-user OPUserIcon" style="color: #000000;"></dd>
			            	</di>
			            <span>사용자이름</span>
			            <h4>필기 합격 이후 실기 후기로 찾아뵐게요</h4>
			            <h5></h5>
			            <p>기존 워너에듀</p>
	                	</a>
	                </li>
	            </ul>
	        </div>
	    </div>
</div>

 
	 	<script>
		<%-- 무한롤링배너 --%>
		   // Get the button
		   let mybutton = document.getElementById("myBtn");
		   
		   // When the user scrolls down 20px from the top of the document, show the button
		   window.onscroll = function() {scrollFunction()};
		   
		   function scrollFunction() {
		     if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		       mybutton.style.display = "block";
		       
		     } else {
		       mybutton.style.display = "none";
		     }
		   }
		   
		   // When the user clicks on the button, scroll to the top of the document
		   function topFunction() {
		     
		     window.scrollTo({top:0, behavior:'smooth'});
		   }
		</script>
		
        <script type="text/javascript">
        $(document).ready(function() {

            var $panel = $(".rolling_panel").find("ul");

            var itemWidth = $panel.children().outerWidth(); // 아이템 가로 길이
            var itemLength = $panel.children().length;      // 아이템 수

            // Auto 롤링 아이디
            var rollingId;

            auto();

            // 배너 마우스 오버 이벤트
            $panel.mouseover(function() {
                clearInterval(rollingId);
            });

            // 배너 마우스 아웃 이벤트
            $panel.mouseout(function() {
                auto();
            });

            // 이전 이벤트
            $("#prev").on("click", prev);

            $("#prev").mouseover(function(e) {
                clearInterval(rollingId);
            });

            $("#prev").mouseout(auto);

            // 다음 이벤트
            $("#next").on("click", next);

            $("#next").mouseover(function(e) {
                clearInterval(rollingId);
            });

            $("#next").mouseout(auto);

            function auto() {

                // 2초마다 start 호출
                rollingId = setInterval(function() {
                    start();
                }, 2000);
            }

            function start() {
                $panel.css("width", itemWidth * itemLength);
                $panel.animate({"left": - itemWidth + "px"}, function() {

                    // 첫번째 아이템을 마지막에 추가하기
                    $(this).append("<li>" + $(this).find("li:first").html() + "</li>");

                    // 첫번째 아이템을 삭제하기
                    $(this).find("li:first").remove();

                    // 좌측 패널 수치 초기화
                    $(this).css("left", 0);
                });
            }

            // 이전 이벤트 실행
            function prev(e) {
                $panel.css("left", - itemWidth);
                $panel.prepend("<li>" + $panel.find("li:last").html() + "</li>");
                $panel.animate({"left": "0px"}, function() {
                    $(this).find("li:last").remove();
                });
            }

            // 다음 이벤트 실행
            function next(e) {
                $panel.animate({"left": - itemWidth + "px"}, function() {
                    $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
                    $(this).find("li:first").remove();
                    $(this).css("left", 0);
                });
            }
        });
        </script>
	


	
	
	<%-- 수강 후기 시작 --%>
      <div id="OPCosReview" class="yh_container">
         <h4 id="OPCosReviewTitle">수강후기</h4>
         <hr style="max-width: 1196px;"/>
         
         <div class="OPCosReviewStar">
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-user OPUserIcon" style="color: #000000;"></i><a>사용자이름</a>
            <a class="OPReviewWritingDay">글쓴날짜</a>
         </div>   
         
         <div class="OPCosReviewSmallTitle">수강후기제목</div>
         <div>수강후기내용</div>
         <div class="OPCosReviewPlus">더보기</div>
         <div class="OPCosReviewHideMethod">
            <div>수강후기내용자세히</div>
            <div class="OPCosReviewHide">접기</div>
         </div>
         
         <hr style="max-width: 1196px;"/>
         
         <div class="OPCosReviewStar">
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-user OPUserIcon" style="color: #000000;"></i><a>사용자이름</a>
            <a class="OPReviewWritingDay">글쓴날짜</a>
         </div>   
         
         <div class="OPCosReviewSmallTitle">수강후기제목</div>
         <div>수강후기내용</div>
         <div class="OPCosReviewPlus1">더보기</div>
         <div class="OPCosReviewHideMethod1">
            <div>수강후기내용자세히</div>
            <div class="OPCosReviewHide1">접기</div>
         </div>
         
         <hr style="max-width: 1196px;"/>
         
         <div class="OPCosReviewStar">
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-user OPUserIcon" style="color: #000000;"></i><a>사용자이름</a>
            <a class="OPReviewWritingDay">글쓴날짜</a>
         </div>   
         
         <div class="OPCosReviewSmallTitle">수강후기제목</div>
         <div>수강후기내용</div>
         <div class="OPCosReviewPlus2">더보기</div>
         <div class="OPCosReviewHideMethod2">
            <div>수강후기내용자세히</div>
            <div class="OPCosReviewHide2">접기</div>
         </div>
         
         <hr style="max-width: 1196px;"/>
         
         <div class="OPCosReviewStar">
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-user OPUserIcon" style="color: #000000;"></i><a>사용자이름</a>
            <a class="OPReviewWritingDay">글쓴날짜</a>
         </div>   
         
         <div class="OPCosReviewSmallTitle">수강후기제목</div>
         <div>수강후기내용</div>
         <div class="OPCosReviewPlus3">더보기</div>
         <div class="OPCosReviewHideMethod3">
            <div>수강후기내용자세히</div>
            <div class="OPCosReviewHide3">접기</div>
         </div>
      
      </div>   
      <%-- 수강 후기 끝 --%>
      
      <script>
      $("div.OPCosReviewHideMethod").hide();
      
      $("div.OPCosReviewPlus").click(function(){
         $(this).hide();
         $("div.OPCosReviewHideMethod").show();
      });
      $("div.OPCosReviewHide").click(function(){
         $("div.OPCosReviewHideMethod").hide();
         $("div.OPCosReviewPlus").show();
      });
      
      
      $("div.OPCosReviewHideMethod1").hide();
      
      $("div.OPCosReviewPlus1").click(function(){
          $(this).hide();
          $("div.OPCosReviewHideMethod1").show();
       });
       $("div.OPCosReviewHide1").click(function(){
          $("div.OPCosReviewHideMethod1").hide();
          $("div.OPCosReviewPlus1").show();
       });
       
       
       $("div.OPCosReviewHideMethod2").hide();
       
       $("div.OPCosReviewPlus2").click(function(){
           $(this).hide();
           $("div.OPCosReviewHideMethod2").show();
        });
        $("div.OPCosReviewHide2").click(function(){
           $("div.OPCosReviewHideMethod2").hide();
           $("div.OPCosReviewPlus2").show();
        });
        
        
        $("div.OPCosReviewHideMethod3").hide();
        
        $("div.OPCosReviewPlus3").click(function(){
            $(this).hide();
            $("div.OPCosReviewHideMethod3").show();
         });
         $("div.OPCosReviewHide3").click(function(){
            $("div.OPCosReviewHideMethod3").hide();
            $("div.OPCosReviewPlus3").show();
         });
         
      
      </script>
      
</body>
<jsp:include page="../footer.jsp" />
	