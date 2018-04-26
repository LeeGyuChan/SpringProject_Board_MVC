<%@page import="com.spring.project_vo.*"%>
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

<meta charset="UTF-8">
<title>MVC 게시판</title>


</head>
<body>
	<!-- 게시판 답변 -->

	<div class=" form-group row col-md-7 divCenter" >
	<section id="writeForm">
		<h2>게시판글등록</h2>
		<form action="boardAnswerPro" method="post" name="boardform">
			<input type="hidden" name="page" value="<%=findCriteria.getPage() %>" /> <input
				type="hidden" name="BOARD_NUM" value="<%=selectedArticle.getBOARD_NUM() %>">
			<input type="hidden" name="BOARD_RE_REF"
				value="<%=selectedArticle.getBOARD_RE_REF() %>"> <input
				type="hidden" name="BOARD_RE_LEV"
				value="<%=selectedArticle.getBOARD_RE_LEV() %>"> <input
				type="hidden" name="BOARD_RE_SEQ"
				value="<%=selectedArticle.getBOARD_RE_SEQ() %>">
		
		
			<label for="BOARD_NAME">글쓴이</label>
			<input class="form-control" type="text" name="BOARD_NAME" id="BOARD_NAME" value="익명테스트" readonly/>
			
			<label for="BOARD_PASS">비밀번호</label>
			<input class="form-control" name="BOARD_PASS" type="password" id="BOARD_PASS" />
			
			<label for="BOARD_SUBJECT">제 목</label>
			<input class="form-control" name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" />
			
			<label for="BOARD_CONTENT">내 용</label>
			<textarea class="form-control" id="BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15"></textarea>
			
			<section id="commandCell">
				<input class="btn btn-primary" type="submit" value="답변글 등록" />&nbsp;&nbsp; 
				<input class="btn btn-warning" type="reset" value="다시작성" />
				<a  class="btn btn-info" href="javascript:history.go(-1)">뒤 로</a>
			</section>
			
		</form>
	</section>
	</div>
</body>
</html>