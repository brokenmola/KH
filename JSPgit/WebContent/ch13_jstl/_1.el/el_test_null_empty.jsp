<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page isELIgnored="true" %>
<%--isELIgnored���� true�̸� EL�� �Ϲ� ���ڿ��� ó���մϴ�. --%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%--empty ������
	����) empty ��
		: ���� ��� �ְų� null������ ������ �� ����ϴ� ������ �Դϴ�.
		    ���� null�̸� true�� ��ȯ�մϴ�.
		    ���ڿ��� �迭�� ũ�Ⱑ 0�� ��쿡�� true�� ��ȯ�մϴ�.   --%>

<%
	pageContext.setAttribute("food","����");
%>
	<h1>\${pageScope.food} = ${pageScope.food }</h1>
	<h1>\${food } = ${food }</h1>
	
	<h1>\${empty food } = ${empty food }</h1>
	<h1>\${empty food2 } = ${empty food2 }</h1><%-- null�� true --%>
	
	<h1>\${null==food } = ${null==food }</h1>
	<h1>\${null==food2 } = ${null==food2 }</h1>
	<%-- name�̶�� �Ķ���Ͱ� �������� ���� ��� �ƹ� �͵� ������� �ʴ´�. --%>
	<h3>\${param.name } = ${param.name }</h3>
</body>
</html>