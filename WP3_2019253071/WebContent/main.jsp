<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.MalformedURLException" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
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
       <li class="nav-item active">
        <a class="nav-link" href="main.jsp">전지역</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="main-seoul.jsp">서울</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="main-gangwon.jsp">강원</a>
      </li>
      <li class="nav-item">
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
<thead>
    <tr>
      <th scope="col">지역</th>
      <th scope="col">총 확진자 수</th>
      <th scope="col">신규 확진자</th>
    </tr>
  </thead>
  <tbody>
<%
Document doc = Jsoup.connect("https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%BD%94%EB%A1%9C%EB%82%98+%ED%99%95%EC%A7%84%EC%9E%90").get();
// 파싱할 사이트를 적어, 모든 태그를 가져온다.


Elements posts = doc.body().getElementsByClass("csp_table_area");
            // sc cs_language_test _sc_language_test속성의 모든 태그를 가져온다.      


int i=0;
int k=0;
String loc="";
String all="";
String day="";
for(Element e : posts.select("td")){
//td 속성 요소값들을 반복해서 출력(td속성 갯수만큼), :not을 통해 align_center class의 td 요소는 제외 (알림 부분)
  if(k>=54){
	  break;
  }
  if(i==0){
	  loc = e.text();}
  if(i==1){
	  all = e.text();}
  if(i==2){
	  day = e.text();}
  i++;
  k++;
  if(i==3){
	  %>
	    	<tr class="table-info">
      <td><%=loc %></td>
       <td><%=all %></td>
        <td><%=day %></td>
    </tr>
	  <%
	  i=0;
  }
 }	 
%>
        </table>
<table class="table table-hover">
<thead>
    <tr>
      <th scope="col">실시간 전국 기사</th>
      <th scope="col">링크</th>
    </tr>
  </thead>
  <tbody>
<%
doc = Jsoup.connect("https://search.naver.com/search.naver?where=news&query=%EC%BD%94%EB%A1%9C%EB%82%98%20%ED%99%95%EC%A7%84%EC%9E%90&sm=tab_srt&sort=1&photo=0&field=0&reporter_article=&pd=0&ds=&de=&docid=&nso=so%3Add%2Cp%3Aall%2Ca%3Aall&mynews=0&refresh_start=0&related=0").get();
// 파싱할 사이트를 적어, 모든 태그를 가져온다.
out.println("<br>");
posts = doc.body().getElementsByClass("list_news");
            // sc cs_language_test _sc_language_test속성의 모든 태그를 가져온다.      
i=0;
for(Element e : posts.select("div:not(.news_cluster) a")){
//td 속성 요소값들을 반복해서 출력(td속성 갯수만큼), :not을 통해 align_center class의 td 요소는 제외 (알림 부분)
if(!e.attr("title").equals("")){
	String title = e.attr("title");
	String link = e.attr("href");
	%>
	<tr class="table-info">
      <td><%=title %></td>
      <td><input type="button" class="btn btn-info"value="기사 바로가기" onclick="location.href='<%=link %>'"/></td>
    </tr>
	<%
  i++;
  }
else
	 i++;
 }	
%>
        </table>
    </body>
</html>