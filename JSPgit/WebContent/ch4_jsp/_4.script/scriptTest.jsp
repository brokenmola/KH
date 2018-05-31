<%--
	스크립트릿(Scriptlet)
	HTML 코드로 된 부분은 일반 HTML 파일처럼 그대로 사용하며
	자바 코드로 이루어진 로직 부분은 <%...%>로 표현되는 스크립트릿 태그를 사용하여 구분합니다.
	
	JSP 파일이 실행될 때 웹 컨테이너에 의해 JSP 코드가 파싱(parsing)과정을
	거쳐서 서블릿 클래스로 변환됩니다.
	이때 일반 서블릿 클래스의 service()메서드에 해당하는
	_jspService()메서드가 웹 컨테이너에 의해 자동으로 재정의되며
	이 메서드의 내부에 파싱된  JSP코드가 들어가게 됩니다.
	이렇게 웹 컨테이너에 의해 서블릿 클래스가 생서되면 인스턴스와 스레드가
	생성되고 _jspService()메서드에 의해 응답 페이지가 만들어져
	클라이언트에 전송되어 결과 페이지가 표시됩니다.
	
	C:\workspace_java\.metadata\.plugins\org.eclipse.wst.server.core\
	temp0\work\Catalina\localhost\JspProject\org\apache\jsp\ch4_005fjsp\
	_005f3_declaration
	
	* JSP파일 처음 설정 파일 수정하는 방법
		window -> preferences -> template 검색 -> new jsp file(HTML) 수정
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%
	Calendar c=Calendar.getInstance();
	int hour=c.get(Calendar.HOUR_OF_DAY);
	int minute=c.get(Calendar.MINUTE);
	int second=c.get(Calendar.SECOND);
	String str = "";
%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1>현재 시간은 <%=hour %>시 <%=minute %>분 <%=second %>초 입니다.</h1>
	<%
	if(hour >= 0 && hour <= 11){
%>
	<h2>오전입니다.</h2>
<%
	
	} else {
%>
	<h2>오후입니다.</h2>
<%
	}
%>
</body>
</html>