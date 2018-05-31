<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1>자바빈 예제</h1>
	<%
		javabean.BeanTest beantest = new javabean.BeanTest();
		pageContext.setAttribute("beantest", beantest);
		beantest.setName("봄입니다.");
	%>
	<h3><%=beantest.getName() %></h3>
</body>
</html>