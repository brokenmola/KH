<%--
	내장 객체한 JSP 파일이 자바 소스 파일로 변환되면서
	_jsPService()메서드 내에 자동으로
	선언 및 초기화 되는 변수들을 "내장 객체"라고 합니다.
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");
	
%>
</head>
<body>
	<h1>Request 예제입니다.</h1>
	<table>
		<tr>
			<td>이름</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<%
					if(gender.equals("male")){
				%>
					남자
				<% 
				} else {
				%>
					여자
				<%
				}
				%>
			</td>
		</tr>
		<tr>
			<td>취미</td>
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