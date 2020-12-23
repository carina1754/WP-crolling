<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<style>
#login_wrapper{
	padding: 5px;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 300px; height: 200px;
	margin-left: -145px;
	margin-top: -95px;
}
</style>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
</head>
<body>
<div id="login_wrapper">
<form method="post" action="loginAction.jsp">
 		<h2>코로나 확진자 추계</h2>
		<div class="form-group">
  <label class="col-form-label col-form-label-lg" for="inputLarge">아이디</label>
  <input class="form-control form-control-lg" type="text" placeholder="ID" name="id">
</div>
<div class="form-group">
  <label class="col-form-label col-form-label-lg" for="inputLarge">비밀번호</label>
  <input class="form-control form-control-lg" type="text" placeholder="Password" name="pw">
</div>
<div class="form-group">
<button type="submit" class="btn btn-info btn-lg btn-block">로그인</button>
</div>
</form>
<div class="form-group">
<button type="button" class="btn btn-info btn-lg btn-block" onclick="location.href='register.jsp'">회원가입</button>
</div>
</div>
</body>
</html>