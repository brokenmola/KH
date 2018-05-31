<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%-- Connection 객체와 JNDI를 사용하기 위한 패키지를 import합니다. --%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	Connection conn = null;
	String sql="SELECT*FROM student";
	PreparedStatement pstmt = null;
	ResultSetMetaData rsmd = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		
		//sql문을 실행하여 가져온 레코드들은 ResultSet 객체에 저장합니다.
		ResultSet rs = pstmt.executeQuery();
		rsmd = rs.getMetaData();
		
		out.println("컬럼 수 : " + rsmd.getColumnCount() + "<br>");
		for(int i =1; i<rsmd.getColumnCount(); i++){
			out.println(i + "번째 컬럼의 이름 : " + rsmd.getColumnName(i) + "<br>");
			out.println(i + "번째 컬럼의 타입 이름 : " + rsmd.getColumnTypeName(i) + "<br>");
		}		
	}catch(Exception e){
		out.println("프로시저를 실행하지 못했습니다.");
		e.printStackTrace();
	}finally{
		if(pstmt!=null)
			try{
				pstmt.close();
			}catch(SQLException ex){ex.printStackTrace();}
		if(conn!=null)
			try{
				//close()메소드 실행 후에는 오라클에서 roll back 수행 안됩니다.
				//자원 회수 되면서 오라클에서 자동 커밋이 되었기 때문입니다.
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