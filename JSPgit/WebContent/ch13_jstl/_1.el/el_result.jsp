<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<title>EL ���尴ü ��� ����</title>
</head>

<body>
<h1>�Ѿ�� �̸��� :  ${param.name }</h1>

<h1>�Ѿ�� ��̴� : ${paramValues.hobby[0] }, ${paramValues.hobby[1] }</h1>

</body>
</html>