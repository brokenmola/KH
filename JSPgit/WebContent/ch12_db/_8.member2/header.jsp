<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>

<%
	String id = (String)session.getAttribute("id");

	if(id==null){
		out.println("<script>");
		out.println("location.href='login.net'");
		out.println("</script>");
		out.close();
	}else{
		if(id.equals("admin")){
%>
	<h3>관리자 <%=id %>님 환영합니다.</h3>
<%
	} else {
%>
	<h3>일반회원 <%=id %>님 환영합니다.</h3>
	<% }
	}%>
(<a href="updateForm.net">정보수정</a>)
(<a href="logout.net">로그아웃</a>)
<hr>