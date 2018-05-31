<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	div{background-color: green;
		text-align: right;
		color: white;
		padding: 10px;
		}
	a{text-decoration: none;
		color: white;}
	a:hover{font-weight: border;}
</style>
<%
	String id = (String)session.getAttribute("id");
	if(id.equals("admin")){
%>
	<div>관리자 <%=id %>님 환영합니다.
		<a href="logout.jsp">(로그아웃)</a></div>
<%
	} else {
%>
	<div>일반회원 <%=id %>님 환영합니다.
		<a href="logout.jsp">(로그아웃)</a></div>
<%
	}
%>
<hr>