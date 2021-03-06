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
Document doc = Jsoup.connect("http://www.provin.gangwon.kr/covid-19.html").get();// 파싱할 사이트 변수


Elements posts = doc.body().getElementsByClass("skinTb-wrapper");//skinTb-wrapper속성의 모든 태그를 긇어옴       
   


int i=0;//td속성중 처음요소를 제외할 변수
int k=0;//th속성 중 처음 요소를 제외할 변수
int num=0;//반복문 변수
String loc[] = new String[18];//지역 배열
String all[] = new String[18];//지역별 총확진자 배열 
String a1 = "";//출력 변수
String a2 = "";//출력 변수
for(Element e : posts.select("th")){//th 속성 요소값들을 반복해서 출력
	if(k>0){
		  loc[num] = e.text();
		  num++;
	}
	else
		k++;
	}
num=0;
for(Element a : posts.select("td")){//td 속성 요소값들을 반복해서 출력
	  if(i>0){
		all[num] = a.text();
		num++;
	  }
	  else
		  i++;
}
	for(num=0;num<18;num++){//18개의 지역의 지역과 총 확진자 분포 출력 
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
doc = Jsoup.connect("https://search.naver.com/search.naver?sm=tab_hty.top&where=news&query=%EA%B0%95%EC%9B%90%EB%8F%84+%EC%BD%94%EB%A1%9C%EB%82%98+%ED%99%95%EC%A7%84%EC%9E%90&oquery=%EC%BD%94%EB%A1%9C%EB%82%98+%ED%99%95%EC%A7%84%EC%9E%90&tqi=U%2BLK%2BwprvTVssbBQu1GssssstQw-449449").get();// 파싱할 사이트 변수
out.println("<br>");
posts = doc.body().getElementsByClass("list_news");//list_news속성의 모든 태그를 긇어옴        
i=0;
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
  i++;
  }
else
	 i++;
 }	
%>
        </table>
    </body>
</html>