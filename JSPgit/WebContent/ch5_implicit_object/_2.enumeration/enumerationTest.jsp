<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1>헤더정보 예제</h1>
	<table border="1">
		<tr>
			<td>헤더이름</td>
			<td>헤더값</td>
		</tr>
		<%
			//getHeaderNames()메서드 : HTTP요청 헤더에 포함된 모든 헤더 이름을
			//Enumeration 객체로 리턴합니다.
			Enumeration<String> e = request.getHeaderNames();
			while(e.hasMoreElements()){
				String headerName = e.nextElement();
		%>
		<tr>
			<td><%=headerName %></td>
			<td>
				<%--getHeader() : 매개변수로 지정된 이름으로 할당된 값을 리턴합니다.
									없는 경우 null을 리턴합니다. --%>
				<%=request.getHeader(headerName) %>
			</td>
			<%
				}
			%>
		</tr>

	</table>
</body>
</html>