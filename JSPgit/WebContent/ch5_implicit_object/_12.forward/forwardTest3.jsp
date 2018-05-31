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
	<h2>포워드 된 페이지(forwardTest3.jsp)</h2>
	<table>
		<%
		Enumeration<String> e = request.getParameterNames();
		while(e.hasMoreElements()){
			String paramName = e.nextElement();
	%>
		<tr>
			<td><%=paramName %></td>
			<td><%=request.getParameter(paramName) %></td>
		</tr>	
	<%
		}
	%>
	</table>
</body>
</html>