<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>import</title>
</head>
<body>
c:import 전 입니다.
<hr>
<%-- url 속성에 주소를 지정하면 해당 주소로 요청하고 응답 결과를 받아서 반환합니다. --%>
<c:import
url="http://localhost:8088/JspProject/ch13_jstl/_2.core/jstl_core_ex3.jsp"/>
<hr>
c:import 후 입니다.
</body>
</html>















