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
		out.println("<h3>���ڵ� ��Ͽ� �����߽��ϴ�.</h3>");
		e.printStackTrace();
	}finally{
		if(pstmt!=null){
			try{
				pstmt.close();//��ü�� ����ϰ� �޸𸮿� ��ȯ�մϴ�. �޸� ���� ���� �� �ֽ��ϴ�.
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
<title>ȸ�� ����</title>
</head>
<body>
	<form>
		<table>
			<tr>
				<td colspan="2">ȸ�� ����</td>
			</tr>
			<tr>
				<td>ID</td>
				<td><%=getid %></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><%=getpass %></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><%=getname %></td>
			</tr>
			<tr>
				<td>����</td>
				<td><%=getage %></td>
			</tr>
			<tr>
				<td>����</td>
				<td><%=getgender %></td>
			</tr>
			<tr>
				<td>Email �ּ�</td>
				<td><%=getemail %></td>
			</tr>
			<tr>
				<td><a href="member_list.net">����Ʈ�� ���ư���</a></td>			
			</tr>
		</table>
	</form>
</body>
</html>