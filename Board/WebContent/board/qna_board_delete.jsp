<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<title>MVC �Խ��� ���� ������</title>
</head>
<link href="css/form.css" rel="stylesheet">
<body>
<jsp:include page="header.jsp"/>
<form name="deleteForm" action="./BoardDeleteAction.bo" method="post">
<input type="hidden" name="num" value="${param.num }">
	<table border ="1">
		<tr>
			<th>�� ��й�ȣ</th>
			<td><input name="BOARD_PASS" id="borad_pass" type="password"></td>
		</tr>
		<tr>
			<td colspan=2 class="h30 center lime">
				<input type="submit" value="����">
				<input type="button" value="���" onClick="history.go(-1)">
			</td>
		</tr>
	</table>
</form>
</body>
</html>