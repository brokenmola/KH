<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table{table-layout: auto; width:300px; height:300px; text-align: center; margin: 0 auto}
</style>
<title>CSV(Comma Separated Values) 예제</title>
<script src="../js/jquery-3.3.1.js"></script>
<%request.setCharacterEncoding("UTF-8"); %>
<script>

/*
 * jQuery.get() = $.get()
 - 서버에 데이터를 HTTP GET방식으로 보내고 서버측 응답을 XML, CSV형식으로 받습니다.
 - $.get() 함수를 이용해서 data.csv 파일을 불러옵니다.
 - $.get() 함수의 첫 번째 매개변수에는 서버의 URL 주소를 지정합니다.
 - $.get() 함수의 두번째 매개변수인 콜백함수를 이용해서 서버에서 보내온 csv 형식의
 	데이터를 input으로 받습니다.
 */
 
	$(function(){

		$("button").click(function(){ //버튼을 클릭하면
			//input에는 data.csv의 내용이 들어 있습니다.
			
			$.get("data2.csv", function(input){
				//한 줄씩 자릅니다.
				input = input.split('\n');
				$('pre').empty(); // pre태그 안을 비웁니다.
				var str="";
				str += '<table border="1"><tr>' + '<td>이름</td><td>지역</td><td>나이</td></tr>';
				
				for(var i=0; i<input.length; i++){
					//쉼표를 기준으로 자릅니다.
					input[i] = input[i].split(',');
					
					str += '<tr>';
					
					for(var j=0; j<input[i].length; j++){
						input[i][j] = input[i][j].trim();
						str += '<td>' + input[i][j] + '</td>';
					}
					str += '</tr>';
				}
				str += '</table>';
				$('pre').append(str);
			})
		})
	})
	

</script>
</head>
<body>
<button>데이터 불러오기</button>
<pre>변경전</pre>

</body>
</html>