<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<link href="../css/ch5-11.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String attrName = (String)application.getAttribute("name");
		String attrId = (String)application.getAttribute("id");
		String sessEmail = (String)session.getAttribute("email");
		String sessAddress = (String)session.getAttribute("address");
		String sessPhone = (String)session.getAttribute("phone");
	
	%>
	<h1>영역과 속성 테스트</h1>
	<table border="1">
		<tr>
			<td colspan="2">Attribute 영역에 저장된 내용 확인</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=attrName %></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%=attrId %></td>
		</tr>
	</table>
	<br>
	<table border="1">
		<tr>
			<td colspan="2">session 영역에 저장된 내용 확인</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=sessEmail %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=sessAddress %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=sessPhone %></td>
		</tr>
	</table>
	<br>
	<hr>
	<br>
	<table border="1">
		<tr>
			<td colspan="2">Attribute 영역에 저장된 내용 확인</td>
		</tr>
		
		<%
			Enumeration<String> initAttrValue = application.getAttributeNames();
			while(initAttrValue.hasMoreElements()){
				String attrValue = initAttrValue.nextElement();
				if(attrValue.equals("name") || attrValue.equals("id")){
				%>
					<tr>
						<td><%=attrValue %></td>
						<td><%=application.getAttribute(attrValue) %>
					</tr>
				<%
				}
			}
		%>
	</table>
	<br>
	<table border="1">
		<tr>
			<td colspan="2">session 영역에 저장된 내용 확인</td>
		</tr>
		
		<%
			Enumeration<String> initSessionValue = session.getAttributeNames();
			while(initSessionValue.hasMoreElements()){
				String sessionValue = initSessionValue.nextElement();
		%>
			<tr>
				<td><%=sessionValue %></td>
				<td><%=session.getAttribute(sessionValue) %></td>
			</tr>
		<%
			}
		%>
	</table>
</body>
</html>