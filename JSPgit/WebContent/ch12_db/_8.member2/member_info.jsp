<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String id = (String)session.getAttribute("id");
	String getid ="";
	String getpass ="";
	String getname ="";
	int getage =0;
	String getgender ="";
	String getemail ="";

%>
<%
	Connection conn = null;
	String sql= "SELECT *FROM member WHERE id=?";
	PreparedStatement pstmt =null;
	ResultSet rs= null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
		getid=rs.getString(1);
		getpass=rs.getString(2);
		getname=rs.getString(3);
		getage=rs.getInt(4);
		getgender=rs.getString(5);
		getemail=rs.getString(6);
		
		}
			
	}catch(Exception e){
		out.println("<h3>레코드 등록에 실패했습니다.</h3>");
		e.printStackTrace();
	}finally{
		if(pstmt!=null){
			try{
				pstmt.close();//객체를 사용하고 메모리에 반환합니다. 메모리 낭비를 막을 수 있습니다.
			}catch(SQLException ex){ex.printStackTrace();}
		if(conn!=null)
			try{conn.close();}
			catch(SQLException ex){ex.printStackTrace();}
		if(rs!=null)
			try{rs.close();}
			catch(SQLException ex){ex.printStackTrace();}
		}
	}
%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보</title>
</head>
<body>
	<form>
		<table>
			<tr>
				<td colspan="2">회원 정보</td>
			</tr>
			<tr>
				<td>ID</td>
				<td><%=getid %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=getpass %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=getname %></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><%=getage %></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%=getgender %></td>
			</tr>
			<tr>
				<td>Email 주소</td>
				<td><%=getemail %></td>
			</tr>
			<tr>
				<td><a href="member_list.net">리스트로 돌아가기</a></td>			
			</tr>
		</table>
	</form>
</body>
</html>