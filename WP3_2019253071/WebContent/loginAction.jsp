<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="action.Login" %> 
<%@ page import="java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %>    

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="pw" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="EUC-KR">
</head> 
<body>
	<%
				Login userData = new Login();//로그인 객체 생성
				int result = userData.login(user);//로그인 실행 결과 변수
				if(result == 0){ //로그인 결과가 실패일떄
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('아이디 혹은 비밀번호를 잘못 입력하셨습니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				
				if(result == 1 && user.getloc().equals("3")){ //로그인 결과가 성공 및 지역이 강원 서울 외일 때
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
				if(result == 1 && user.getloc().equals("2")){ //로그인 결과가 성공 및 지역이 강원일때
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'main-gangwon.jsp'");
					script.println("</script>");
				}
				if(result == 1 && user.getloc().equals("1")){ //로그인 결과가 성공 및 지역이 서울일때
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'main-seoul.jsp'");
					script.println("</script>");
				}
				
				else {
					PrintWriter script = response.getWriter();//예외처리
					script.println("<script>");
					script.println("alert('아이디 혹은 비밀번호를 잘못 입력하셨습니다')");
					script.println("history.back()");
					script.println("</script>");
					}
				
			%>
</body>
</html>