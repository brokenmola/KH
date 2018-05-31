<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<title>EL 내장객체 사용 예제</title>
</head>

<body>
<h1>${param.name =="홍길동" ? "하하" : "호호"}</h1>



</body>
</html>