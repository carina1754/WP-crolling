<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.io.*" %>
    <%@ page import="action.Register" %>
<!DOCTYPE html>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<meta charset="EUC-KR">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand">COVID-19</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button> 

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="main.jsp">전지역</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="main-seoul.jsp">서울</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="main-gangwon.jsp">강원</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="userlist.jsp">회원목록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="userlog.jsp">로그인기록</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
     <a class="nav-link" style="color:#F5B4AA" href="login.jsp">로그아웃</a>
    </form>
      </div>
</nav>
<table class="table table-hover">
<%
try {
	String line = "";
	BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\buleb\\git\\WP-crolling\\WP3_2019253071\\src\\action\\user.txt"));//파일 입출력 읽기
%>
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">이름</th>
      <th scope="col">전화번호</th>
      <th scope="col">이메일</th>
      <th scope="col">나이</th>
      <th scope="col">지역</th>
    </tr>
  </thead>
  <tbody>
  <%
  while ((line = reader.readLine()) != null) { //파일 끝까지 읽기
      String[] temp = line.split(" "); //공백기준으로 문자열 나누기
      String id = temp[0];//아이디 출력 변수
      String name = temp[2];//이름 출력 변수
      String call = temp[3];//전화번호 출력 변수
      String email = temp[4];//이메일 출력 변수
      String age = temp[5];//나이 출력변수
      String loc = temp[6];//지역 출력 변수
      if(loc.equals("1"))
    	  loc="서울";
      else if(loc.equals("2"))
    	  loc="강원";
      else if(loc.equals("3"))
    	  loc="서울,강원 외";
  %>
      <tr class="table-info">
      <td><%=id %></td>
      <td><%=name %></td>
      <td><%=call %></td>
      <td><%=email %></td>
      <td><%=age %> 세</td>
      <td><%=loc %></td>
    </tr>
 <%
  }
  reader.close();
}catch (IOException e) {
    e.printStackTrace();
}
    %>
    </tbody>
    </table>
    </body>
</html>