<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<link href="../css/ch5-5.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h2>include 된 페이지(includeTest3.jsp)</h2>
	<table>
		<%
			Enumeration<String> e = request.getParameterNames();
			while(e.hasMoreElements()){
				String includeName = e.nextElement();
		%>
			<tr>
				<td><%=includeName %></td>
				<td><%=request.getParameter(includeName) %></td>
			</tr>
		<%
			}
		%>
	</table>
</body>
</html>