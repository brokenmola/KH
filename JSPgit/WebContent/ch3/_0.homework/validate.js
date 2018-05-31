$(document).ready(function(){
	$('form').submit(function(event){
		if($.trim($('#id').val()) == ""){
			alert('���̵� �Է��ϼ���.');
			$('#id').focus();
			event.preventDefault();
		}
		
		if($.trim($('#pass').val().length) < 6){
			alert("��й�ȣ�� 6�� �̻� �Է��ϼ���.")
			$('#pass').focus().val("");
			event.preventDefault();
		}
		
		if($.trim($('#email').val()) == ""){
			alert('�̸����� �Է��ϼ���.');
			$('#email').focus();
			event.preventDefault();
		}
		
		if($.trim($('#domain').val()) == ""){
			alert('�������� �Է��ϼ���.');
			$('#domain').focus();
			event.preventDefault();
		}
		
		if($('#gender1').is(':checked') == false && 
				$('#gender2').is(':checked') == false){
			alert('����, ���� �߿��� �����ϼ���.')
			event.preventDefault();
		}
		
		var checkbox = $('input[type=checkbox]:checked');
		if(checkbox.length < 2){
			alert("��̸� 2�� �̻� �Է��ϼ���.");
			event.preventDefault();
		}
		
		if($.trim($('#post1').val()) == ""){
			alert("�����ȣ ���ڸ��� �Է��ϼ���.");
			$('#post1').focus();
			event.preventDefault();
		} else if($.trim($('#post2').val()) == ""){
			alert("�����ȣ�� ���ڸ��� �Է��ϼ���.");
			$('#post2').focus();
			event.preventDefault();
		}
		
		if($.trim($('#address').val()) == ""){
			alert("�ּҸ� �Է��ϼ���.");
			$('#address').focus();
			event.preventDefault();
		}
		
		if($.trim($('#intro').val()) == ""){
			alert("�ڱ�Ұ��� �ۼ��ϼ���.");
			$('#intro').focus();
			event.preventDefault();
		}
		
		if(isNaN($('#jumin1, #jumin2').val())){
			alert('���ڸ� �Է��ϼ���.');
			event.preventDefault();
		}  else {
			if($.trim($('#jumin1').val().length) < 6){
				alert("�ֺ��ȣ �� 6�ڸ��� �Է��ϼ���.");
				$('#jumin1').focus();
				event.preventDefault();
			} else if($.trim($('#jumin2').val().length) < 7){
				alert("�ֺ��ȣ �� 7�ڸ��� �Է��ϼ���.");
				$('#jumin2').focus();
				event.preventDefault();
			}
		}
	});
	
	$('#jumin1, #jumin2').on('keyup', function(){
		if(isNaN($(this).val())){
			alert('���ڸ� �Է��ϼ���.');
			$(this).focus();
			return false;
		} 
	});
	
	$('#idcheck').on('click', function(){
		if($('#id').val() == ""){
			alert('���̵� �Է��ϼ���.');
			$('#id').focus();
			return false;
		} else {
			var ref = "idcheck.html";
			window.open('', 'idcheck', 'width=300, height=300');
		}
	});
	
	$('#postcode').on('click', function(){
		if($('#post1').val() == ""){
			alert("�����ȣ ���ڸ��� �Է��ϼ���.");
			$('#post1').focus();
			return false;
		} else if($('#post2').val() == ""){
			alert("�����ȣ�� ���ڸ��� �Է��ϼ���.");
			$('#post2').focus();
			return false;
		} else {
			var ref = "postSearch.html";
			window.open('', 'postSearch', 'width=300, height=300');
		}
	});
	
	$('#sel').on('change', function(){
		if($("#sel").val() == ""){
			$("#domain").val("").focus();
			$('#domain').attr("disabled", false);
		} else {
			$("#domain").val($("#sel").val());
			$("#domain").attr("disabled", "disabled");
		}
		

		
	})

});