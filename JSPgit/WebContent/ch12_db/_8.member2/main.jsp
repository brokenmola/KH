<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<title>메인 페이지</title>
</head>

<body>
	<%@ include file="header.jsp" %>
	<%if (id.equals("admin")){ %>
	<a href="member_list.net">관리자 모드 접속(회원 목록 보기)</a>
	<%} %>
</body>
</html>