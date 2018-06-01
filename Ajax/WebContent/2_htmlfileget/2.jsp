<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
 <style>
 div{float:left; width:180px; height:80px; margin:3px}
 </style>
 <script src="../js/jquery-3.3.1.js"></script>
 <script>
 /*
  - jQuery에서 제공해주는 load()함수를 사용해서 서버의 menu.html 페이지의 데이터를 가져와서
  	특정 엘리먼트에 추가합니다.
 */
 $(function(){
	 $.ajaxSetup({
		 cache:false
	 });
	$("#menu1").click(function(){
		//load()함수를 이용해서 menu.html문서 전체를 로드하여
		//id가 message1인 엘리먼트에 넣습니다.
		$("#message1").load("menu.html");
	}) ;
	
	$("#menu2").click(function(){
		//load()함수를 이용해서 menu.gtml 문서의 내용중 li엘리먼트만 읽어서
		// id가 message2인 엘리먼트에 넣습니다.
		$("#message2").load("menu.html li");
	}) ;
 });
 </script>

</head>
<body>
<div>
	<a href ="#" id="menu1">메뉴 보기 1</a><p>
	<span id="message1">하하</span>
</div>

<div>
	<a href ="#" id="menu2">메뉴 보기 2</a><p>
	<span id="message2"></span>
</div>
</body>
</html>