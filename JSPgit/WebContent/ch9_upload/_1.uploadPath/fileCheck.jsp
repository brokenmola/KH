<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
 <%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
String subject = request.getParameter("subject");
String filename1 = request.getParameter("filename1");
String filename2 = request.getParameter("filename2");
String origfilename1 = request.getParameter("origfilename1");
String origfilename2 = request.getParameter("origfilename2");
%>
	<table border="1">
			<tr class="yellow">
				<td colspan=2 class="center pad">
				<h3>파일다운로드 폼</h3></td>
			</tr>
			<tr>
				<td>올린 사람</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=subject %></td>
			</tr>
			<tr>
				<td>파일명1</td>
				<td><a href = "file_down.jsp?file_name=<%=filename1 %>"><%=origfilename1 %></a></td>
			</tr>
			<tr>
				<td>파일명2</td>
				<td><a href = "file_down.jsp?file_name=<%=filename2 %>"><%=origfilename2 %></a></td>
			</tr>
		</table>	
</body>
</html>