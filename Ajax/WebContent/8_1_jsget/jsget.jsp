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
/*
 - 현재 파일에서 자바스크립트 파일(test.js)을 get방식으로 요청하는 예제
 - 자바스크립트 파일을 로드하기 위해서 $.getScript() 메서드를 사용합니다.
 */
	$(function(){
		//자바스크립트 파일(test.js)을 $.getScript()메서드로 읽어 들여 이안에서 사용합니다.
		$.getScript("test.js");
		$("#submit").click(function(){ //버튼을 클릭하면
			
			/*
			Hello() : 자바스크립트 파일(test.js)에서 정의한 Hello()함수를 호출합니다.
			$('.username').val() : 클래스가 username인 선택자에 저장된 값을 가져옵니다.
			Hello($('.username').val()) : Hello('홍길동') 형식으로 호출합니다.
			Hello()함수 호출한 결과를 돌려 받아서 msg변수에 저장합니다.
			*/
			var msg=Hello($('.username').val());
			$('#message').html(msg); //msg를 div태그 영역에 html형식으로 출력합니다.
		
			
				});
			});
	

</script>
</head>
<body>
<form>
	<label> 이름을 입력하세요 : </label>
	<input type="text" name="username" class="username"><br>
	<input type="button" id="submit" value="전송"><br>
	<div id="message"></div>
</form>
</body>
</html>