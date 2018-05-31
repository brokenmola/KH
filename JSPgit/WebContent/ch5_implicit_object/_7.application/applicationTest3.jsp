<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html>
<html>
<head>
<title>Application Test - 초기화 파라미터 읽어오기</title>
	<style>		
		div{background-color: <%=application.getInitParameter("color")%>}
	</style>
</head>
<body>
	<h1>web.xml에서 설정한 색상으로 지정</h1>
	<div>나는 무슨 색인가요?</div>
</body>
</html>