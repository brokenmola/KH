<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
<html>
<head>
<title>MVC �Խ���- ���� ������</title>
</head>
<link href ="css/form.css" rel="stylesheet">
<body>
	<%@ include file="/board/header.jsp" %>
	<form action="./BoardModifyAction.bo" method="post" name="modifyform">
		<input type="hidden" name="BOARD_NUM" value="${boarddata.BOARD_NUM }">
		<table>
			<tr class="center">
				<th colspan="2">MVC �Խ��� - ���� ������</th>
			</tr>
			<tr>
				<td><div>�۾���</div></td>
				<td><input name="BOARD_NAME" id="board_name" readonly
				type="text" size="10" maxlength="30" value="${sessionScope.id}" ></td>
			</tr>
			<tr>
				<td><div>��  ��</div></td>
				<td><input name="BOARD_SUBJECT" id="board_subject" type="text"
				size="50" maxlength="100" value="${boarddata.BOARD_SUBJECT}"></td>
			</tr>
			<tr>
				<td><div>��  ��</div></td>
				<td><textarea name="BOARD_CONTENT" id="board_content"
				rows="15" cols="65" >${boarddata.BOARD_CONTENT}
				</textarea></td>
			</tr>
			<!-- ������ ÷�εǾ� ������ -->
			<c:if test="${!empty boarddata.BOARD_FILE }">
			<tr>
				<td><div>���� ÷��</div></td>
				<td>&nbsp;&nbsp;${boarddata.BOARD_FILE }</td>
			</tr>
			</c:if>
			<c:if test="${empty boarddata.BOARD_FILE }">
			<tr>
				<td><div>���� ÷��</div></td>
				<td></td>
			</tr>
			</c:if>
			<tr>
				<td><div>��й�ȣ</div></td>
				<td><input type="password" name="BOARD_PASS" id="board_pass"
				size="10" maxlength="30" value=""></td>
			</tr>
			<tr class="center">
				<td colspan="2" class="h30_lime">
					<input type="submit" value="����">
					<input type="button" value="���" onClick="history.back()">
				</td>
			</tr>
		</table>		
	</form>
</body>
</html>




