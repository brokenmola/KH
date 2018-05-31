<%--
	include 지시어(디렉티브)
	특정한 JSP파일 또는 HTML 파일을 해당 JSP페이지에 삽입할 수
	있도록 기능을 제공하는 지시어입니다.
	include 지시어로 지정되어 현재 페이지에 포함되어 JSP파일들을
	웹 컨테이너에 의해 따로따로 컴파일 되는 것이 아니라 그 소스가
	include 지시어를 사용한 해당 페이지에 복사되어 더해지는 것으로
	웹 컨테이너는 전체 JSP파일들의 소스가 합쳐진 하나의 페이지만을 컴파일합니다.
	
	여러 JSP 페이지에서 공통되는 부분이 많을 때 이러한 공통되는 부분을
	파일로 만들어 include 지시어로 삽입합니다.
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h1>template.jsp파일입니다.</h1>
	<span>header.jsp의 id의 값 : <%=id %></span>	<!-- 가능한 이유는 id가 header.jsp에 선언되있기 때문이다. -->
	<%@ include file="footer.jsp" %>
</body>
</html>