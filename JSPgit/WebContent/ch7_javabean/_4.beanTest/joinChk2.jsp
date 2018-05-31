<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
		<jsp:useBean id="joinbean" class="javabean.JoinBean" />
		<jsp:setProperty name="joinbean" property="*" />
	<table border=1>
		<%
			Enumeration<String> e = request.getParameterNames();
			while(e.hasMoreElements()){
				String beanName = e.nextElement();
		%>
			<tr>
				<td><%=beanName %></td>
				<td><jsp:getProperty name="joinbean" property="<%=beanName %>"/></td>
			</tr>
		<%
			}
		%>
	</table>
</body>
</html>