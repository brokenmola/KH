<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%-- Connection 객체와 JNDI를 사용하기 위한 패키지를 import합니다. --%>
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
		
		//CallableStatement를 객체를 생성합니다.
		cs = conn.prepareCall(sql);
		cs.execute();
		
		out.print("성공적으로 프로시저를 실행했습니다.");		
	}catch(Exception e){
		out.println("프로시저를 실행하지 못했습니다.");
		e.printStackTrace();
	}finally{
		if(cs!=null)
			try{
				cs.close();
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