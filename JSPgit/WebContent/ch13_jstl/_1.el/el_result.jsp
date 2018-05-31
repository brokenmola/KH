<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<title>EL 내장객체 사용 예제</title>
</head>

<body>
<h1>넘어온 이름은 :  ${param.name }</h1>

<h1>넘어온 취미는 : ${paramValues.hobby[0] }, ${paramValues.hobby[1] }</h1>

</body>
</html>