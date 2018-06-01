<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table{table-layout: auto; width:450px; height:300px; text-align: center; margin: 0 auto}
</style>
<title>JSON 예제</title>
<script src="../js/jquery-3.3.1.js"></script>
<%request.setCharacterEncoding("UTF-8"); %>
<script>

 $(function(){
	$("form").submit(function(){
		// 서버로 보낼 데이터를 입력창에서 얻어옵니다.
		// serialize()메서드는 입력 양식에 적힌 값을 쿼리 문자열로 바꿉니다.
		var data = $(this).serialize(); //username=홍길동&userage=15
		$.ajax({
			type : "POST",
			data : data,
			url : "welcome.jsp",	//문자열 형식의 데이터를 welcome.jsp로 전달합니다.
			success : function(msg){	//서버의 welcome.jsp
				$('#message').html(msg);
				//<div>태그는 영역을 설정하기 위한 태그입니다.
				//영역 설정된 곳에 msg를 html화 합니다.
				// 서버로부터 받은 데이터를 id가 message인 엘리먼트에 설정합니다.
			}

		
		

					
		});//post end
		return false;
				});
			});
	

</script>
</head>
<body>
<form>
	<label> 이름을 입력하세요 : </label>
	<input type="text" name="username"><br>
	<label> 나이를 입력하세요 : </label>
	<input type="text" name="userage"><br>
	<input type="submit" value="전송"><br>
</form>
<div id="message"></div>
</body>
</html>