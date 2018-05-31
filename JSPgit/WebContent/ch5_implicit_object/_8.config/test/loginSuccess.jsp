<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<script>
	
	</script>
	<%
		String insertId = request.getParameter("id");
		String insertPass = request.getParameter("passwd");
		String id = config.getInitParameter("id");
		String pass = config.getInitParameter("pass");
		
		if(id.equals(insertId) && pass.equals(insertPass)){
	%>
			<h1><%=insertId %>님이 입장하셨습니다.</h1>
	<%
		} else {
	%>
			<script>
				alert("로그인에 실패하셨습니다.");
				history.back();
			</script>
	<%
		}
			
	%>
</body>
</html>