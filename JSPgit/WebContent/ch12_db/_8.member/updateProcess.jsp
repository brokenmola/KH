<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String setid = request.getParameter("id");
	String setpass = request.getParameter("pass");
	String setname = request.getParameter("name");
	int setage = Integer.parseInt(request.getParameter("age"));
	String setgender = request.getParameter("gender");	
	String setemail = request.getParameter("email");

%>
<%
	Connection conn = null;
	String sql= "UPDATE member set password=?, name=?, age=?, gender=?, email=? WHERE id=?";
	PreparedStatement pstmt =null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(6,setid);
		pstmt.setString(1,setpass);
		pstmt.setString(2,setname);
		pstmt.setInt(3, setage);
		pstmt.setString(4,setgender);
		pstmt.setString(5,setemail);
		int result = pstmt.executeUpdate();
		
		if(result!=0){
			out.println("<script>");
			out.println("alert('ȸ�� ���� ������ �Ͽ����ϴ�.')");
			out.println("location.href='main.net'");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert('ȸ�� ���� ������ �����Ͽ����ϴ�.')");
			out.println("location.href='updateForm.net'");
			out.println("</script>");
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