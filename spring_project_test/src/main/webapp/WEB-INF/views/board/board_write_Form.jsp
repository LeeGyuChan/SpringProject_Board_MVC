<%@ page language="java" contentType="text/html; charset=UTF-8"%>

    <%
    	session=request.getSession();
    %>
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>부트스트랩 101 템플릿</title>
    	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  </head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style>
 .divCenter{
 	float : none;
 	margin : 0 auto;
 }
</style>
</head>
<body>
	<!-- 게시판 등록 -->

	<section id="writeForm ">
		
		<form action="boardWritePro.bo" method="post" enctype="multipart/form-data"
			 name="boardform">
			
			<div class=" form-group row col-md-7 divCenter" >
				<h2> 게시판글등록</h2>
					<label for="BOARD_NAME">글쓴이</label>
					<input type="text" class="form-control"  name="BOARD_NAME" id="BOARD_NAME" value="익명테스트" readonly  />
				
					<label for="BOARD_PASS">비밀번호</label>
					<input class="form-control" name="BOARD_PASS" type="password" id="BOARD_PASS" required="required" />

					<label for="BOARD_SUBJECT">제 목</label>
					<input class="form-control" name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" required="required" />

					<label for="BOARD_CONTENT">내 용</label>
					<textarea class="form-control" id="BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15" required="required"></textarea>


	
			<section id="commandCell">
				<input type="submit" class="btn btn-primary" value="등록">&nbsp;&nbsp;
				<input type="reset" class="btn btn-info" value="다시쓰기" />
				<a  class="btn btn-info" href="javascript:history.go(-1)">뒤 로</a>
			</section>
		</div> 
		</form>
	</section>
	<!-- 게시판 등록 -->

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
  </body>
</html>