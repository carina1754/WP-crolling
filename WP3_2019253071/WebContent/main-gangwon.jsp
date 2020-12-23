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
      <li class="nav-item">
        <a class="nav-link" href="main.jsp">전지역</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="main-seoul.jsp">서울</a>
      </li>
      <li class="nav-item active">
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
      <th scope="col">강원도 지역</th>
      <th scope="col">총 확진자 수</th>
    </tr>
  </thead>
  <tbody>
<%
Document doc = Jsoup.connect("http://www.provin.gangwon.kr/covid-19.html").get();
// 파싱할 사이트를 적어, 모든 태그를 가져온다.


Elements posts = doc.body().getElementsByClass("skinTb-wrapper");
            // sc cs_language_test _sc_language_test속성의 모든 태그를 가져온다.      


int i=0;
int k=0;
int num=0;
String loc[] = new String[18];
String all[] = new String[18];
String a1 = "";
String a2 = "";
for(Element e : posts.select("th")){
	if(k>0){
		  loc[num] = e.text();
		  num++;
	}
	else
		k++;
	}
num=0;
for(Element a : posts.select("td")){
	  if(i>0){
		all[num] = a.text();
		num++;
	  }
	  else
		  i++;
}
//td 속성 요소값들을 반복해서 출력(td속성 갯수만큼), :not을 통해 align_center class의 td 요소는 제외 (알림 부분)
	for(num=0;num<18;num++){
		a1 = loc[num];
		a2 = all[num];
		  %>
		   <tr class="table-info">
	      <td><%=a1 %></td>
	       <td><%=a2 %></td>
	    </tr>
		  <%
	  } 
%>
        </table>
<table class="table table-hover">
<thead>
    <tr>
      <th scope="col">실시간 강원도 기사</th>
      <th scope="col">링크</th>
    </tr>
  </thead>
  <tbody>
<%
doc = Jsoup.connect("https://search.naver.com/search.naver?sm=tab_hty.top&where=news&query=%EA%B0%95%EC%9B%90%EB%8F%84+%EC%BD%94%EB%A1%9C%EB%82%98+%ED%99%95%EC%A7%84%EC%9E%90&oquery=%EC%BD%94%EB%A1%9C%EB%82%98+%ED%99%95%EC%A7%84%EC%9E%90&tqi=U%2BLK%2BwprvTVssbBQu1GssssstQw-449449").get();
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