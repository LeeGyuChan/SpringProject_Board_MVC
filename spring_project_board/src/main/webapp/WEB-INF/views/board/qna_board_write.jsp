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
					<input type="text" class="form-control"  name="BOARD_NAME" id="BOARD_NAME" value=<%=session.getAttribute("id") %> readonly  />
				
					<label for="BOARD_PASS">비밀번호</label>
					<input class="form-control" name="BOARD_PASS" type="password" id="BOARD_PASS" required="required" />

					<label for="BOARD_SUBJECT">제 목</label>
					<input class="form-control" name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" required="required" />

					<label for="BOARD_CONTENT">내 용</label>
					<textarea class="form-control" id="BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15" required="required"></textarea>
					<label for="BOARD_FILE"> 파일 첨부 </label>
					<input class="form-control" name="BOARD_FILE" type="file" id="BOARD_FILE"/>

	
			<section id="commandCell">
				<input type="submit" class="btn btn-primary" value="등록">&nbsp;&nbsp;
				<input type="reset" class="btn btn-info" value="다시쓰기" />
			</section>
		</div> 
		</form>
	</section>
	<!-- 게시판 등록 -->

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>