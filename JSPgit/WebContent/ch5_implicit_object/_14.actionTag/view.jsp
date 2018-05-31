<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		String code = request.getParameter("code");
		String movePage = "viewModule/" + code + ".jsp";
	%>

	<jsp:forward page= '<%=movePage %>'/>
</body>
</html>