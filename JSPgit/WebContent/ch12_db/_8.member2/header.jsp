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
	<h3>������ <%=id %>�� ȯ���մϴ�.</h3>
<%
	} else {
%>
	<h3>�Ϲ�ȸ�� <%=id %>�� ȯ���մϴ�.</h3>
	<% }
	}%>
(<a href="updateForm.net">��������</a>)
(<a href="logout.net">�α׾ƿ�</a>)
<hr>