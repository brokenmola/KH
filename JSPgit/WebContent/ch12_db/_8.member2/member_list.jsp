<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	String sql= "SELECT id FROM member";
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	try{
		//Context.xml�� ���ҽ��� ������ ���� (JNDI�� ������ ����) OracleDB�� �����Ͽ� Connection
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>ȸ�� ���</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<form>
		<table>
			<tr>
				<th colspan="2">ȸ�� ���</th>
			</tr>
	<% while(rs.next()){
		String getid =rs.getString("id");
	%>
			<tr>
				<td><a href ="member_info.jsp?id=<%=getid %>">
				<%=rs.getString("id") %></a></td>
				<td><a href="member_delete.jsp?id=<%=getid %>">����</a></td>
			</tr>
	<%} %>
		</table>
	</form>
</body>
<%	
	}catch(Exception e){
		out.println("<h3>���ڵ� ��Ͽ� �����߽��ϴ�.</h3>");
		e.printStackTrace();
	}finally{
		if(rs!=null)
			try{
				rs.close();
			}catch(SQLException ex){ex.printStackTrace();}
		if(pstmt!=null){
			try{
				pstmt.close();//��ü�� ����ϰ� �޸𸮿� ��ȯ�մϴ�. �޸� ���� ���� �� �ֽ��ϴ�.
			}catch(SQLException ex){ex.printStackTrace();}
		if(conn!=null)
			try{
				conn.close();
			}catch(SQLException ex){ex.printStackTrace();}
		
		}
	}
%>
</html>