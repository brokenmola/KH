<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CSV(Comma Separated Values) 예제</title>
<script>
	var input = '';
	input += '홍 길동, 서울시, 25세\n';
	input += '신사임당, 울산시, 45세';
	
	//한 줄씩 자릅니다.
	input = input.split('\n');
	for(var i=0; i<input.length; i++){
		//쉼표를 기준으로 자릅니다.
		input[i] = input[i].split(',');
		for(var j=0; j<input[i].length; j++){
			input[i][j] = input[i][j].trim();
			//alert(input[i][j])
			console.log(input[i][j]);
		}
		
	}
</script>
</head>
<body>

</body>
</html>