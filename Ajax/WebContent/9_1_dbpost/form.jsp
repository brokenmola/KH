<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>JSON 예제</title>
<script src="../js/jquery-3.3.1.js"></script>
<%request.setCharacterEncoding("UTF-8"); %>
<script>

$(function(){
	function selectData(){
		$('#hi').empty();
		
		// ajax를 수행합니다.
		$.getJSON("products.jsp", function(data, textStatus){
			$(data).each(function(){
				$('#hi').append(
						"<tr>"
						+"<td>"+$(this).attr('id')+"</td>"
						+"<td>"+$(this).attr('name')+"</td>"
						+"<td>"+$(this).attr('modelnumber') + "</td>"
						+"<td>"+$(this).attr('series') + "</td></tr>");
			});
			});
	}

		$("form").submit(function(){ //버튼을 클릭하면
			
			var data = $(this).serialize();
			$.ajax({
				type : "POST",
				data : data,
				url : "insert_form.jsp",
				success : selectData()
			})
			return false;
			
		});
});
</script>
</head>
<body>
  <div>
    <form id="insert_form">
      <fieldset>
        <legend>데이터 추가</legend>
        <table>
          <tr>
            <td><label>상품명</label></td>
            <td><input type="text" name="name" id="name"></td>
          </tr>
          <tr>
            <td><label>모델 번호</label></td>
            <td><input type="text" name="modelnumber" id="modelnumber"></td>
          </tr>
          <tr>
            <td><label>시리즈</label></td>
            <td><input type="text" name="series" id="series"></td>
          </tr>          
        </table>
        <input type="submit" value="추가">
      </fieldset>
    </form>
  </div>
  
<table border="1">
	<thead>
		<tr>
			<td>id</td>
			<td>name</td>
			<td>modelnumber</td>
			<td>series</td>
		</tr>
	</thead>
	<tbody id="hi"></tbody>
</table>



</body>
</html>