<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ������</title>
</head>
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>
	<script src = "./ch12_db/_8.member/join.js"></script>
<body>
	<form name="joinform" action="joinProcess.net" method="post">
	<h1>ȸ������ ������</h1>
	<hr>
	<b>���̵�</b>
	<input type="text" name="id" id="id" placeholder="Enter id" ><br>
	<b>��й�ȣ</b>
	<input type="password" name="pass" id="pass" placeholder="Enter password" ><br>
	<b>�̸�</b>
	<input type="text" name ="name" id="name" placeholder="Enter name" ><br>
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