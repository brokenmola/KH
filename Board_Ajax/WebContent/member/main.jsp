<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<title>���� ������</title>
</head>

<body>
	<%@ include file="/board/header.jsp" %>
	<c:if test="${id=='admin' }">
	<a href="member_list.net">������ ��� ����(ȸ�� ��� ����)</a>
	</c:if>
</body>
</html>