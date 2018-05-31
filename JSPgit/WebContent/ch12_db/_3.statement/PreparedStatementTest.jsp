<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	Connection conn = null;
	String sql= "INSERT INTO student(num, name) VALUES (?, 'ȫ�浿')";
	PreparedStatement pstmt =null;
	try{
		//Context.xml�� ���ҽ��� ������ ���� (JNDI�� ������ ����) OracleDB�� �����Ͽ� Connection
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		//������ Connection ���並 ����Ͽ� PreparedStatement ��ü�� �����մϴ�.
		//�̸� ����� SQL���� ���ڷ� �ѱ�ϴ�.
		pstmt = conn.prepareStatement(sql);
		
			for(int i =1; i<11; i++){
				pstmt.setInt(1,i);//ù��° �μ�(num�ʵ�)�� i���� �����մϴ�.
				if(pstmt.executeUpdate()!=0){
				out.println("<h3>"+i+"�����ڵ尡 ��ϵǾ����ϴ�.</h3>");
					}
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