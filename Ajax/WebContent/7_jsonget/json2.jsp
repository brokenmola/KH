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
 .done() : 요청이 성공적으로 처리되었을 때 발생하는 이벤트 메서드 입니다.
 .fail() : 요청이 실패했을 때 발생하는 이벤트 메서드입니다.
 .always() : 요청에 대한 처리가 (성공했든 실패했든) 완료되었을 때 발생하는 이벤트입니다.
 */
 
	$(function(){
		$.ajaxSetup({cache:false});
		$("button").one('click', function(){ //버튼을 클릭하면 한번만 실행됨
			
			$.getJSON("item.json")
			.done(function(data, textStatus){
				//.getJSON()을 사용할 경우에는 키를 알고 있어야 값을 구할 수 있습니다.
				$('#treeData').append(
					'<tr><td>id</td><td>name</td><td>price</td><td>description</td></tr>'); 
				
				$(data).each(function(){
					$('#treeData').append(
							"<tr>"
							+"<td>"+$(this).attr('id')+"</td>"
							+"<td>"+$(this).attr('name')+"</td>"
							+"<td>"+$(this).attr('price') + "</td>"
							+"<td>"+$(this).attr('description') + "</td></tr>");
				})	//each end
				})	//done end
				
			.fail(function(data, status){
				alert("error 입니다." + status);
			})	//fail end
			
			.always(function(){
				alert("아작스가 완료되었습니다.");
			})	//always end
			
				});
			});
	

</script>
</head>
<body>
<button>JSON 데이터를 불러옵니다.</button>
<table border="1">
	<tbody id="treeData"></tbody>
</table>

</body>
</html>