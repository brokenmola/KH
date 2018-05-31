<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>input.jsp</title>
<link href="../../css/ch03-5.css"
		type="text/css"
		rel="stylesheet">
</head>
<body>
	<form action='DispatcherServlet' method="get">
		<b>좋아하는 음식은 무엇인가요?</b><br>
		<input type='text' name='food'>
		<input type='submit' value='전송'>
	</form>
</body>
</html>