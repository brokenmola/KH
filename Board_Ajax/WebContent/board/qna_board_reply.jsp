<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Reply ������</title>
</head>
<link href ="css/form.css" rel="stylesheet">
<body>
<%@ include file="/board/header.jsp" %>
	<form action="./BoardReplyAction.bo" method="post" name="boardform">
	<input type="hidden" name="BOARD_NUM" value="${boarddata.BOARD_NUM }">
	<input type="hidden" name="BOARD_RE_REF" value="${boarddata.BOARD_RE_REF }">
	<input type="hidden" name="BOARD_RE_LEV" value="${boarddata.BOARD_RE_LEV }">
	<input type="hidden" name="BOARD_RE_SEQ" value="${boarddata.BOARD_RE_SEQ }">
	
		<table>
			<tr class="center">
				<th colspan="2">MVC �Խ���-Reply ������</th>
			</tr>
			<tr>
				<td><div>�۾���</div></td>
				<td><input name="BOARD_NAME" id="board_name" 
				type="text"value="${sessionScope.id}"></td>
			</tr>
			<tr>
				<td><div>��  ��</div></td>
				<td><input name="BOARD_SUBJECT" id="board_subject" type="text"
				size="50" maxlength="100" value="Re:${boarddata.BOARD_SUBJECT }"></td>
			</tr>
			<tr>
				<td><div>��  ��</div></td>
				<td><textarea name="BOARD_CONTENT" id="board_content"
				rows="15" cols="65"></textarea></td>
			</tr>
			<tr>
				<td><div>��й�ȣ</div></td>
				<td><input type="password" name="BOARD_PASS" id="board_pass"
				size="10" maxlength="30" value=""></td>
			</tr>
			<tr class="center">
				<td colspan="2" class="h30_lime">
					<input type="submit" value="���">
					<input type="button" value="���" onClick="history.go(-1)">
				</td>
			</tr>
		</table>		
	</form>
</body>
</html>