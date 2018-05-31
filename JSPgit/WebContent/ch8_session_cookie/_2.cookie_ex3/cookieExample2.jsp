<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		//쿠키 객체를 생성하고 language1란 쿠키 이름에
		//입력받은 language설정 값을 저장합니다.
		Cookie cookie = new Cookie("language1", request.getParameter("language"));
		
		//시간을 설정하지 않으면(setMaxAge()메소드 사용하지 않을 때)
		//브라우저 종료시 쿠키도 삭제됩니다.
		//메서드를 호출할 때 인자 값으로 0을 주면 쿠키는 삭제 됩니다.
		cookie.setMaxAge(60*60*24);	//쿠키의 우효시간을 24시간으로 설정합니다.
		
		response.addCookie(cookie);	//클라이언트로 쿠키값을 전송합니다.
	%>
	<script>
		/*cookieExample.jsp로 돌아갑니다.*/
		location.href="cookieExample.jsp"
	</script>
</body>
</html>