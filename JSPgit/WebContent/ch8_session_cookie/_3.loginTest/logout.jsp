<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<h3>로그아웃 되었습니다.</h3>
	<a href="login.jsp">로그인 페이지로 이동</a>
</body>
</html>