<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
 <head>
  <style> 
      body{text-align:center}
  </style>
 </head>
 <body>
  <%
	//session.removeAttribute("id");//id�Ӽ� �����մϴ�.
	session.invalidate();
  %>
  <h3>�α׾ƿ� �Ǿ����ϴ�.</h3>
  <a href="login.jsp">�α��� �������� �̵�</a>
 </body>
</html>