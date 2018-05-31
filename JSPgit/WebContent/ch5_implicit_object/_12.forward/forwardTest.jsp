<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<link href="../css/ch5-4.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h2>포워드 액션 테스트</h2>
	<form action="forwardTest2.jsp" method="post">
	<!-- hidden 타입의 input으로 다음 페이지에서 사용할 주소값을 지정하였습니다. -->
		<input type='hidden' name="forwardPage"
				value="forwardTest3.jsp">
		<%-- forwardTest3.jsp는 request가 갖고 있는 모든 파라미터 6개가 출력됩니다. --%>
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
</body>
</html>