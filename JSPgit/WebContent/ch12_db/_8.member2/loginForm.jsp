<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<title>�α��� ������</title>
</head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src = "login.js"></script>
<script>
	$(function(){
		$(".join").click(function(){
			location.href="join.net";
		})
	})
</script>
<body>
<h1>�α���</h1>
<hr>
	<form name ="loginform.jsp" action="loginProcess.net" method="post">
		���̵� : <input type="text" name="id" id="id" placeholder="Enter id..." ><br>
		��й�ȣ : <input type="password" name="pass" id="pass" ><br>
	<hr>
		<div class="clearfix">
			<button type="submit" class="submitbtn">�α���</button>
			<input type="button" class="join" value="ȸ������">
		</div>
	</form>
</body>
</html>