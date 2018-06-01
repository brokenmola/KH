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
		var data = $("#insert_form").serialize();
		
		$.getJSON("products2.jsp", data, function(rdata){
			$(rdata).each(function(){
					var output ='';
					output += "<tr>";
					output += "<td>"+$(this).attr('id')+"</td>";
					output += "<td>"+$(this).attr('name')+"</td>";
					output += "<td>"+$(this).attr('modelnumber') + "</td>";
					output += "<td>"+$(this).attr('series') + "</td></tr>";
					$('#hi').append(output);
			});
			});//getJSON end
	}//function end
	
	// 초기 화면에 데이터를 표시합니다.
	selectData();
	
		$("#insert_form").submit(function(){ //버튼을 클릭하면
			if($("#name").val()==""){
				alert('상품명을 입력해주세요');
				return false;
			}
			if($("#modelnumber").val()==""){
				alert('모델번호를 입력해주세요');
				return false;
			}
			if($("#series").val()==""){
				alert('시리즈를 입력해주세요');
				return false;
			}
			selectData();
			
			//기본 이벤트를 제거합니다.
			event.preventDefault();
		});	//submit end
});	//ready end

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