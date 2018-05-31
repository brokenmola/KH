<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.io.*" %>
<script>
	alert('로그아웃되었습니다.');
	location.href = "login.net";
</script>
<%
	session.invalidate();
%>
