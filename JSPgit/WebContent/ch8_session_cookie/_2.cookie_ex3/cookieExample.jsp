<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String language = "korea";

	//header의 이름 중에서 cookie의 값을 가져옵니다.
	String cookie = request.getHeader("Cookie");
	
	//쿠키가 존재하지 확인합니다.
	if(cookie != null){
		//존재하는 쿠키 들을 배열로 가져옵니다.
		Cookie cookies[] = request.getCookies();
		
		//쿠키의 이름이 "language1"의 값을 찾기 위해 쿠키 배열들을 모두 확인합니다.
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("language1")){
				language = cookies[i].getValue();
			}
		}
		out.println(language);
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<style>
		body{text-align: center}
		fieldset{
			box-sizing: border-box;
			padding: 10px;
			width: 600px;
			align: center;
			margin: 0 auto;}
	</style>
	<script src="../../js/jquery-3.3.1.js"></script>
	<script>
		$(document).ready(function(){
			var id = "input[value='<%=language %>']";
			$(id).attr('checked', 'checked');
		});
	</script>
</head>
<body>
		<%
			if(language.equals("korea")){
		%>
			<h3>안녕하세요. 이것은 쿠키 예제입니다.</h3>
		<%
			} else {
		%>
			<h3>Hello. This is Cookie example.</h3>
		<%
			}
		%>
	<fieldset>
		<form action="cookieExample2.jsp" method="post">
			<input type="radio" name="language" value="korea">한국어 페이지 보기
			<input type="radio" name="language" value="english">영어 페이지 보기
			<input type="submit" value="설정">
		</form>
	</fieldset>
</body>
</html>