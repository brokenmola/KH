<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1>forwardTest2.jsp입니다.(제가 화면에 보여질까요?)</h1>
	<%--
		forward 액션은 pageContext 내장 객체의 forward()메소드가
		태그로 구현된 기능입니다.
		forward 액션은 page 속성에 지정된 이동할 페이지로 현재 페이지의 요청과
		응답에 관한 처리권을 넘깁니다.
		이때, 이동하기 전 페이지에 대한 모든 출력 버퍼의 내용은
		무시(버퍼의 내용이 버려짐)되며
		이동한 페이지가 요청을 처리하여 응답이 완료되면
		원래 페이지로 제어권이 돌아가지 않고 그 상태에서 모든 응답이 종료됩니다.
	 --%>
	 
	 <%--
	 	page 속성을 지정할 때 표현식 내부에 큰 따옴표가 들어올 수 있으므로
	 	작은 따옴표를 사용하여 처리합니다.
	 	포워딩 되는 페이지에 "tel"이란 이름으로 전화번호 값을 파라미터로 전송하기
	 	<jsp:param/>태그를 사용했습니다.
	  --%>
	<jsp:forward page='<%=request.getParameter("forwardPage") %>'>
		<jsp:param name="tel" value="010-1234-5678"/>
		<jsp:param name="alias" value="사랑이"/>
	</jsp:forward>
	
	<%="저는 출력이 될까요?" %>
</body>
</html>