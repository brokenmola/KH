<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<link href="../css/ch5-11.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="attributeTest1.jsp" method="post">
		<table border="1">
			<tr><td colspan="2">Application 영역에 저장할 내용들</td></tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required></td>
				
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>	
	</form>
</body>
</html>