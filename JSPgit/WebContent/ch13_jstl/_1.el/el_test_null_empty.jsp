<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page isELIgnored="true" %>
<%--isELIgnored값이 true이면 EL을 일반 문자열로 처리합니다. --%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%--empty 연산자
	형식) empty 값
		: 값이 비어 있거나 null인지를 조사할 때 사용하는 연산자 입니다.
		    값이 null이면 true를 반환합니다.
		    문자열과 배열의 크기가 0인 경우에도 true를 반환합니다.   --%>

<%
	pageContext.setAttribute("food","과자");
%>
	<h1>\${pageScope.food} = ${pageScope.food }</h1>
	<h1>\${food } = ${food }</h1>
	
	<h1>\${empty food } = ${empty food }</h1>
	<h1>\${empty food2 } = ${empty food2 }</h1><%-- null이 true --%>
	
	<h1>\${null==food } = ${null==food }</h1>
	<h1>\${null==food2 } = ${null==food2 }</h1>
	<%-- name이라는 파라미터가 존재하지 않을 경우 아무 것도 출려되지 않는다. --%>
	<h3>\${param.name } = ${param.name }</h3>
</body>
</html>