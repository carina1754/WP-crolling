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
Document doc = Jsoup.connect("https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%BD%94%EB%A1%9C%EB%82%98+%ED%99%95%EC%A7%84%EC%9E%90").get();// 파싱할 사이트 변수


Elements posts = doc.body().getElementsByClass("csp_table_area");//csp_table_area속성의 모든 태그를 긇어옴    


int i=0;//테이블 줄바꿈 변수
int k=0;//반복문 변수
String loc="";//지역 출력 변수
String all="";//총 확진자 출력 변수
String day="";//오늘 확진자 출력 변수
for(Element e : posts.select("td")){//td 속성 요소값들을 반복해서 출력
  if(k>=54){//만약 모든 내용을 표시했을시 반복문 종료
	  break;
  }
  if(i==0){//지역
	  loc = e.text();}
  if(i==1){//총 확진자
	  all = e.text();}
  if(i==2){//오늘 확진자
	  day = e.text();}
  i++;
  k++;
  if(i==3){//만약 모든 값이 입력됐을 시
	  %>
	    	<tr class="table-info">
      <td><%=loc %></td>
       <td><%=all %></td>
        <td><%=day %></td>
    </tr>
	  <%
	  i=0;//입력 반복 초기화
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
doc = Jsoup.connect("https://search.naver.com/search.naver?where=news&query=%EC%BD%94%EB%A1%9C%EB%82%98%20%ED%99%95%EC%A7%84%EC%9E%90&sm=tab_srt&sort=1&photo=0&field=0&reporter_article=&pd=0&ds=&de=&docid=&nso=so%3Add%2Cp%3Aall%2Ca%3Aall&mynews=0&refresh_start=0&related=0").get(); // 파싱할 사이트 변수
out.println("<br>");
posts = doc.body().getElementsByClass("list_news");//list_news속성의 모든 태그를 긇어옴       
for(Element e : posts.select("div:not(.news_cluster) a")){//div 속성 중 a 요소값들을 반복해서 출력, :not을 통해 news_cluster의 a 요소는 제외
if(!e.attr("title").equals("")){//title요소가 널이 아닐시
	String title = e.attr("title");//title 출력 변수
	String link = e.attr("href");//링크 출력 변수
	%>
	<tr class="table-info">
      <td><%=title %></td>
      <td><input type="button" class="btn btn-info"value="기사 바로가기" onclick="location.href='<%=link %>'"/></td>
    </tr>
	<%
  }
 }	
%>
        </table>
    </body>
</html>