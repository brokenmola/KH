<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>JSTL ���̺귯�� ��� ����</title>
</head>
<body>
<%--<f:set>������ ���� �����ϴ� �±��Դϴ�.
	var : ���� ������ ���� �̸�
	value : ������ �� --%>
	<f:set var="test" value="Hello JSTL!"/>
		<h3>
			&lt;f:set&gt; ��� �� :
			<f:out value="${test} "/> <!--  ������ ���� ����ϴ� �±��Դϴ�. -->
		</h3>
		
		<f:remove var="test"/><%-- ������ �Ӽ��� �����ϴ� �±��Դϴ�. --%>
		<h3>
			&lt;f:remove&gt; ��� �� :
			<f:out value="${test }"/>
		</h3>
</body>
</html>















