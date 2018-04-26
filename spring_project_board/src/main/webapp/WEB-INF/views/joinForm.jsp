<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
</style>
  </head>
<body>
<section id = "joinformArea">
<form name="joinform" action="memberJoinPro.bo" method="post">

		<div class=" form-group row col-md-7 divCenter" >
			<h1>회원가입 페이지</h1>
		<label for = "MEMBER_ID">아이디 : </label>
		<input class="form-control" type="text" name="MEMBER_ID" id = "MEMBER_ID"/>

		<label for = "MEMBER_PW">비밀번호 : </label>
		<input class="form-control" type="password" name="MEMBER_PW" id = "MEMBER_PW"/>
	
		<label for = "MEMBER_NAME">이름 : </label>
		<input class="form-control" type="text" name="MEMBER_NAME" id = "MEMBER_NAME"/>
	
		<label for = "MEMBER_AGE">나이 : </label>
		<input class="form-control" type="text" name="MEMBER_AGE" maxlength="2" id = "MEMBER_AGE"/>
	
		<label for = "MEMBER_GENDER">성별 : </label>
			<input  type="radio" name="MEMBER_GENDER" value="남" checked="checked" id = "MEMBER_GENDER"/>남자
			<input  type="radio" name="MEMBER_GENDER" value="여"/>여자<br>
		<label for = "MEMBER_EMAIL">이메일 주소 : </label>
		<input class="form-control" type="text" name="MEMBER_EMAIL" id = "MEMBER_EMAIL"/><br>
			<a href="javascript:joinform.submit()"  class="btn btn-primary">회원가입</a>&nbsp;&nbsp;
			<a href="javascript:joinform.reset()"  class="btn btn-primary">다시작성</a>
		</div>
</form>
</section>
</body>
</html>