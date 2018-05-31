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
	//session.removeAttribute("id");//id속성 제거합니다.
	session.invalidate();
  %>
  <h3>로그아웃 되었습니다.</h3>
  <a href="login.jsp">로그인 페이지로 이동</a>
 </body>
</html>