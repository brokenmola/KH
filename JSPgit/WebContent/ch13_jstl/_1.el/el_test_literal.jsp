<%--project Ŭ�� -> properties-> project facet -> runtime -> tomcat Ŭ�� --%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%-- ���ͷ� ǥ���� : EL ���(${})���� ����� �� �ִ� ����
	 ���ڿ�, ����, �ε��Ҽ���, boolean, null �����մϴ�.�� --%>
<!DOCTYPE html>
<html>
<head>
<title>���ͷ� ǥ����</title>
</head>
<body>
	���ڿ� : ${"test" }<br>
	���ڿ� : ${'test' }<br>
	
	<%-- "\"�� ����Ϸ��� �� �� ����մϴ�. --%>
	���ڿ� : ${'\\test' }<br>
	���� : ${20 }<br>
	�ε��Ҽ��� : ${3.14 }<br>
	boolean : ${true }<br>
	null : ${null }<br> 
</body>
</html>