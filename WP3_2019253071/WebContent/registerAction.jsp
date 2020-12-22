<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="action.Register" %> 
<%@ page import="java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %>    

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="email" /> 
<jsp:setProperty name="user" property="call" />
<jsp:setProperty name="user" property="pw1" />
<jsp:setProperty name="user" property="pw2" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="EUC-KR">
</head>
<body>
	<%
				Register userData = new Register();
				int result = userData.upload(user);				
				if(result == 0){ 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('다시 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
				}
				if(result == 1){ 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
				if(result == 2){ 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('아이디가 중복입니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				if(result == 3){ 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('비밀번호가 일치하지 않습니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('다시 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
					}
				
			%>
</body>
</html>