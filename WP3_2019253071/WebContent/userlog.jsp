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
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand">2019253071 안정수</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="main.jsp">메인
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="userlist.jsp">회원목록</a>
      </li>
      <li class="nav-item active">
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
	String path = Register.class.getResource("").getPath();
	BufferedReader reader = new BufferedReader(new FileReader(path +"log.txt"));
%>
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">접속한 시간</th>
    </tr>
  </thead>
  <tbody>
  <%
  while ((line = reader.readLine()) != null) { 
      String[] temp = line.split(" "); // , : 구분자
      String id = temp[0];
      String time = temp[1];
  %>
      <tr class="table-primary">
      <td><%=id %></td>
      <td><%=time %></td>
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