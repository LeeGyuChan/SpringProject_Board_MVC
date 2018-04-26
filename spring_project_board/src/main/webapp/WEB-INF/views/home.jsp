<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	session=request.getSession();
		String member_id = (String)request.getAttribute("MEMBER_ID");

    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Bootstrap Theme Company Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style> 
 #wrapper { display: table; }
 #cell { display: table-cell; vertical-align: middle; }
 
.img {
    max-width: 100%;
    height: 250px;
}
 </style>


</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      
      <a class="navbar-brand" href="#myPage">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#about">ABOUT</a></li>
        <li><a href="#services">SERVICES</a></li>
        <li><a href="#portfolio">PORTFOLIO</a></li>
        <li><a href="#pricing">PRICING</a></li>
        <li><a href="#contact">CONTACT</a></li>
        <li>
				  <!-- Trigger the modal with a button -->
				  <%if(session.getAttribute("id")!=null) {%>
				  <button type="button" class="btn btn-success" id="myBtn">로그아웃</button>
				    
				   <!-- Modal -->
					  <div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">Modal Header</h4>
					        </div>
					        <div class="modal-body">
					          <h3>정말 로그아웃 하시겠습니까?</h3>
					        </div>
					        <div class="modal-footer">
					          <form name ="logoutModal" action="logout.bo" method="post">
					          <input type="hidden" name="Session" value="<%=session%>">
					            <button type="submit" class="btn btn-default" >O K</button>
					          </form>				       
					      </div>				      
					    </div>
					  </div>					  
					</div>

				    
				    
				  <%} else{%>
				<button type="button" class="btn btn-success" id="myBtn">Login</button>
				<%} %>
				  <!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header" style="padding:35px 50px;">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
				        </div>
				        <div class="modal-body" style="padding:40px 50px;">
				          <form role="form" name ="loginModal" action="login.bo" method="post">
				            <div class="form-group">
				              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
				              <input name="MEMBER_ID" type="text" class="form-control" id="usrname" placeholder="Enter email">
				            </div>
				            <div class="form-group">
				              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
				              <input name="MEMBER_PW" type="password" class="form-control" id="psw" placeholder="Enter password">
				            </div>
				              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
				          </form>
				        </div>
				        <div class="modal-footer">
				          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
				          <p>Not a member? <a href=memberJoinForm.bo><button  class="btn btn-primary">Sign Up</button></a></p>
				        </div>
				      </div>
				      
				    </div>
				  </div>    
        </li>
      </ul>
    </div>
  </div>
  

</nav>
<div class="jumbotron text-center">
  <h1>WelCome! Company</h1>
   <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
      
        <h4>"This company is the best. I am so happy with the result!"<br><span>Michael Roe, Vice President, Comment Box</span></h4>
      </div>
      <div class="item">
        <h4>"One word... WOW!!"<br><span>John Doe, Salesman, Rep Inc</span></h4>
      </div>
      <div class="item">
        <h4>"Could I... BE any more happy with this company?"<br><span>Chandler Bing, Actor, FriendsAlot</span></h4>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div> 
</div>

<!-- Container (About Section) -->
<div id="about" class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
      <h2>Check Catch</h2><br>
      <h4 class="textbg"><p><strong>INFO : </strong>Check Catch는 무료 배포 POS프로그램 입니다.</p></h4><br>
      <p><strong> VISION :</strong>“Check Catch” 어플리케이션은 해당 지역의 외식산업 및 오픈마켓 그리고 각종 행사의 기획을 발전시키는 동력이 됩니다. 1차 고객인 음식점의 점주들은 지속적인 고객의 유입과, 빠른 테이블 회전, 
      그리고 생생한 피드백을 통해 매출의 증가와 함께 점점 더 향상된 서비스를 제공할 수 있을 것입니다. 2차 고객인 어플리케이션 이용자들은 음식을 기다리는데 의미 없이 시간을 쏟지 않으며, 
      생생한 후기를 통해 맛있는 가게를 찾을 수 있고 음식점에서 제공하는 더욱 향상된 서비스를 누릴 수 있습니다.<br>자세한 사항은 게시판을 통하여 문의하시길 바랍니다.(게시판은 로그인 후 작성이 가능합니다.)</p>
      <br><a href=memberJoinForm.bo><button class="btn btn-default btn-lg">가입 Click!!</button></a>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-user logo"></span>
    </div>
  </div>
</div>

<div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-globe logo slideanim"></span>
    </div>
    <div class="col-sm-8">
      <h2>Our Values</h2><br>
      <h4 class="textbg"><strong>MISSION:</strong>오픈마켓이나 축제 내 짧은 기간 야외에서 운영되는 주점 및 행사 대상으로 하여  주문과 매출 관리를 PC를 이용해 효율적으로 관리할 수 있는 프로그램을 개발하였습니다.</h4><br>
      <p><strong>VISION:</strong>  프로그램을 통해 주점 내 테이블 회전의 효율을 증대시키고 사용자 중심인 UI를 제공하여 직관적으로 계산처리가 가능하게 될 것이며, 이는 단순히 대학 내 축제 주점을 대상으로만 한정되는 것이 아니라 테이블 회전이 빠른 매장이나 소자본 창업자 대상으로도 지원을 하여 금전적인 부담감을 줄이는 것은 물론 이러한 점에서 볼 때 대학교 주점 계산 프로그램은 매장에서만 봤던 POS (point of sales) 프로그램이 교내 주점에서 간단한 설치만으로 특성에 맞는 프로그램을 이용이 가능하게 됩니다. 이는 결국 대학교 축제기간 내 주점의 계산방식에 있어서 큰 기여를 할 것입니다. 
 또한 이 프로그램은 대학교 내 축제기간에 한정 될 것이 아니라 오픈 마켓이나 각종 다양한 행사에 있어서 사업자(간이 사업자) 신고를 통한 판매가 아닌 경우에도 별도의 가입, 신청 및 장비가 필요 없이 POS 프로그램을 이용할 수 있습니다.
      </p>
    </div>
  </div>
</div>

<!-- Container (Services Section) -->
<div id="services" class="container-fluid text-center" >
  <h2>개발 기술 보유 능력</h2>
  <br>

  <div class="row slideanim">
    <div class="col-sm-4">
       	<img src="eclipse.png" class="img-rounded img-responsive center-block" >
      <h4>개발 툴</h4>
      <p>개발은 Java 기반으로 이클립스로 작업.</p>
    </div>
    <div class="col-sm-4">
      	<img src="MySQL.png" class="img-rounded img-responsive center-block" >
      <h4>데이터베이스</h4>
      <p>MySQL 5.1.29</p>
    </div>
    <div class="col-sm-4">
     	<img src="bootstrap.png" class="img-rounded img-responsive center-block" >
      <p>부트스트랩 </p>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <img src="spring-by-pivotal.png" class="img-rounded img-responsive center-block" >
      <h4>프레임워크</h4>
      <p>해당 웹페이지는 스프링 프레임워크 기반 MVC2모델.</p>
    </div>
    <div class="col-sm-4">
      <img src="jsp.png" class="img-rounded img-responsive center-block" >
      <p></p>
    </div>
    <div class="col-sm-4">
      <img src="javaFx.png" class="img-rounded img-responsive center-block" >
      <h4 style="color:#303030;">JAVA</h4>
      <p>소프트웨어 개발 UI : javaFx</p>
    </div>
  </div>
</div>

<!-- Container (Portfolio Section) -->
<div id="portfolio" class="container-fluid text-center bg-grey">
  <h2>Portfolio</h2><br>
  <h4>What we have created</h4>
  <div class="row text-center slideanim">
    <div class="col-sm-4">
      <div class="thumbnail img" >
        <img src="this_is_java.PNG" alt="Paris" width="400" height="300" style="size">
        <p><strong>수상 경력 : 대상</strong></p>
        <p>POS Program : Check Catch</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail img">
        <img src="posImg.png" alt="New York" width="400" height="300">
        <p><strong>Check Catch</strong></p>
        <p>직관적인 UI를 제공합니다.</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail img">
        <img src="webImg.PNG" alt="San Francisco" width="400" height="300">
        <p><strong>Web Site</strong></p>
        <p>MVC2모델 웹사이트</p>
      </div>
    </div>
  </div><br>

 
</div>

<!-- Container (Pricing Section) -->
<div id="pricing" class="container-fluid">
  <div class="text-center">
    <h2>Pricing</h2>
    <h4>Choose a payment plan that works for you</h4>
  </div>
  <div class="row slideanim">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Basic</h1>
        </div>
        <div class="panel-body" style="height:200px;   background-image:url(appImg2.png);
  	  background-size: cover;">
        </div>
        <div class="panel-footer">
         <p><strong>표준형</strong></p>
          <h3>$17</h3>
          <h4>per month</h4>

        </div>
      </div>      
    </div>       
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Pro</h1>
        </div>
        <div class="panel-body" style="height:200px;   background-image:url(appImg1.png);
  	  background-size: cover;">
        </div>
        <div class="panel-footer">
        <p><strong>표준형 + 서버백업</strong></p>
          <h3>$29</h3>
          <h4>per month</h4>
        </div>
      </div>      
    </div>       
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Premium</h1>
        </div>
        <div class="panel-body" style="height:200px;   background-image:url(appImg3.png);
  	  background-size: cover;">
      		<p><strong>상품 준비중입니다.</strong></p>
        </div>
        <div class="panel-footer">
        <p><strong>100</strong> 표준형 + 서버 백업 + 반응형 웹</p>
          <h3>$49</h3>
          <h4>per month</h4>

        </div>
      </div>      
    </div>    
  </div>
</div>

  
  
  <!-- Container (Contact Section) -->
<div id="contact" class="container-fluid bg-grey">
<div class="container">
</div>
  <div class="row">
    <div class="col-sm-5">
      <p>Contact us and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Chicago, US</p>
      <p><span class="glyphicon glyphicon-phone"></span> +00 1515151515</p>
      <p><span class="glyphicon glyphicon-envelope"></span> myemail@something.com</p>
    </div>
    <div class="col-sm-7 slideanim">
      <div class="row">
		  <jsp:include page="board/qna_board_list.jsp"></jsp:include>
 	</div>
    </div>
  </div>
</div>
<!-- Add Google Maps -->
<div id="googleMap" style="height:400px;width:100%;"></div>
<script>
function myMap() {
var myCenter = new google.maps.LatLng(37.482627, 126.928510);
var mapProp = {center:myCenter, zoom:12, scrollwheel:false, draggable:false, mapTypeId:google.maps.MapTypeId.ROADMAP};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
var marker = new google.maps.Marker({position:myCenter});
marker.setMap(map);
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCdWk0n2XR8MaMAhS37yeFNpbO9QZaH9vE&callback=myMap"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->





<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>Bootstrap Theme Made By <a href="https://www.w3schools.com" title="Visit w3schools">www.w3schools.com</a></p>
</footer>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
    
<script>


$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal({backdrop: false});

    });

	
});


$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})


</script>
</body>
</html>
