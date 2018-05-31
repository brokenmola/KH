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
		//Context.xml�� ���ҽ��� ������ ���� (JNDI�� ������ ����) OracleDB�� �����Ͽ� Connection
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			if(pass.equals(rs.getString("password"))){//�Է��� ��й�ȣ
				session.setAttribute("id",id);//���ǿ� id�� �����մϴ�.
				
				//main.jsp�� �̵��մϴ�.
				out.println("<script>");
				out.println("alert('" + id + "�� �α��εǾ����ϴ�.')");
				out.println("location.href='main.net'");
				out.println("</script>");
			}else if(!id.equals(rs.getString("id"))){
				out.println("<script>");
				out.println("alert('id�� �������� �ʽ��ϴ�..')");
				out.println("location.href='login.net'");
				out.println("</script>");
			}else{
				out.println("<script>");
				out.println("alert('��й�ȣ�� Ʋ���ϴ�.')");
				out.println("location.href='login.net'");
				out.println("</script>");
			}
		}
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