<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ȸ�� ���</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<table>
		<thead>
			<tr>
				<th colspan="3">ȸ�� ���</th>
			</tr>
			<tr>
				<td>���̵�</td>
				<td>�̸�</td>
				<td>����</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${totallist }">
			<tr>
				<td><a href="member_info.net?id=${m.id}">
				${m.id}</a></td>
				<td>${m.name}</td>
				<td><a href="member_delete.net?id=${m.id}">
				����</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
</html>







