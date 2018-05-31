<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		boolean isLogin = false;
		if(id != null){
			isLogin = true;
		}
		
		if(isLogin){
	%>
		<h3>ID "<%=id%>"로 로그인 한 상태입니다.</h3>
		<a href="logout.jsp">로그아웃</a>
	<%
		} else {
	%>
		<h3>로그인 하지 않은 상태입니다.</h3>
	<%
		}
	%>
	
</body>
</html>