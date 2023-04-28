<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>

<jsp:include page="header.jsp" /> 

 
<style>

	.rolling_panel { 
      position: relative; 
      height: 305px; 
      margin: 50px auto; 
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
    }

    
    
</style>

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/headerStyle2.css" />

<body>

<div id="slideshow1" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#slideshow1" data-slide-to="0" class="active"></li>
    <li data-target="#slideshow1" data-slide-to="1"></li>
    <li data-target="#slideshow1" data-slide-to="2"></li>
    <li data-target="#slideshow1" data-slide-to="3"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=request.getContextPath()%>/images/carousel1.png" alt="carousel1" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/images/carousel2.png" alt="carousel2" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/images/carousel3.png" alt="carousel3" width="1100" height="500">
    </div>
     <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/images/carousel4.png" alt="carousel4" width="1100" height="500">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#slideshow1" data-slide="prev">
    <i class="fa-solid fa-circle-chevron-left"></i>
  </a>
  <a class="carousel-control-next" href="#slideshow1" data-slide="next">
    <i class="fa-solid fa-circle-chevron-right"></i>
  </a>
</div>


<div class="promotion_1" style="height:650px !important;">
    <div class="academy_bg grayBox"></div>
    <div class="banner_1">
        <div class="video_cont"><a href="#"><img src="<%=request.getContextPath()%>/images/banner1.png" alt="배너이미지1" /></a></div>
        <div class="text_cont">
            <h2 style="font-weight: bold; color: black;">정보처리기사 실기 파이널 맛보기</h2>
            
            <p class="stxt" style="margin: 10px 0;">
                정보처리기사 합격을 위한 확실한 방법!<br>모의고사와 기출문제 풀이로 실전에 대비하세요.
            </p>
            
            <a href="https://www.youtube.com/watch?v=nZDLgdLQ7To" class="mypage bgColor" style="margin-top: 20px;">  ***  바로가기</a>
        </div>
    </div>
</div>



<div class="banner_2">
	<a href="#"><img src="<%=request.getContextPath()%>/images/banner2.png" style="width: 1230px; height: 260px;" alt="배너이미지2" /></a>
</div>




<div class="promotion_2" style="height:800px !important;">

	<h3 class="es_title" style="padding: 100px 0 50px 0; font-weight: bold; font-size: 30pt; color: black;">BEST 인기강의</h3>
	<div class="rolling_panel" style="height: 400px; ">
            <ul>
                 <li class="slick-slide" style="width: 450px; height: 400px;"><a><img src="<%=request.getContextPath()%>/images/best1.png" style="width: 350px; height: 400px;" alt="배너이미지2" /></a></li>
                   
                 <li class="slick-slide" style="width: 450px; height: 400px;"><a><img src="<%=request.getContextPath()%>/images/best2.png" style="width: 350px; height: 400px;" alt="배너이미지2" /></a></li>
                   
                 <li class="slick-slide" style="width: 450px; height: 400px;"><a><img src="<%=request.getContextPath()%>/images/best3.png" style="width: 350px; height: 400px;" alt="배너이미지2" /></a></li>
                   
                 <li class="slick-slide" style="width: 450px; height: 400px;"><a><img src="<%=request.getContextPath()%>/images/best4.png" style="width: 350px; height: 400px;" alt="배너이미지2" /></a></li>
				 
				 <li class="slick-slide" style="width: 450px; height: 400px;"><a><img src="<%=request.getContextPath()%>/images/best5.png" style="width: 350px; height: 400px;" alt="배너이미지2" /></a></li>
            </ul>
    </div>

</div>







<div class="promotion_3" style="height:650px !important;">

	<h3 class="title" style="padding: 100px 0 50px 0; font-weight: bold; font-size: 30pt;">추천강의</h3>

<div id="recommend">
	<div class="cosContainer">
	  <img src="<%=request.getContextPath()%>/images/cos1.png" style="width: 350px; height: 250px;" alt="Avatar" class="cosImage">
	  <a href="#"><div class="overlay">
	    <div class="text"><h3>ADsP(데이터분석 준전문가)</h3>기간 60일<br><h5>109,000원</h5><h4>=> 할인가 69,000원</h4></div>
	  </div></a>
	</div>
	
	<div class="cosContainer">
	  <img src="<%=request.getContextPath()%>/images/cos2.png" style="width: 350px; height: 250px;" alt="Avatar" class="cosImage">
	  <a href="#"><div class="overlay">
	    <div class="text"><h3>정보처리기사 필기</h3>기간 90일<br><h5>130,000원</h5><h4>=> 할인가 79,000원</h4></div>
	  </div></a>
	</div>
	
	<div class="cosContainer">
	  <img src="<%=request.getContextPath()%>/images/cos3.png" style="width: 350px; height: 250px;" alt="Avatar" class="cosImage">
	  <a href="#"><div class="overlay">
	    <div class="text"><h3>빅데이터분석기사 필기 단기반</h3>기간 90일<br><h5>209,000원</h5><h4>=> 할인가 109,000원</h4></div>
	  </div></a>
	</div>
	
	<div class="cosContainer">
	  <img src="<%=request.getContextPath()%>/images/cos4.png" style="width: 350px; height: 250px;" alt="Avatar" class="cosImage">
	  <a href="#"><div class="overlay">
	    <div class="text"><h3>SQLD</h3>기간 60일<br><h5>99,000원</h5><h4>=> 할인가 60,000원</h4></div>
	  </div></a>
	</div>
	
</div>	
</div>



<div class="banner_3">
	<a href="#"><img src="<%=request.getContextPath()%>/images/banner3.png" style="width: 1230px; height: 260px;" alt="배너이미지3" /></a>
</div>

<div class="academy" style="height:650px !important;">
    <div class="academy_bg grayBox"></div>
    <div class="w1230 compad" style="width: 100%;">

        <div class="video_cont"><a href="javascript:OpenWindow('/template/viewer.jsp?id=606&lid=309117', '_SP001', '1280', '800');"><img src="<%=request.getContextPath()%>/images/bug.jpg" alt="배너이미지" /></a></div>
      
        <div class="text_cont">
            <h3><font color=#1bceb8>쉽고 재밌게 배우는 IT 상식!</font color></h3><br>
            
            <p class="stxt" >
                <font size="5">IT가 아직 어렵고 낯설다면,<br /><br />잇돌이가 도와줄게요!</font size>
            </p>
            
            <a href="https://www.youtube.com/watch?v=ZOr_DVqcSj8" class="bgColor" target="_blank" style="margin: 50px 0;">잇돌이 만나러가기</a>
        </div>
    </div>
</div>

<div style="background-color: #ffffff !important;">
<div id="calendar-144" class="w1230 compad">
    <h3 class="title">이 달의 일정<a href="/course/course_schedule.jsp">더보기</a></h3>

    <div class="planWrap">
        <div class="calendar">
            <h3>2023. 4</h3>
            <table>
                <thead>
                <tr>
                    <th class="red">일</th>
                    <th>월</th>
                    <th>화</th>
                    <th>수</th>
                    <th>목</th>
                    <th>금</th>
                    <th class="blue">토</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="gray">26</td>  
                    <td class="gray">27</td>
                    <td class="gray">28</td>                                                  
                    <td class="gray">29</td>                       
                    <td class="gray">30</td>
                    <td class="gray">31</td>                                         
                    <td class="blue">1</td>                          
                </tr>
                
                <tr>                       
                    <td class="red">2</td>                                   
                    <td>3</td>                         
                    <td>4</td>           
                    <td>5</td>                      
                    <td>6</td>        
                    <td>7</td>              
                    <td class="blue">
                    	<a href="javascript:scrollSchedule('8');">8<i class="bgColor"></i></a>   
                    </td>  
                </tr>
                
                <tr>
                    <td class="red">9</td>
                    <td>10</td>
                    <td>11</td>
                    <td>12</td> 
                    <td class="grayBox">13</td>
                    <td>14</td>       
                    <td class="blue">15</td>
                </tr>
                
                <tr>
                    <td class="red">16</td>
                    <td>
                    	<a href="javascript:scrollSchedule('17');">17<i class="bgColor"></i></a>
                    </td>
                    <td>18</td>
                    <td>19</td>
                    <td>20</td>
                    <td>21</td>
                    <td class="blue">
                    	<a href="javascript:scrollSchedule('22');">22<i class="bgColor"></i></a>
                    </td>
                </tr>
                
                <tr>
                    <td class="red">23</td>
                    <td>24</td>
                    <td>25</td>
                    <td>26</td>
                    <td>27</td>
                    <td>28</td>
                    <td class="blue">29</td>
                </tr>
                
                <tr>
                    <td class="red">30</td>
                    <td class="gray">1</td>
                    <td class="gray">2</td>
                    <td class="gray">3</td>
                    <td class="gray">4</td>
                    <td class="gray">5</td>
                    <td class="gray">6</td>
                </tr>
                
                </tbody>
            </table>
        </div>
        <div class="schedule" style="overflow-y:scroll;">
            
            <dl id="schedule-20230408-985" class="day_cont grayBox" _day="8">
                <a href="/course/course_schedule.jsp" target="_blank">
                    <dt>
                        2023-04
                        <b>08(토)</b>
                    </dt>
                    <dd>    
                        <span>
                            09:00 ~
                            
                            16:59
                        </span>
                        
                        
                        <h4>빅데이터 분석기사 필기시험 시행</h4>
                    </dd>
                </a>
            </dl>
            
            <dl id="schedule-20230408-986" class="day_cont " _day="8">
                <a href="/course/course_schedule.jsp" target="_blank">
                    <dt>
                        2023-04
                        <b>08(토)</b>
                    </dt>
                    <dd>
                        
                        <span>
                            2023-04-08 ~
                            
                            
                            2023-04-12
                        </span>
                        
                        
                        <h4>기능사 제2회 필기시험 시행</h4>
                    </dd>
                </a>
            </dl>
            
            <dl id="schedule-20230417-987" class="day_cont grayBox" _day="17">
                <a href="/course/course_schedule.jsp" target="_blank">
                    <dt>
                        2023-04
                        <b>17(월)</b>
                    </dt>
                    <dd>
                        
                        <span>
                            2023-04-17 ~
                            
                            
                            2023-04-20
                        </span>
                        
                        
                        <h4>기사 & 산업기사 제2회 필기시험 접수</h4>
                    </dd>
                </a>
            </dl>
            
            <dl id="schedule-20230417-988" class="day_cont grayBox" _day="17">
                <a href="/course/course_schedule.jsp" target="_blank">

                    <dt>
                        2023-04
                        <b>17(월)</b>
                    </dt>
                    <dd>
                        
                        <span>
                            2023-04-17 ~
                            
                            
                            2023-04-21
                        </span>
                        
                        
                        <h4>데이터분석 준전문가(ADsP) 제 37회 시험접수</h4>
                    </dd>
                </a>
            </dl>
            
            <dl id="schedule-20230422-989" class="day_cont grayBox" _day="22">
                <a href="/course/course_schedule.jsp" target="_blank">
                    <dt>
                        2023-04
                        <b>22(토)</b>
                    </dt>
                    <dd>

                        <h4>기사 & 산업기사 실기시험 시행</h4>
                    </dd>
                </a>
            </dl>
            
            
        </div>
    </div>
</div>
</div>

<script>
<%-- Schedule --%>
	var heights = {};
	var hsum = 0;
	$(document).ready(function() {
	    $("#calendar-144 .day_cont").each(function(i) {
	        var h = $(this).outerHeight();
	        var d = $(this).attr("_day");
	        heights[d] = hsum;
	        hsum += h;
	    });
	
	    $("#calendar-144 .schedule").mCustomScrollbar({
	        axis:"y"
	    });
	    scrollSchedule("17");
	});
	
	function scrollSchedule(d) {
	    $("#calendar-144 .schedule").mCustomScrollbar("scrollTo", heights[d]);
	}
</script>



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
</body>

<jsp:include page="footer.jsp" />
