<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
 <script src="../js/jquery-3.3.1.js"></script>
 <script>
 $(function(){
	 $.ajaxSetup({
		 cache:false
	 });
	$("button").click(function(){	//변경을 클릭하면
		$("button").text("로딩완료").css('color','red');
		
		$("#container").load("resource1.html");
		
		
	}) ;
 });
 </script>
</head>
<body>
<button>서버로부터 데이터 가져오기</button>
<div id="container"> 데이터 가져오기 전</div>

</body>
</html>