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
var board_num=25;
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
    						alert("댓글 처리  성공")
    						reListAll();
    					}
    				}
    	});
    });
  
 
	function reListAll(){
	$.getJSON("/spring_project_board/restfulTest/selectAll/"+board_num,function(data){
		var str ="";
		$(data).each(function(){
			str+="<li>"+this.re_NUM+"|"+this.replycontent+"</li>"	;
		});
		$("#test").html(str);
	});
	}
</script>
</body>
</html>