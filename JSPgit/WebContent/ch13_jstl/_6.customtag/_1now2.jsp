<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%-- prefix 속성 : 명시된 값은 태그 라이브러리를 호출할 때 사용할 접두어를 의미합니다
	 tagdir 속성 : 웹 어플리케이션 루트를 기준으로 태그 파일이 위치한 디렉토리 경로를 표시합니다.
	 
	 커스텀 태그 사용법 : "<" + taglib디렉티브의 prefix + ":" + 태그 파일명 + ">"
	 				<tf:_1now/> 위치에 태그 파일(_1now.tag)에서 출력한 내용이 삽입됩니다. --%>
    <%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>now</title>
</head>
<body>
지금은 <b><tf:_1now2/></b>입니다.
<%--now는 태그 파일의 이름입니다. --%>

</body>
</html>