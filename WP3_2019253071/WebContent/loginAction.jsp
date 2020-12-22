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
				Login userData = new Login();
				int result = userData.login(user);		
				if(result == 0){ 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('아이디 혹은 비밀번호를 잘못 입력하셨습니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				if(result == 1){ 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('아이디 혹은 비밀번호를 잘못 입력하셨습니다')");
					script.println("history.back()");
					script.println("</script>");
					}
				
			%>
</body>
</html>