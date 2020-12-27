<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="action.Register" %> 
<%@ page import="java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %>    

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="email" /> 
<jsp:setProperty name="user" property="call" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="pw1" />
<jsp:setProperty name="user" property="pw2" />
<jsp:setProperty name="user" property="age" />
<jsp:setProperty name="user" property="loc" />
<!DOCTYPE html>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="EUC-KR">
</head>
<body>
	<%
				Register userData = new Register();//레지스터 객체 생성
				int result = userData.upload(user);//회원가입 결과 출력 변수
				if(result == 0){//회원가입 실패시
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('다시 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
				}
				if(result == 1){//회원가입 성공시
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'login.jsp'");
					script.println("</script>");
				}
				if(result == 2){//아이디가 중복일 시
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('아이디가 중복입니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				if(result == 3){//비밀번호가 안맞을 시
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('비밀번호가 일치하지 않습니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {//회원가입 예외처리
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('다시 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
					}
				
			%>
</body>
</html>