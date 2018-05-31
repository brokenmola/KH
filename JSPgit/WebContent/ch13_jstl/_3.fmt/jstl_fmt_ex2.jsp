<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%-- fmt : ����ȭ/����ȭ�� ����� ������ �ִ� JSTL ���̺귯�� �Դϴ�.
	fmt ���̺귯���� ����ϴ�  �ڵ��Դϴ�. --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id ="date" class="java.util.Date"/>
<%-- Date date = new Date();
	pageContext.setAttribute("date", date); --%>
<!DOCTYPE html>
<html>
<head>
<title>JSTL fmt ���̺귯�� ��� ����</title>
</head>
<body>
<fmt:setLocale value="en_US"/>
<p>
<%--<fmt:formatNumber> : ���� ������ ������ ���� �� �� ����մϴ�.
	type : ������ Ÿ������ ����, ��ȭ, �ۼ�Ʈ �� ������ �� �ֽ��ϴ�.
	pattern : ������ ���� � �������� ��ȭ��ų�� ���� �� �ֽ��ϴ�. --%>
<!-- ���� ��ȭ �������� ��ȯ�մϴ�. -->
<fmt:formatNumber value="50000" type="currency" /><br>

<!-- ���� �ۼ�Ʈ �������� ��ȯ�մϴ�. -->
<fmt:formatNumber value="0.15" type="percent"/><br>

<!-- ���ڸ� ###,###,### �������� ����մϴ�. -->
<fmt:formatNumber value="500567300" pattern="###,###,###"/><br>

<!-- ��¥�� ����մϴ�. -->
<fmt:formatDate value="${date}" type="date"/><br>

<!-- �ð��� ����մϴ�. -->
<fmt:formatDate value="${date}" type="time"/><br>

<!-- ��¥�� �ð� ����մϴ�. -->
<fmt:formatDate value="${date }" type="both"/><br>

<!-- ��¥�� �ð��� ª�� ����մϴ�. -->
<fmt:formatDate value="${date }" type="both" timeStyle="short" dateStyle="short"/><br>

<!-- ��¥�� �ð��� ��� ����մϴ�. -->
<fmt:formatDate value="${date }" type="both" timeStyle="long" dateStyle="long"/><br>

</p>
</body>
</html>












