<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%@ page import="java.sql.*" %>
    
<%
	Connection conn = null; // Connection ��ü ����
	
	//JDBC����̹� �̸��� �����մϴ�.(DBMS���� �ٸ��ϴ�.)
	String driver = "oracle.jdbc.driver.OracleDriver";
	
	//JDBC����̹��� ����Ͽ� ������ URL �Դϴ�.
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Boolean connect = false;
	try{
		//JDBC ����̹� �̸����� ����̹��� �ε��Ϻ��.
		Class.forName(driver);
		
		//�����ߴ� JDBC URL �� �̿��Ͽ� Connection ��ü�� ��� �ɴϴ�.
		conn = DriverManager.getConnection(url,"scott","tiger");
		connect = true;
		conn.close();//�����ͺ��̽����� ������ �����մϴ�.		
	}catch(Exception e){
		connect = false;
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<title>JDBC ���� �׽�Ʈ ����</title>
</head>
<body>
	<h3>
		<%
			if(connect == true){
		%>
		����Ǿ����ϴ�.
		<%}else{ %>
		���ῡ �����Ͽ����ϴ�.
		<%} %>
	</h3>
</body>
</html>