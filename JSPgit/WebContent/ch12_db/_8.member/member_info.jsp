<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:include page="header.jsp"></jsp:include>
<%--<c:set var="m" value="${memberinfo}"/> --%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ�� ����</title>
</head>
<body>
	<form>
		<table>
			<tr>
				<td colspan="2">ȸ�� ����</td>
			</tr>
			<tr>
				<td>ID</td>
				<td>${memberinfo.id}</td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td>${memberinfo.password}</td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td>${memberinfo.name}</td>
			</tr>
			<tr>
				<td>����</td>
				<td>${memberinfo.age}</td>
			</tr>
			<tr>
				<td>����</td>
				<td>${memberinfo.gender}</td>
			</tr>
			<tr>
				<td>Email �ּ�</td>
				<td>${memberinfo.email}</td>
			</tr>
			<tr>
				<td colspan="2"><a href="member_list.net">����Ʈ�� ���ư���</a></td>			
			</tr>
		</table>
	</form>
</body>
</html>