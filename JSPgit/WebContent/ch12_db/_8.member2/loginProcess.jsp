<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
%>
<%
	Connection conn = null;
	String sql= "SELECT*FROM member WHERE id=?";
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	try{
		//Context.xml에 리소스를 생성해 놓은 (JNDI에 설정해 놓은) OracleDB를 참조하여 Connection
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			if(pass.equals(rs.getString("password"))){//입력한 비밀번호
				session.setAttribute("id",id);//세션에 id를 저장합니다.
				
				//main.jsp로 이동합니다.
				out.println("<script>");
				out.println("alert('" + id + "님 로그인되었습니다.')");
				out.println("location.href='main.net'");
				out.println("</script>");
			}else if(!id.equals(rs.getString("id"))){
				out.println("<script>");
				out.println("alert('id가 존재하지 않습니다..')");
				out.println("location.href='login.net'");
				out.println("</script>");
			}else{
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다.')");
				out.println("location.href='login.net'");
				out.println("</script>");
			}
		}
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
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>