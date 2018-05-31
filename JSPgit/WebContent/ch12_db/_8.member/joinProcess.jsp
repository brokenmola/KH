<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");	
	String email = request.getParameter("email");

%>
<%
	Connection conn = null;
	String sql= "INSERT INTO member VALUES (?,?,?,?,?,?)";
	PreparedStatement pstmt =null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt=conn.prepareStatement("SELECT*FROM member WHERE id=?");
		pstmt.setString(1,id);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			out.println("<script>");
			out.println("alert('�ߺ��� ID�Դϴ�.')");
			out.println("history.back();");
			out.println("</script>");
		}else{
		pstmt.close();	
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		pstmt.setString(2,pass);
		pstmt.setString(3,name);
		pstmt.setInt(4, age);
		pstmt.setString(5,gender);
		pstmt.setString(6,email);
		int result = pstmt.executeUpdate();
		
		if(result!=0){
			out.println("<script>");
			out.println("alert('ȸ�� ������ ���ϵ帳�ϴ�.')");
			out.println("location.href='login.net'");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert('ȸ�� ���Կ� �����Ͽ����ϴ�..')");
			out.println("location.href='joinForm.net'");
			out.println("</script>");
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
			try{conn.close();
		}catch(SQLException ex){ex.printStackTrace();}
		
		}
	}
%>
</body>
</html>