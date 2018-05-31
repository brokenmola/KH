<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<link href="../css/ch5-11.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>영역과 속성 테스트</h1>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		if(name != null && id != null){
			application.setAttribute("name", name);
			application.setAttribute("id", id);
		}
	%>
	<h1><%=name %>님 반갑습니다.</h1><br>
	<h1><%=name %>님의 아이디는 <%=id %>입니다.</h1>
	<form action="attributeTest2.jsp" method="post">
		<table border="1">
			<tr>
				<td colspan="2">Session 영역에 저장할 내용들</td>
			</tr>
			<tr>
				<td>e-mail 주소</td>
				<td><input type="email" name="email" required></td>
			</tr>
			<tr>
				<td>집 주소</td>
				<td><input type="text" name="address" required></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" required></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송">
			</tr>
		</table>
	</form>
</body>
</html>