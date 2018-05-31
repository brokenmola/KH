<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<link href="../css/ch5-11.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		if(email != null && address != null && phone != null){
			session.setAttribute("email", email);
			session.setAttribute("address", address);
			session.setAttribute("phone", phone);
		}
	%>
	<h2><%=application.getAttribute("name") %>님의 정보가 모두 저장되었습니다.</h2>
	<div><a href="attributeTest3.jsp">확인하러 가기</a></div>
</body>
</html>