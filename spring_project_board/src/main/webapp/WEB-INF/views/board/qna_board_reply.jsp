<%@page import="com.spring.spring_project_board_vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	BoardBean article=(BoardBean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
    
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
<script language="javascript">
	</script>

<style>
 .divCenter{
 	float : none;
 	margin : 0 auto;
 }
</style>

</head>
<body>
	<!-- 게시판 답변 -->

	<div class=" form-group row col-md-7 divCenter" >
	<section id="writeForm">
		<h2>게시판글등록</h2>
		<form action="boardReplyPro.bo" method="post" name="boardform">
			<input type="hidden" name="page" value="<%=nowPage %>" /> <input
				type="hidden" name="BOARD_NUM" value="<%=article.getBOARD_NUM() %>">
			<input type="hidden" name="BOARD_RE_REF"
				value="<%=article.getBOARD_RE_REF() %>"> <input
				type="hidden" name="BOARD_RE_LEV"
				value="<%=article.getBOARD_RE_LEV() %>"> <input
				type="hidden" name="BOARD_RE_SEQ"
				value="<%=article.getBOARD_RE_SEQ() %>">
		
		
			<label for="BOARD_NAME">글쓴이</label>
			<input class="form-control" type="text" name="BOARD_NAME" id="BOARD_NAME" value="<%= session.getAttribute("id") %>" readonly/>
			
			<label for="BOARD_PASS">비밀번호</label>
			<input class="form-control" name="BOARD_PASS" type="password" id="BOARD_PASS" />
			
			<label for="BOARD_SUBJECT">제 목</label>
			<input class="form-control" name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" />
			
			<label for="BOARD_CONTENT">내 용</label>
			<textarea class="form-control" id="BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15"></textarea>
			
			<section id="commandCell">
				<input class="btn btn-primary" type="submit" value="답변글 등록" />&nbsp;&nbsp; 
				<input class="btn btn-warning" type="reset" value="다시작성" />
			</section>
			
		</form>
	</section>
	</div>
</body>
</html>