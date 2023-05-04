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
    
    a {
    	color: gray;
    }
	
	button.bu {
		outline-style: auto;
	}

</style>

<title>워너에듀</title>

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
			<button id="prev" class="bu" style="width: 50px; height: 50px;"><i class="fa-solid fa-circle-chevron-left"></i></button>
			<button id="next" class="bu" style="width: 50px; height: 50px;"><i class="fa-solid fa-circle-chevron-right"></i></button>

	            <ul>
	         		 <li class="slick-slide">
	                	<a class="a-review">
	                		<di>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-user OPUserIcon" style="color: #000000;"></dd>
			            	</di>
			            <span>워너에듀</span>
			            <h4 style="color: gray;">정보처리기사 실기 1회차 합격후기</h4>
			            <h5></h5>
			            <p>정보처리기사 실기</p>
	                	</a>
	                </li>
	                
	                <li class="slick-slide">
	                	<a class="a-review">
	                		<di>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-user OPUserIcon" style="color: #000000;"></dd>
			            	</di>
			            <span>워너에듀</span>
			            <h4 style="color: gray;">덕분에 도움많이 받고 1회에 합격했습니다.</h4>
			            <h2></h2>
			            <p>정보처리기사 필기</p>
	                	</a>
	                </li>
	                
	                <li class="slick-slide">
	                	<a class="a-review">
	                		<di>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-user OPUserIcon" style="color: #000000;"></dd>
			            	</di>
			            <span>워너에듀</span>
			            <h4 style="color: gray;">필기 합격 이후 실기 후기로 다시 찾아 뵙게 되었습니다!!</h4>
			            <h5></h5>
			            <p>정보처리기사 실기</p>
	                	</a>
	                </li>
	                
	                <li class="slick-slide">
	                	<a class="a-review">
	                		<di>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-user OPUserIcon" style="color: #000000;"></dd>
			            	</di>
			            <span>워너에듀</span>
			            <h4 style="color: gray;">정보처리기사 3회차 필기 비전공자 14일 공부 현실 찐 합격 수기입니다.</h4>
			            <h5></h5>
			            <p>정보처리기사 필기</p>
	                	</a>
	                </li>
	                
	                <li class="slick-slide">
	                	<a class="a-review">
	                		<di>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-solid fa-star" style="color: #1bcdb9;"></dd>
					            <dd class="fa-regular fa-user OPUserIcon" style="color: #000000;"></dd>
			            	</di>
			            <span>워너에듀</span>
			            <h4 style="color: gray;">필기 합격 이후 실기 후기로 찾아뵐게요</h4>
			            <h5></h5>
			            <p>정보처리기사 실기</p>
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
			            <span>워너에듀</span>
			            <h4 style="color: gray;">필기 합격 이후 실기 후기로 찾아뵐게요</h4>
			            <h5></h5>
			            <p>정보처리기사 실기</p>
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
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-user OPUserIcon" style="color: #000000;"></i><a>사용자이름</a>
            <a class="OPReviewWritingDay">2023.04.14</a>
         </div>   
         
         <div class="OPCosReviewSmallTitle">정보처리기사 합격 후기</div>
         <div>기존 워너에듀IT 홈페이지 김**(su*******@..)회원님의 후기입니다.</div>
         <br>
         <div class="OPCosReviewPlus">더보기</div>
         <div class="OPCosReviewHideMethod">
            <div>안녕하세요 저는 1,2 학년 정보통신을 전공하고 편입을 하여 통계학과에 재학중인 통계가 맞지 않는 4학년입니다.

(그냥 전공 그대로 할걸 그랬어요 ㅠㅠ ㅋㅋㅋ)

​

우선 저는 외우는 것을 굉장히 못하고 굉장히 싫어합니다. 그렇기 때문에 더 이를 악물고 공부하였습니다.

공부 시작은 3월 말부터 하였고 공부기간은 35일 정도 된 것 같습니다. 우선 책은 2번 반 정도를 봤습니다.

추가적으로 데일리 문제는 매일 확인하여 몰랐던 부분이나 틀린 부분은 노트를 따로 만들어 공부하였습니다.</div>
            <div class="OPCosReviewHide">접기</div>
         </div>
         
         <hr style="max-width: 1196px;"/>
         
         <div class="OPCosReviewStar">
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-user OPUserIcon" style="color: #000000;"></i><a>사용자이름</a>
            <a class="OPReviewWritingDay">2023.04.14</a>
         </div>   
         
         <div class="OPCosReviewSmallTitle">정보처리기사 필기 합격후기 ( 7일의 노력 )</div>
         <div>기존 워너에듀IT 홈페이지 문**(ap*******..)회원님의 후기입니다.</div>
         <br>
         <div class="OPCosReviewPlus1">더보기</div>
         <div class="OPCosReviewHideMethod1">
            <div>2020 정보처리기사 필기 문제들을 풀어보니 평균 60점대가 나왔으며 저는 데이터베이스 구축 과목과 프로그래밍언어 활용 과목의 점수가 낮게 나와

수제비 카페에서 Daily 문제, 모의고사, 페코페코 예상문제 들을 계속 하루 8시간 동안 풀이, 해설을 반복으로 풀었습니다. !



마지막 날엔 시험 보러 가기 전에 2020년도 정처기 필기를 다시 한번 차근차근 풀어보고 틀린 문제 위주로 오답노트를 작성하여 공부해갔습니다!



쉬운 난이도의 82.08%로 역대급의 합격률이지만

이러한 77점의 평균은 수제비의 도움이라고 생각합니다. 감사합니다!</div>
            <div class="OPCosReviewHide1">접기</div>
         </div>
         
         <hr style="max-width: 1196px;"/>
         
         <div class="OPCosReviewStar">
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-user OPUserIcon" style="color: #000000;"></i><a>사용자이름</a>
            <a class="OPReviewWritingDay">2023.04.14</a>
         </div>   
         
         <div class="OPCosReviewSmallTitle">덕분에 도움많이 받고 1회에 합격했습니다.</div>
         <div>기존 워너에듀IT 홈페이지 최**(ys******..)회원님의 후기입니다.</div>
         <br>
         <div class="OPCosReviewPlus2">더보기</div>
         <div class="OPCosReviewHideMethod2">
            <div>카페에도 수강 후기 길게 적었는데 다시 한번 적게 되네요.

한달의 시간동안 정말 치열하게 듣고 학습자료 반복해서 보며 열심히 공부했습니다.

다른 공부와 병행하느라 어려운 점도 많았지만 강의가 가이드라인을 많이 잡아줘서 좋았습니다.



재수라...이번엔 꼭 합격하고 싶어 강의를 끊어 듣게 되었습니다.

먼저 올라왔던 코드와 sql부분부터 보며 익숙해지기 위해 노력했고 하루에 할당량 정해서

정해진 강의는 꼭 다 듣기로 계획을 세워 공부했습니다.



책이랑 같이 보자니 시간이 너무 걸리는 거 같아 강의부터 우선 자료와 함께 모두 들었고

들은 자료랑 같이 책을 보며 2회독을 했습니다. 그 후에 카페에 나온 문제랑 책문제를 병행하며 공부했고

합격의 쾌거를 이룰 수 있었습니다.</div>
            <div class="OPCosReviewHide2">접기</div>
         </div>
         
         <hr style="max-width: 1196px;"/>
         
         <div class="OPCosReviewStar">
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-solid fa-star" style="color: #1bcdb9;"></i>
            <i class="fa-regular fa-user OPUserIcon" style="color: #000000;"></i><a>사용자이름</a>
            <a class="OPReviewWritingDay">2023.04.14</a>
         </div>   
         
         <div class="OPCosReviewSmallTitle">정보처리기사 3회차 필기 비전공자 14일 공부 현실 찐 합격 수기입니다.</div>
         <div>기존 워너에듀IT 홈페이지 김**(cy******..) 회원님의 후기입니다.</div>
         <br>
         <div class="OPCosReviewPlus3">더보기</div>
         <div class="OPCosReviewHideMethod3">
            <div>정보처리기사 3회차 필기 비전공자 14일 공부 현실 찐 합격 수기입니다.

우선 저는 이번 정보처리기사 3회차 13/14/19/11/13으로 수제비 강의를 통해 합격을 하게 되었습니다!!

안녕하세요 저는 일단 컴활 1급 외에 다른 IT 자격증 1도 없는 비전공자 입니다.

우선 저는 정보처리기사 관련 내용을 보자마자 너무 어려웠고 풀수 없겠다 싶었는데 커리큘럼이 잘되어 있어서 그런지 몰라도 단기간 내에 비전공자들이 합격하기에는 수제비 밖에 없는거 같습니다. ㅋㅋㅋ

조금 유치하지만 용단의 피존, 문서작컴인디, 클객컴패복패 이런 두음으로 비전공자들이 필기에 대한 진입장벽을 훨씬 낮춰준 최고의 강의 였습니다.
물론 3회차에 생소한 여러 개념들과 두음이 생각보다 많이 출제되지는 않았으나 수제비 강의와 함께 합격하기에는 무리가 없었다고 생각 합니다. !
정보처리기사는 ~? 수제비!! ^^ 실기도 수제비와 함께 합격 달려 보겠습니다.</div>
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
	