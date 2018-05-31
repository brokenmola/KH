<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String id = (String)session.getAttribute("id");
	String getid ="";
	String getpass ="";
	String getname ="";
	int getage =0;
	String getgender ="";
	String getemail ="";

%>
<%
	Connection conn = null;
	String sql= "SELECT *FROM member WHERE id=?";
	PreparedStatement pstmt =null;
	ResultSet rs= null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
		getid=rs.getString(1);
		getpass=rs.getString(2);
		getname=rs.getString(3);
		getage=rs.getInt(4);
		getgender=rs.getString(5);
		getemail=rs.getString(6);
		
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
		if(rs!=null)
			try{rs.close();}
			catch(SQLException ex){ex.printStackTrace();}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ�� ���� ������</title>
</head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function(){
		var gender = '<%=getgender%>';
		if(gender== "��"){
			$('input[value=��]').attr("checked","checked");
		}else{	
			$('input[value=��]').attr("checked","checked");
		}
		$(".cancelbtn").click(function(){
			location.href="main.net";
		})
	});
</script>
<script src="update.js"></script>
<body>
<form name="updateform" action="updateProcess.net" method="post">
	<h1>ȸ������ ������</h1>
	<hr>
	<b>���̵�</b>
	<input type="text" name="id" placeholder="Enter id" value="<%=getid %>" readonly><br>
	<b>��й�ȣ</b>
	<input type="password" name="pass" id="pass" placeholder="Enter password" value="<%=getpass %>" ><br>
	<b>�̸�</b>
	<input type="text" name ="name" id="name" placeholder="Enter name"  value="<%=getname %>" ><br>
	<b>����</b>
	<input type="text" name="age" id="age" maxlength=2 placeholder="Enter age" value="<%=getage %>" ><br>
	<b>����</b>
	<div>
	<input type="radio" name="gender" id="gender" value="��" ><span>����</span>
	<input type="radio" name="gender" id="gender" value="��" ><span>����</span>
	
	</div><br>
	<b>�̸��� �ּ�</b>
	<input type="text" name="email" id="email" placeholder="Enter email" value="<%=getemail %>" ><br><br>
	<div class="clearfix">
		<input type="submit" class="submitbtn" value="����">
		<input type="button" class="cancelbtn" value="���">
	</div>
	</form>
</body>
</html>