<%--project 클릭 -> properties-> project facet -> runtime -> tomcat 클릭 --%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%-- 리터럴 표현식 : EL 블록(${})에서 사용할 수 있는 값은
	 문자열, 정수, 부동소수점, boolean, null 가능합니다.ㄴ --%>
<!DOCTYPE html>
<html>
<head>
<title>리터럴 표현식</title>
</head>
<body>
	문자열 : ${"test" }<br>
	문자열 : ${'test' }<br>
	
	<%-- "\"를 출력하려면 두 개 사용합니다. --%>
	문자열 : ${'\\test' }<br>
	정수 : ${20 }<br>
	부동소숫점 : ${3.14 }<br>
	boolean : ${true }<br>
	null : ${null }<br> 
</body>
</html>