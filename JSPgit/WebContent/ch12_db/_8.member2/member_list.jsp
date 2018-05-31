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
		//Context.xml에 리소스를 생성해 놓은 (JNDI에 설정해 놓은) OracleDB를 참조하여 Connection
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<form>
		<table>
			<tr>
				<th colspan="2">회원 목록</th>
			</tr>
	<% while(rs.next()){
		String getid =rs.getString("id");
	%>
			<tr>
				<td><a href ="member_info.jsp?id=<%=getid %>">
				<%=rs.getString("id") %></a></td>
				<td><a href="member_delete.jsp?id=<%=getid %>">삭제</a></td>
			</tr>
	<%} %>
		</table>
	</form>
</body>
<%	
	}catch(Exception e){
		out.println("<h3>레코드 등록에 실패했습니다.</h3>");
		e.printStackTrace();
	}finally{
		if(rs!=null)
			try{
				rs.close();
			}catch(SQLException ex){ex.printStackTrace();}
		if(pstmt!=null){
			try{
				pstmt.close();//객체를 사용하고 메모리에 반환합니다. 메모리 낭비를 막을 수 있습니다.
			}catch(SQLException ex){ex.printStackTrace();}
		if(conn!=null)
			try{
				conn.close();
			}catch(SQLException ex){ex.printStackTrace();}
		
		}
	}
%>
</html>