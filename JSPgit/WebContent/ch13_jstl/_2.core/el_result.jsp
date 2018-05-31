<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%request.setCharacterEncoding("euc-kr"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>EL 내장객체 사용 예제</title>
</head>

<body>
<h1>넘어온 이름은 :  ${param.name }</h1>

<h1>넘어온 취미는 : 
<c:forEach var="hobby" items="${paramValues.hobby}">
	<c:out value="${hobby}"/>
</c:forEach></h1>
</body>
</html>