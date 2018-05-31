<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	boolean isIDShow = false;
	String id = "";
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				isIDShow = true;
				id=cookies[i].getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<script src="../../js/jquery-3.3.1.js"></script>
	<script>
		$(document).ready(function(){
			
			$('form').submit(function(event){
				var id = $.trim($('#id').val())
				if(id == ""){
					alert('아이디를 입력하세요.');
					$('#id').focus();
					event.preventDefault();
				}
				
				var pass = $.trim($('#pass').val());
				if( pass.length < 4){
					alert("비밀번호를 4자 이상 입력하세요.")
					$('#pass').focus().val("");
					event.preventDefault();
				}

			});
			
			$('#idCheck').change(function(){
				var ch_id = $('#id').val();
				if($('#idCheck').is(":checked")){
					$('#id').css('background-color', 'yellow');
				} else {
					$('#id').css('background-color', 'white');
				}
			});
			
			var isIDShow = <%=isIDShow %>;
			if(isIDShow){
				$("#id").val('<%=id %>');
				$("#id + input").attr('checked', 'checked');
			}

		});
	</script>
</head>
<body>
	<form action="loginprocess.jsp" method="post">
		아이디 : <input type="text" name="id" id="id" placeholder="Enter id..." required>
		<input type="checkbox" id="idCheck" name="idCheck" value="store">ID 기억하기<br>
		비밀번호 : <input type="password" name="pass" id="pass" maxlength="4" required><br>
		<div class="clearfix">
			<button type="submit" class="submitbtn">전송</button>
			<button type="reset" class="cancelbtn">취소</button>
		</div>
	</form>
</body>
</html>