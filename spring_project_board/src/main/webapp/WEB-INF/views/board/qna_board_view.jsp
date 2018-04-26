<%@page import="com.spring.spring_project_board_vo.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>

<%
	BoardBean article = (BoardBean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>부트스트랩 101 템플릿</title>
    <!-- 부트스트랩 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
 .divCenter{
 	float : none;
 	margin : 0 auto;
 }
 #modifyDiv{
 	width:400px;
 	height: 150px;
 	background-color: #DAD9FF;
 	position: absolute;
 	top: 20%;
 	left: 30%;
 	padding:20px;
 	z-index: 100; 
 }
</style>

  </head>
<body>

<div id="modifyDiv" style="display:none;">
	<div class="title-dialog"></div>
	<div>
		수정내용 :<br/>
		<input type="text" id="mContent" size="40">
	</div>

	<div align ="center">
		<button type="button" id=reModifyBtn>수정</button>
		<button type="button" id=reDelBtn>삭제</button>
		<button type="button" id=closeBtn>닫기</button>
	</div>
</div>



	<!-- 게시판 수정 -->
	<div class="well divCenter row col-md-9">
		<h2>글 내용 상세보기</h2>
		
		<div class="panel panel-info">
			<div class="panel-heading">제 목 :
			<%=article.getBOARD_SUBJECT()%>
			<%if(!(article.getBOARD_FILE()==null)){ %>
			첨부파일 :<a href="file_down?downFile=<%=article.getBOARD_FILE()%>"> <%=article.getBOARD_FILE() %>
			</a>
			<%} %>
			</div>
		</div>
		<div class="panel-body">
			<div class="form-group">
			<textarea class="form-control" rows="20" cols="140" readonly><%=article.getBOARD_CONTENT() %></textarea>
			</div>	
		</div>
		<ul id="test">
		
		</ul>
		
		<ul class ="pageNumList">
		</ul>	
		<div>
			작성자 : <input type="text" name="replyer" id="reWriter" class="form-control" >
		</div>
		
		<div>
			댓글 : <input type="text" name="replyContent" id="reContent" class="form-control" >
			
			<button id="submitBtn" class="btn btn-primary">댓글 작성</button>
		</div>
		
		<br>
		<a href="boardReplyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>">
			<button type="button" class="btn btn-primary"> 답 변</button></a>
			
		<a href="boardModifyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>">
			<button type="button" class="btn btn-primary"> 수 정 </button></a> 
		<a href="boardDeleteForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>">
			<button type="button" class="btn btn-danger"> 삭 제 </button></a> 
		<a href="home.bo?page=<%=nowPage%>#contact">
			<button type="button" class="btn btn-warning">목 록</button></a>
	</div>
	
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
<script type="text/javascript">
var board_num=<%=article.getBOARD_NUM() %>;
//reListAll();
getPageNum(1);
function reListAll(){
$.getJSON("/spring_project_board/restfulTest/selectAll/"+board_num,function(data){
	var str ="";
	$(data).each(function(){
		str+="<li data-re_num='"+this.re_NUM+"' class='reList'>"+this.re_NUM+"|"+this.replycontent+"<button>수정</button>"+"</li>";
	});
	$("#test").html(str);
});
}

function getPageNum(page){
	$.getJSON("/spring_project_board/restfulTest/"+board_num+"/"+page, function(data){
		var str ="";
		$(data.reList).each(function(){
			str+="<li data-re_num='"+this.re_NUM+"' class='reList'>"+this.re_NUM+"|"+this.replycontent+"<button>수정</button>"+"</li>";
		});
		$("#test").html(str);
		
		showPageNum(data.pagingMaker);
	});
}

//페이지 번호 처리
function showPageNum(pagingMaker){
	var str = "";
	
	if(pagingMaker.prev){
		str+="<li><a href='"+(pagingMaker.startPage-1)+"'>◀</a></li>";
	}
	
	for(i=pagingMaker.startPage, end=pagingMaker.endPage; i<=end; i++){
		str+="<a href='"+i+"'><button type='buntton'>"+i+"</button></a>";
	}
	
	if(pagingMaker.next){
		str+="<li><a href='"+(pagingMaker.endPage+1)+"'>▶</a></li>";
	}
	$(".pageNumList").html(str);
}

var rePage =1;
$(".pageNumList").on("click","a button", function(e){
	e.preventDefault();//<a> 태그의 화면전환 일어나지 않도록 해주는 이벤트 처리
	
	rePage =$(this).parent().attr("href");
	
	getPageNum(rePage);
});

//다이얼로그 띄우기
$("#test").on("click",".reList button",function(){
	var selectli = $(this).parent();
	var re_num =selectli.attr("data-re_num");
	var reContent =selectli.text();
	
	$(".title-dialog").html(re_num);
	$("#mContent").val(reContent);
	$("#modifyDiv").show("slow");
}); 



//등록처리
    $("#submitBtn").on("click", function(){
    	var reWriter = $("#reWriter").val();
    	var reContent =$("#reContent").val();
    	
    	$.ajax({
    		type : "post",
    		url : "/spring_project_board/restfulTest",
    		headers :{
    			"Content-Type" : "application/json",
    			"X-HTTP-Method-Override" : "post"
    		},
    		
    		dataType : 'text',
    		data : JSON.stringify({
    					board_NUM : board_num,
    					replyer : reWriter,
    					replycontent : reContent
    				}),
    				
    				success : function(result){
    					if(result == 'Success'){
    						getPageNum(rePage);
    					}
    				}
    	});
    });
  

	//삭제처리
	$("#reDelBtn").on("click", function(){
		var re_num = $(".title-dialog").html();
		
		$.ajax({
			type : "delete",
			url : "/spring_project_board/restfulTest/"+re_num,
    		headers :{
    			"Content-Type" : "application/json",
    			"X-HTTP-Method-Override" : "delete"
			},
			dataType : 'text',
    		data : JSON.stringify({
    					re_NUM : re_num,
    				}),
    				
    				success : function(result){
    					if(result == 'Success'){
    						$("#modifyDiv").hide("slow");
    						getPageNum(rePage);
    					}
    				}
		});
	});
	
	//수정처리
	$("#reModifyBtn").on("click", function(){
		var re_num = $(".title-dialog").html();
		var reContent = $("#mContent").val();
		
		$.ajax({
			type : "put",
			url : "/spring_project_board/restfulTest/"+re_num,
    		headers :{
    			"Content-Type" : "application/json",
    			"X-HTTP-Method-Override" : "PUT"
			},
			dataType : 'text',
    		data : JSON.stringify({
    					replycontent : reContent
    				}),
    				
    				success : function(result){
    					console.log("result:"+result);
    					if(result == 'Success'){
    						alert("수정 성공");
    						$("#modifyDiv").hide("slow");
    						getPageNum(rePage);
    					}
    				}
		});
	});
	
	//닫기버튼
	$("#closeBtn").on("click", function(){
		
    $("#modifyDiv").hide("slow");

	});
	
</script>
  </body>
</html>