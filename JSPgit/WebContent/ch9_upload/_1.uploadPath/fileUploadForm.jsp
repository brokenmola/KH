<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%-- WebContent ���� �Ʒ� "upload" ���� ���� �� �����ϼ��� --%>
<%--
	�Ϲ� �Ķ���͸� ������ �� ����ϴ� ���ڵ��� ������ ���ε� �� �� ����ϴ� ���ڵ��� �ٸ��ϴ�.
	��Ʈ�� ����� ���� ����� POST����� ������ �� ���� ���ڵ� ��Ŀ�
	���� �����ϴ� ������ ������ �޶����ϴ�.
	1. application/x-www-form-urlencoded
	2. multipart/form-data
	
	���ݱ����� �������� 1�� ���ڵ��� ����ؼ� �����͸� �����߽��ϴ�.
	������ ���ε� �ϱ� ���ؼ��� 2�� ���ڵ��� ����ؾ� �մϴ�.
	form �±��� enctype �Ӽ� ���� "multipart/form-data"�� �������ָ�
	�˴ϴ�. method�� post��� �Դϴ�.
 --%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="fileUpload2.jsp" method="post"
			enctype="multipart/form-data">
		<table border="1">
			<tr class="yellow">
				<td colspan=2 class="center pad">
				<h3>���� ���ε� ��</h3></td>
			</tr>
			<tr>
				<td>�ø� ���</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td>���ϸ�1</td>
				<td>
					<input type="file" name="fileName1">
					<!-- ������ �����Ͽ� ������ �� �ֵ��� type�Ӽ��� file�� �����մϴ�. -->
				</td>
			</tr>
			<tr>
				<td>���ϸ�2</td>
				<td><input type="file" name="fileName2"></td>
			</tr>
			<tr>
				<td colspan=2 class="center green">
				<input type="submit" value="����"></td>
			</tr>
		</table>		
	</form>
</body>
</html>