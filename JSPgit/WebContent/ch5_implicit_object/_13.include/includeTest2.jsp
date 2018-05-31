<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<link href="../css/ch5-5.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%--
		include 액션 태그
		include 액션은 임시로 제어권을 page 속성의 페이지에 넘기고
		그 페이지의 처리가 끝나면 처리 결과를 원래 페이지로 리턴하고
		다시 원래의 페이지로 제어권을 반환하는 방식입니다.
		
		include 디렉티브와 차이점
		include 디렉티브는 원레 페이지 안으로 include 지시어로 지정한
		페이지의 소스 코드가 그대로 복사 되어 실행되지만
		include 액션 태그는 page 속성의 페이지의 실행 결과를 현재 위치에
		포함시킵니다.
	 --%>
	<h2>인클루드 액션 테스트 시작</h2>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:include page='<%=request.getParameter("includePage") %>'>
		<jsp:param name="tel" value="010-1234-5678"/>
		<jsp:param name="alias" value="happy"/>
	</jsp:include>
	<h2>인클루드 액션 테스트 끝</h2>
</body>
</html>