<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<title>MVC �Խ���-write ������</title>
</head>
<link href ="css/form.css" rel="stylesheet">
<body>
	<%@ include file="/board/header.jsp" %>
	<form action="./BoardAddAction.bo" method="post"
		enctype="multipart/form-data" name="boardform">
		<table>
			<tr class="center">
				<th colspan="2">MVC �Խ���-write ������</th>
			</tr>
			<tr>
				<td><div>�۾���</div></td>
				<td><input name="BOARD_NAME" id="board_name" readonly
				type="text" size="10" maxlength="30" value="${id}" ></td>
			</tr>
			<tr>
				<td><div>��й�ȣ</div></td>
				<td><input type="password" name="BOARD_PASS" id="board_pass"
				size="10" maxlength="30" value=""></td>
			</tr>
			<tr>
				<td><div>��  ��</div></td>
				<td><input name="BOARD_SUBJECT" id="board_subject" type="text"
				size="50" maxlength="100" value=""></td>
			</tr>
			<tr>
				<td><div>��  ��</div></td>
				<td><textarea name="BOARD_CONTENT" id="board_content"
				rows="15" cols="65"></textarea></td>
			</tr>
			<tr>
				<td><div>���� ÷��</div></td>
				<td>
				<img src="image/upload.png" width="10px">
				<input type="file" name="BOARD_FILE" id="upfile"
				></td>
			</tr>
			<tr class="center">
				<td colspan="2" class="h30_lime">
					<input type="submit" value="���">
					<input type="reset" value="���">
				</td>
			</tr>
		</table>		
	</form>
</body>
</html>




