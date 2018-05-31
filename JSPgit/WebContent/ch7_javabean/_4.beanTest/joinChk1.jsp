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
		<%--
			자바빈의 프로퍼티 age가 정수형인 경우
			private int age;
			파라미터로 넘겨 받은 문자열 숫자는 정수형으로 변환되어 저장됩니다.
		 --%>
		<jsp:setProperty name="joinbean" property="*" />
	<table border=1>
		<tr>
			<td>아이디</td>
			<td><jsp:getProperty name="joinbean" property="id"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><jsp:getProperty name="joinbean" property="pass"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><jsp:getProperty name="joinbean" property="name"/></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><jsp:getProperty name="joinbean" property="gender"/></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><jsp:getProperty name="joinbean" property="age"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><jsp:getProperty name="joinbean" property="email"/></td>
		</tr>
	</table>
</body>
</html>