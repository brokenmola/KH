<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="m" value="${ memberinfo}"/>
<!DOCTYPE html>
<html>
<head>
<title>ȸ�� ���� ������</title>
</head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src = "./member/update.js"></script>
<script>
	$(document).ready(function(){
		var pandan = '${m.gender}';
		if(pandan== '��'){
			$("input:radio").eq(0).attr('checked','checked');
		}else{	
			$("input:radio").eq(1).attr('checked','checked');
		}
		$(".cancelbtn").click(function(){
			location.href="main.net";
		})
	});
</script>
<body>

<form name="joinform" action="updateProcess.net" method="post">
	<h1>ȸ������ ������</h1>
	<hr>
	<b>���̵�</b>
	<input type="text" name="id" placeholder="Enter id" value="${m.id }" readonly><br>
	<b>��й�ȣ</b>
	<input type="password" name="pass" id="pass" placeholder="Enter password" value="${m.password }" ><br>
	<b>�̸�</b>
	<input type="text" name ="name" id="name" placeholder="Enter name"  value="${m.name }" ><br>
	<b>����</b>
	<input type="text" name="age" id="age" maxlength=2 placeholder="Enter age" value="${m.age }" ><br>
	<b>����</b>
	<div>
	<input type="radio" name="gender"  value="��" ><span>����</span>
	<input type="radio" name="gender"  value="��" ><span>����</span>
	
	</div><br>
	<b>�̸��� �ּ�</b>
	<input type="text" name="email" id="email" placeholder="Enter email" value="${m.email }" ><br><br>
	<div class="clearfix">
		<input type="submit" class="submitbtn" value="����">
		<input type="button" class="cancelbtn" value="���">
	</div>
	</form>
</body>
</html>