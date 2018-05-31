<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%-- Connection ��ü�� JNDI�� ����ϱ� ���� ��Ű���� import�մϴ�. --%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	Connection conn = null;
	String sql;
	CallableStatement cs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		sql = "{call dell_all()}";
		
		//CallableStatement�� ��ü�� �����մϴ�.
		cs = conn.prepareCall(sql);
		cs.execute();
		
		out.print("���������� ���ν����� �����߽��ϴ�.");		
	}catch(Exception e){
		out.println("���ν����� �������� ���߽��ϴ�.");
		e.printStackTrace();
	}finally{
		if(cs!=null)
			try{
				cs.close();
			}catch(SQLException ex){ex.printStackTrace();}
		if(conn!=null)
			try{
				//close()�޼ҵ� ���� �Ŀ��� ����Ŭ���� roll back ���� �ȵ˴ϴ�.
				//�ڿ� ȸ�� �Ǹ鼭 ����Ŭ���� �ڵ� Ŀ���� �Ǿ��� �����Դϴ�.
				conn.close();
			}catch(SQLException ex){ex.printStackTrace();}
		
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