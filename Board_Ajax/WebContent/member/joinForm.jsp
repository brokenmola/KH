<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ������</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function(){
		var data_check = -1; //���̵� �ߺ� Ȯ�� ��ư Ŭ�� ������ Ȯ���ϱ� ���� ����
							//���̵� �����Ͽ� ��� �Ұ����� �ǹ�
		var sid, sid2;
		$("#message").css('diplay', 'none');//������ ����ϴ�.
		$("#idcheck").click(function(){
			if($("input[name=id]").val()==''){
				alert('���̵� �Է��ϼ���');
				$("input[name=id]").focus();
				return false;
			}
			sid=$("input[name=id]").val();
			$.ajax({
				type : "GET",
				url : "IdcheckAjax.net",
				data : {"id" : $("input[name=id]").val()},
				success : function(response){
					data_check = response;
					$("#message").empty();
					$("#message").show();
					if(response ==1){
						$("#message").append("��� ������ ���̵� �Դϴ�.");
						$("#message").css('color','red');
					}else{
						$("#message").append("�ߺ��� ���̵� �Դϴ�.");
						$("#message").css('color','red');
						$("input[name=id]").val('');
						$("input[name=id]").focus();
					}
				},
					error:function(){
						alert("data error2");
					}
			})//ajax end
		})//click end

	$('form').submit(function(){
		sid2 = $("input[name=id]").val();//��� ������ ���̵��ε� ������ ���
		//�ߺ�üũ �� ��� ������ ���̵�� �޽��� �������� ���̵� �����ϰ� �ߺ� üũ���� ���� ���
		if(data_check == -1 || sid != sid2){
			alert("ID �ߺ� üũ �ϼ���");
			return false;
		}
		if(!$.isNumeric($("input[name='age']").val())){
			alert("���̴� ���ڷ� �Է��ϼ���");
			$("input[name='age']").val('');
			$("input[name='age']").focus();
			return false;
		}
	})//submit end
})//ready end
	
</script>
</head>
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>
	<script src = "./member/join.js"></script>
	<link href ="css/join.css" rel="stylesheet">
<body>
	<form name="joinform" action="joinProcess.net" method="post">
	<h1>ȸ������ ������</h1>
	<hr>
	<b>���̵�&nbsp;<input type="button" id="idcheck" value="�ߺ� �˻�" required>
	<b id="message"></b></b>
	<input type="text" name="id" id="id" placeholder="Enter id" required><br>
	<b>��й�ȣ</b>
	<input type="password" name="pass" id="pass" placeholder="Enter password" required><br>
	<b>�̸�</b>
	<input type="text" name ="name" id="name" placeholder="Enter name" required><br>
	<b>����</b>
	<input type="text" name="age" id="age" maxlength=2 placeholder="Enter age"><br>
	<b>����</b>
	<div>
		<input type="radio" name="gender" value="��" checked><span>����</span>
		<input type="radio" name="gender" value="��" ><span>����</span>
	</div><br>
	<b>�̸��� �ּ�</b>
	<input type="text" name="email" id="email" placeholder="Enter email" ><br><br>
	<div class="clearfix">
		<button type="submit" class="submitbtn">ȸ������</button>
		<button type="reset" class="cancelbtn">�ٽ��ۼ�</button>
	</div>
	</form>
</body>
</html>