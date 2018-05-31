<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1>자바빈 예제</h1>
	<jsp:useBean id="beantest" class="javabean.BeanTest"
				scope="page"/>
				
	<jsp:setProperty name="beantest" property="name"
			value="봄입니다."/>
	<%--
		beantest.setName("봄입니다.");를 의미합니다.
	 --%>
	<h3><jsp:getProperty name="beantest" property="name"/></h3>
</body>
</html>