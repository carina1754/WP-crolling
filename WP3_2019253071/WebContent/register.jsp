<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
</head>
<body>
<form method="post" action="registerAction.jsp">
  <fieldset>
    <legend>회원가입</legend>
    <div class="form-group">
      <label for="InputID">아이디</label>
      <input type="text" class="form-control" name="id" placeholder="ID">
    </div>
    <div class="form-group">
      <label for="InputPassword1">비밀번호</label>
      <input type="password" class="form-control" name="pw1" placeholder="Password">
    </div>
    <div class="form-group">
      <label for="InputPassword1">비밀번호 재입력</label>
      <input type="password" class="form-control" name="pw2" placeholder="Re-Password">
    </div>
        <div class="form-group">
        <label for="InputCall">이름</label>
      <input type="text" class="form-control" name="name" placeholder="홍길동">
    </div>
    <div class="form-group">
      <label for="InputCall">전화번호</label>
      <input type="text" class="form-control" name="call" placeholder="010-0000-0000">
    </div>
        <div class="form-group">
      <label for="InputEmail">이메일 주소</label>
      <input type="email" class="form-control" name="email" placeholder="email@example.com">
    </div>
      </fieldset>
    <button type="submit" class="btn btn-primary btn-lg btn-block">회원가입</button>
</form>
</body>
</html>