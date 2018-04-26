<%@ page import="com.spring.project_vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	BoardVO selectedArticle = (BoardVO)request.getAttribute("selectedArticle");
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
</style>

</head>
<body>
<form>
  <div class="form-group  divCenter row col-md-3" >
 
		<label class="form-control">글 비밀번호 : <%=selectedArticle.getBOARD_NUM() %></label>

		<input id="inputPass" name="BOARD_PASS" type="password" class="form-control">

		<button id="delBtn" type="button" class="btn btn-warning">삭 제</button>
		<button class="btn btn-primary" type = "button"  onClick ="javascript:history.go(-1)">돌아가기</button>

</div>
</form>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script type="text/javascript">


//삭제처리
	$("#delBtn").on("click", function(){
		var board_num = <%=selectedArticle.getBOARD_NUM()%>
		var inputPass = $("#inputPass").val(); 
		$.ajax({
			type : "delete",
			url : "/project/board/delete/"+board_num+"/"+inputPass,
    		headers :{
    			"Content-Type" : "application/json",
    			"X-HTTP-Method-Override" : "delete"
			},
			dataType : 'text',
    		data : JSON.stringify({
    					board_NUM : board_num,
    					board_PASS : inputPass,
    				}),
    				
    				success : function(result){
    					if(result == 'Success'){
    						alert("삭제 성공!!");
    						location.href="/project/home"; 
    					}
    					else{
    						alert("비밀번호를 다시 확인하세요!!");
    					}
    				}
		});
	});
</script>

</body>
</html>