<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%-- url�� �����ϴ� ����� �մϴ�.
	�� �±׸� ����ϸ� ���� �Ű������� ������ URL�� �ս��� ���� �� �ֽ��ϴ�.
 --%>
 <c:url var="ex"
 value="http://localhost:8088/JspProject//ch13_jstl/_2.core/jstl_core_ex2.jsp">
 </c:url> 
 <a href = "${ex}">ó�� ������ �̵�</a>
<hr>
<%-- <c:param>�±׿� �Ķ���͸� �����ϱ� ���� �±��Դϴ�.
	name �Ӽ��� �Ķ���� �̸��� �Է��ϰ� value�� ���� �Է��Ͽ� �����մϴ�. --%>
 <c:url var="ex"
 value="http://localhost:8088/JspProject//ch13_jstl/_2.core/jstl_core_ex4.jsp">
 <c:param name="id" value="start"/>
 <c:param name="name" value="ȫ�浿"/>
 </c:url>
 
 <a href = "${ex}">�Ű����� ���� ����� �̵�</a>
<hr>
</body>
</html>















