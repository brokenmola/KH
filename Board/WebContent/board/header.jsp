<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="header">
	<c:if test="${empty id }">
		<script>
			location.href="login.net";
		</script>
	</c:if>
	<c:if test="${!empty id }">
		<c:if test="${id=='admin' }">
			<span>������ ${id} �� ȯ���մϴ�.</span>
			<a href="member_list.net">�����ڸ�� ����(ȸ�� ��� ����)</a>
			<a href="BoardList.bo">(�Խ���)</a>
		</c:if>
		<c:if test="${id!='admin'}">
			<span>�Ϲ�ȸ�� ${id } �� ȯ���մϴ�. </span>
			<a href="BoardList.bo">(�Խ���)</a>
		</c:if>
	</c:if>
</div>
<span>(<a href="member_update.net">��������</a>)
(<a href="logout.net">�α׾ƿ�</a>)</span>
<hr>