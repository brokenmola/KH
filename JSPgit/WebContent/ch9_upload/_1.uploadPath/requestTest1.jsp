<%--
	���� ��ü�� JSP ������ �ڹ� �ҽ� ���Ϸ� ��ȯ�Ǹ鼭
	_jsPService()�޼��� ���� �ڵ�����
	���� �� �ʱ�ȭ �Ǵ� �������� "���� ��ü"��� �մϴ�.
 --%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	h1{text-align: center;}
	table{width: 500px;
		height: 200px;
		text-align: center;}
	table, tr, td{border: 1px solid black;}
</style>
<%
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");
	
%>
</head>
<body>
	<h1>Request �����Դϴ�.</h1>
	<table>
		<tr>
			<td>�̸�</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>����</td>
			<td>
				<%
					if(gender.equals("male")){
				%>
					����
				<% 
				} else {
				%>
					����
				<%
				}
				%>
			</td>
		</tr>
		<tr>
			<td>���</td>
			<td>
				<% 
					for(int i = 0; i < hobby.length; i++){
				%>
					<%=hobby[i] %>&nbsp;&nbsp;
				<%
					}
				%>
			</td>
		</tr>
	</table>
</body>
</html>