<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	session.setMaxInactiveInterval(10);	//10초 동안 세션유지
	//실행 방법 - 실행 후 10초 안에 새로 고침(F5)해 보세요.
	//			실행 후 10초 후에 새로 고침(F5)해 보세요.
	//10초 후 새로운 세션 ID로 생성됩니다.
	
%>

<%!
	public String dateTime(long millis){
		String pattern = "yyyy-MM-dd E요일 HH:mm:ss.SS";
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		String date = (String)formatter.format(new Timestamp(millis));
		return date;
}
%>

<%
	long createTime = session.getCreationTime();
	long lastTime = session.getLastAccessedTime();
%>
<!DOCTYPE html>
<html>
<head>
<title>Session Test</title>
</head>
<body>
	<h2>세션 테스트</h2>
		isNew(): <%=session.isNew() %><br>
		세션 생성시간: <%=dateTime(createTime) %><br>
		최종 접속시간: <%=dateTime(lastTime) %><br>
		세션ID: <%=session.getId() %><br>
</body>
</html>