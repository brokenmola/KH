<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	Connection conn = null;
	String sql= "select num, name from student";
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	try{
		//Context.xml�� ���ҽ��� ������ ���� (JNDI�� ������ ����) OracleDB�� �����Ͽ� Connection
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(sql);
		
		out.print("<table border=\"1\">");
		out.print("<tr><th>��ȣ</th><th>�̸�</th></tr>");
		while(rs.next()){
			out.print("<tr><td>" +rs.getInt("num") + "</td><td>"+ rs.getString("name")+"</td></tr>");
		}
		out.print("</table>");
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
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>