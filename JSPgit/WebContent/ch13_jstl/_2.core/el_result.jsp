<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%request.setCharacterEncoding("euc-kr"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>EL ���尴ü ��� ����</title>
</head>

<body>
<h1>�Ѿ�� �̸��� :  ${param.name }</h1>

<h1>�Ѿ�� ��̴� : 
<c:forEach var="hobby" items="${paramValues.hobby}">
	<c:out value="${hobby}"/>
</c:forEach></h1>
</body>
</html>