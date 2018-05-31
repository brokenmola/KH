
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%--
		application 객체는 웹 어플리케이션 전반에 걸쳐서 사용되는
		정보를 담고 있습니다.
	 --%>
	<h2>application 테스트</h2>
	<table border="1">
		<tr>
			<td>Servlet API스펙의 버전</td>
			<td><%=application.getMajorVersion() %>.
				<%=application.getMinorVersion() %></td>
		</tr>
		<tr>
			<td>컨테이너 이름과 버전</td>
			<td><%=application.getServerInfo() %></td>
		</tr>
		<tr>
			<td>웹 어플리케이션의 실제 파일시스템 경로</td>
			<td><%=application.getRealPath("/") %></td>
		</tr>
	</table>
	<%--
		getRealPath("/") : /는 context경로 입니다.
		즉, 웹 어플리케이션 경로까지 구하라는 의미입니다.
		위의 경우 ~~~/JspProject/까지 구합니다.
	 --%>
</body>
</html>