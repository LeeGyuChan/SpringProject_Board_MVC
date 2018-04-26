<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="com.spring.project_vo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

 <% 
 	FindCriteria findCriteria = (FindCriteria)request.getAttribute("findCriteria");
 %>   
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>RESTful Board</title>
         
	<!-- 합쳐지고 최소화된 최신 CSS -->
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/myuse.css?ver=7">
<style>
 .divCenter{
 	float : none;
 	margin : 0 auto;
 }
 .tableDiv{
	height: 600px;
}
 </style>
 
</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50">
<nav class="navbar navbar-inverse navbar-fixed-top">
   <div class="container-fluid">
     <div class="navbar-header">
       <a class="navbar-brand" href="#">WebSiteName</a>
     </div>
     <ul class="nav navbar-nav">
       <li class="active"><a href="#section1">Section1</a></li>
       <li><a href="#section2">Section2</a></li>
       <li><a href="#section3">Section3</a></li>
     </ul>
      <%if(session.getAttribute("id")!=null) {%>
				  <button type="button" class="btn btn-danger navbar-btn" id="myBtn">로그아웃</button>
				    
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
				<button type="button" class="btn btn-danger navbar-btn" id="myBtn">Login</button>
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
   </div>
</nav> 
<div class="page-main">
<aside>
	<ul>
		<li><a href="http://localhost:8088/spring_project_board/home.bo">테스트 페이지</a></li>
	</ul>
	<button class="open"><img src="img/btn_open.png"></button>
</aside>
</div>
<div id="section1" class="slideshow">
    <div class="slideshow-slides">
        <a href="./" class="slide" id="slide-1"><img src="img/slide-1.jpg" alt="" width="1600" height="465"></a>
        <a href="./" class="slide" id="slide-2"><img src="img/slide-2.jpg" alt="" width="1600" height="465"></a>
        <a href="./" class="slide" id="slide-3"><img src="img/slide-3.jpg" alt="" width="1600" height="465"></a>
        <a href="./" class="slide" id="slide-4"><img src="img/slide-4.jpg" alt="" width="1600" height="465"></a>
    </div>
    <div class="slideshow-nav">
        <a href="#" class="prev">Prev</a>
        <a href="#" class="next">Next</a>
    </div>
    <div class="slideshow-indicator"></div>
</div>

<br><br><br><br>
<div id="services" class="container-fluid text-center" >
  <h2 style="background-color: #F6F6F6">Development Technology</h2>
  <br>

  <div class="row slideanim">
    <div class="col-sm-4">
       	<img src="img/eclipse.png" class="img-rounded img-responsive center-block" >
      <h4>개발 툴</h4>
      <p>개발은 Java 기반으로 이클립스로 작업.</p>
    </div>
    <div class="col-sm-4">
      	<img src="img/MySQL.png" class="img-rounded img-responsive center-block" >
      <h4>데이터베이스</h4>
      <p>MySQL 5.1.29</p>
    </div>
    <div class="col-sm-4">
     	<img src="img/bootstrap.png" class="img-rounded img-responsive center-block" >
      <p>부트스트랩 </p>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <img src="img/spring-by-pivotal.png" class="img-rounded img-responsive center-block" >
      <h4>프레임워크</h4>
      <p>해당 웹페이지는 스프링 프레임워크 기반 MVC2모델.</p>
    </div>
    <div class="col-sm-4">
      <img src="img/jsp.png" class="img-rounded img-responsive center-block" >
      <p></p>
    </div>
    <div class="col-sm-4">
      <img src="img/javaFx.png" class="img-rounded img-responsive center-block" >
      <h4 style="color:#303030;">JAVA</h4>
      <p>소프트웨어 개발 UI : javaFx</p>
    </div>
  </div>
</div>

<br><br><br><br>
<div id="section2">
<section class="work-section" id="work">

    <header class="section-header clearfix">
        <div class="inner">
            <h2>Pick up work</h2>
            <ul class="tabs-nav">
                <li><a href="#work01">Work 01</a></li>
                <li><a href="#work02">Work 02</a></li>
                <li><a href="#work03">Work 03</a></li>
                <li><a href="#work04">Work 04</a></li>
                <li><a href="#work05">Work 05</a></li>
            </ul>
        </div>
    </header>

    <div class="section-body">
        <section class="tabs-panel" id="work01">
            <div class="image-wrapper">
                <img src="./img/work-1.jpg" alt="" width="1600" height="400">
            </div>
            <div class="content">
                <div class="inner">
                    <h3 class="title">Work 01</h3>
                    <p class="description">まげすぎみんなは兎が青くなくからさっきの係りの箱げをすん第一窓顔のおねがいを考えると行っですた。野ねずみは前来て出します。扉は一いう首のようをついてきまし。</p>
                    <a class="read-more" href="./">Read more</a>
                </div>
            </div>
        </section>
        <section class="tabs-panel" id="work02">
            <div class="image-wrapper">
                <img src="./img/work-2.jpg" alt="" width="1600" height="400">
            </div>
            <div class="content">
                <div class="inner">
                    <h3 class="title">Work 02</h3>
                    <p class="description">まげすぎみんなは兎が青くなくからさっきの係りの箱げをすん第一窓顔のおねがいを考えると行っですた。野ねずみは前来て出します。扉は一いう首のようをついてきまし。</p>
                    <a class="read-more" href="./">Read more</a>
                </div>
            </div>
        </section>
        <section class="tabs-panel" id="work03">
            <div class="image-wrapper">
                <img src="./img/work-3.jpg" alt="" width="1600" height="400">
            </div>
            <div class="content">
                <div class="inner">
                    <h3 class="title">Work 03</h3>
                    <p class="description">まげすぎみんなは兎が青くなくからさっきの係りの箱げをすん第一窓顔のおねがいを考えると行っですた。野ねずみは前来て出します。扉は一いう首のようをついてきまし。</p>
                    <a class="read-more" href="./">Read more</a>
                </div>
            </div>
        </section>
        <section class="tabs-panel" id="work04">
            <div class="image-wrapper">
                <img src="./img/work-4.jpg" alt="" width="1600" height="400">
            </div>
            <div class="content">
                <div class="inner">
                    <h3 class="title">Work 04</h3>
                    <p class="description">まげすぎみんなは兎が青くなくからさっきの係りの箱げをすん第一窓顔のおねがいを考えると行っですた。野ねずみは前来て出します。扉は一いう首のようをついてきまし。</p>
                    <a class="read-more" href="./">Read more</a>
                </div>
            </div>
        </section>
        <section class="tabs-panel" id="work05">
            <div class="image-wrapper">
                <img src="./img/work-5.jpg" alt="" width="1600" height="400">
            </div>
            <div class="content">
                <div class="inner">
                    <h3 class="title">Work 05</h3>
                    <p class="description">まげすぎみんなは兎が青くなくからさっきの係りの箱げをすん第一窓顔のおねがいを考えると行っですた。野ねずみは前来て出します。扉は一いう首のようをついてきまし。</p>
                    <a class="read-more" href="./">Read more</a>
                </div>
            </div>
        </section>
    </div>

</section>
</div>
	

<div id="section3"class="row divCenter col-md-9">
<br><br><br><br>
<h1 style="background-color: #F6F6F6; text-align: center;">
	Live Search JSON Data Usong Ajax JQuery
</h1>
<br><br>
<div class="row">
	<div class="col-md-9 ">
		<div class="input-group">
			<span class="glyphicon glyphicon-search input-group-addon">검색</span>
		<input id ="search"type="text" class="form-control">
		</div>
	</div>
		<div class="col-md-1 col-md-offset-2">
			<button type="button" id="writeBtn" class="btn btn-primary" >글쓰기</button>
		</div>
</div>

<br>
<div class="tableDiv">
	<table class="table table-striped table-hover table-bordered">
	
				<tr id="tr_top" class="info">
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>조회수</td>
				</tr>
				
	</table>
	
	<ul class="pagination">
	</ul>
	</div>
	
</div>


 <!-- Container (Contact Section) -->

<div class="container">
<h1 style="background-color: #F6F6F6; text-align: center;">
	Contact
</h1>
<br>
<!-- Add Google Maps -->
<div id="googleMap" style="height:400px;width:100%;"></div>
</div>
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


<div>
<button type="button" class="back-to-top">
    <span class="label">페이지 위로 가기</span>
</button>
</div>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="js/main.js?ver=2"></script>
<script type="text/javascript">

$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal({backdrop: false});

    });
	
});

$("#search").val(<%=findCriteria.getKeyWord()%>);




$(document).ready(function() {
	getList(<%=findCriteria.getPage()%>);
});	
	
$("#search").keyup(function(){
	$(".table tr:not(:first)").remove();
		getList(<%=findCriteria.getPage()%>);
	});


$(document).ready(function() {
	$("#writeBtn").on("click",function(){
		location.href="/project/boardWriteForm";
	});
});



function getList(page){
	var str="";
	var jsonUrlStr="";
	var keyWord = $("#search").val();
	if(keyWord==""){
		jsonUrlStr="/project/board/All/"+page;
	}else{
		jsonUrlStr="/project/board/"+keyWord+"/"+page;
	}
	$.getJSON(jsonUrlStr, function(data){
		$(data.boardList).each(function(){
			if(this.board_REPLY_COUNT==0){
				this.board_REPLY_COUNT="";
			}
			var jsonDate = new Date(this.board_DATE);
			var dateFormat = jsonDate.toJSON().slice(0,10).split("-").join("-");
			if(this.board_RE_LEV==0){
			str+="<tr><td data-board_num='"+this.board_NUM+"'>"+this.board_NUM+"</td>"
			+"<td><a href=boardDetail?page="+page+"&board_num="+this.board_NUM+"&keyWord="+keyWord+">"
			+this.board_SUBJECT+"&nbsp;&nbsp;<span class='badge'>"+this.board_REPLY_COUNT+"</span></a></td>"
			+"<td>"+this.board_NAME+"</td>"
			+"<td>"+dateFormat+"</td>"
			+"<td>"+this.board_READCOUNT+"</td></tr>";
			}
			else{
				str+="<tr><td data-board_num='"+this.board_NUM+"'>"+this.board_NUM+"</td>"
				+"<td><a href=boardDetail?page="+page+"&board_num="+this.board_NUM+"&keyWord="+keyWord+">";
				for(i=0, end=this.board_RE_LEV*2; i<end; i++){
					str+="&nbsp;&nbsp;";
				}
					str+="▶"+this.board_SUBJECT+"&nbsp;&nbsp;<span class='badge'>"+this.board_REPLY_COUNT+"</span></a></td>"
						+"<td>"+this.board_NAME+"</td>"
						+"<td>"+dateFormat+"</td>"
						+"<td>"+this.board_READCOUNT+"</td></tr>";
			}
			
		});
		$(".table").append(str);
		
		showPageNum(data.pagingMaker);
	});
	
}


//페이지 번호 처리
function showPageNum(pagingMaker){
	var str = "";
	var keyWord = $("#search").val();
	if(pagingMaker.prev){
		str+="<li><a href='"+keyWord+"/"+(pagingMaker.startPage-1)+"'>◀</a></li>";
	}
	
	for(i=pagingMaker.startPage, end=pagingMaker.endPage; i<=end; i++){
		str+="<li><a href='"+keyWord+"/"+i+"' data-pageNum='"+i+"'>"+i+"</a></li>";
	}
	if(pagingMaker.next){
		str+="<li><a href='"+keyWord+"/"+(pagingMaker.endPage+1)+"'>▶</a></li>";
	}
	$(".pagination").html(str);
}
 
$(".pagination").on("click","a ", function(e){
	e.preventDefault();//<a> 태그의 화면전환 일어나지 않도록 해주는 이벤트 처리
	
	selectPage =$(this).attr("data-pageNum");
	
	$(".table tr:not(:first)").remove();
	getList(selectPage);
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
	});



</script>

</body>
</html>
