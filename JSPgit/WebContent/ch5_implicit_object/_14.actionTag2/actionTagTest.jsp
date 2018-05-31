<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="view3.jsp">
		<h1>보고 싶은 페이지 선택</h1>
		<select name="code">
			<option value="newitem">신상품</option>
			<option value="bestitem">인기상품</option>
			<option value="useditem">중고상품</option>
		</select>
		<input type="submit" value="이동">
	</form>
</body>
</html>