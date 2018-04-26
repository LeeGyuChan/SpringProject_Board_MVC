<%@page import="com.spring.project_vo.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>

<%
	FindCriteria findCriteria = (FindCriteria)request.getAttribute("findCriteria");
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>부트스트랩 101 템플릿</title>
  	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	<div class="panel panel-primary divCenter row col-md-9">
		<h2>글 내용 상세보기</h2>
		
			<div class="panel-heading">제 목 :${selectedArticle.BOARD_SUBJECT}</div>
		<div class="panel-body">
			<div class="form-group">
				<textarea class="form-control" rows="20" cols="100" readonly>${selectedArticle.BOARD_CONTENT}</textarea>
			</div>	
		</div>
		<div class="panel panel-success">
		<table id="reTable" class="table table-striped table-condensed  ">
			
				<tr id="tr_top" class="info">
					<td>리플 작성자</td>
					<td>리플 내용</td>
				</tr>
		</table>
		<ul id="test">
		
		</ul>

		<ul id ="pageNumList">
		</ul>
		</div>	
		<div class="row col-md-9 panel panel-success">
			 <div class="panel-heading">댓글달기</div>
			
			작성자  <input type="text" name="replyer" id="reWriter" class="form-control" >
			댓글  <input type="text" name="replyContent" id="reContent" class="form-control" >
			<br>
			<button id="submitBtn" class="btn btn-success">댓글 작성</button>
		</div>
		
		<div class="row col-md-9">
		<br>
		<a href="boardAnswerForm.?board_num=${selectedArticle.BOARD_NUM}&page=<%=findCriteria.getPage()%>">
			<button type="button" class="btn btn-primary"> 답 변</button></a>
		<a href="boardModifyForm?board_num=${selectedArticle.BOARD_NUM}&page=<%=findCriteria.getPage()%>">
			<button type="button" class="btn btn-primary"> 수 정 </button></a> 
		<a href="boardDelete?board_num=${selectedArticle.BOARD_NUM}&page=<%=findCriteria.getPage()%>">
			<button type="button" class="btn btn-danger"> 삭 제 </button></a> 
		<a href="home?page=<%=findCriteria.getPage() %>&keyWord='<%=findCriteria.getKeyWord()%>'">
			<button type="button" class="btn btn-warning">목 록</button></a>
		</div>
	</div>
		<br><br>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script type="text/javascript">
var board_num=${selectedArticle.BOARD_NUM};

getPageNum(1);

function getPageNum(page){
	$(".table tr:not(:first)").remove();
	$.getJSON("/project/reply/"+board_num+"/"+page, function(data){
		var str ="";
		$(data.reList).each(function(){
			str+="<tr><td data-re_num='"+this.re_NUM+"' class='reList'>"+this.replyer+"</td><td>"+this.replycontent+"</td></tr>";
		});
		$("#reTable").append(str);
		
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
	$("#pageNumList").html(str);
}

var rePage =1;
$("#pageNumList").on("click","a button", function(e){
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
    		url : "/project/reply",
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
			url : "/project/reply/"+re_num,
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
			url : "/project/reply/"+re_num,
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