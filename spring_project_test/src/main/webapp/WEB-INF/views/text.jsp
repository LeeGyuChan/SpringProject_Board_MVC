<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

</head>
<body>
<h3>REST + AjaxTest</h3>

<ul id="test">
		
		</ul>	
		<div>
			작성자 : <input type="text" name="replyer" id="reWriter" class="form-control" >
		</div>
		
		<div>
			댓글 : <input type="text" name="replyContent" id="reContent" class="form-control" >
			
			<button id="submitBtn" class="btn btn-primary">댓글 작성</button>
		</div>
		
<script type="text/javascript">

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
	$.getJSON("/project_1/"+page, function(data){
		var str ="";
		$(data.reList).each(function(){
			str+="<li data-re_num='"+this.re_NUM+"' class='reList'>"+this.re_NUM+"|"+this.replycontent+"<button>수정</button>"+"</li>";
		});
		$("#test").html(str);
		
		showPageNum(data.pagingMaker);
	});
}
</script>
</body>
</html>