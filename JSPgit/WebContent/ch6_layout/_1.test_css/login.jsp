<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="login" method="post">
		아이디 : <input type="text" name="id" placeholder="Enter id..." required><br>
		비밀번호 : <input type="password" name="passwd" required><br>
		<div class="clearfix">
			<button type="submit" class="submitbtn">전송</button>
			<button type="reset" class="cancelbtn">취소</button>
		</div>
	</form>
</body>
</html>