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
		out.println("<h3>레코드 등록에 실패했습니다.</h3>");
		e.printStackTrace();
	}finally{
		if(pstmt!=null){
			try{
				pstmt.close();//객체를 사용하고 메모리에 반환합니다. 메모리 낭비를 막을 수 있습니다.
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
<title>회원 수정 페이지</title>
</head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function(){
		var gender = '<%=getgender%>';
		if(gender== "남"){
			$('input[value=남]').attr("checked","checked");
		}else{	
			$('input[value=여]').attr("checked","checked");
		}
		$(".cancelbtn").click(function(){
			location.href="main.net";
		})
	});
</script>
<script src="update.js"></script>
<body>
<form name="updateform" action="updateProcess.net" method="post">
	<h1>회원수정 페이지</h1>
	<hr>
	<b>아이디</b>
	<input type="text" name="id" placeholder="Enter id" value="<%=getid %>" readonly><br>
	<b>비밀번호</b>
	<input type="password" name="pass" id="pass" placeholder="Enter password" value="<%=getpass %>" ><br>
	<b>이름</b>
	<input type="text" name ="name" id="name" placeholder="Enter name"  value="<%=getname %>" ><br>
	<b>나이</b>
	<input type="text" name="age" id="age" maxlength=2 placeholder="Enter age" value="<%=getage %>" ><br>
	<b>성별</b>
	<div>
	<input type="radio" name="gender" id="gender" value="남" ><span>남자</span>
	<input type="radio" name="gender" id="gender" value="여" ><span>여자</span>
	
	</div><br>
	<b>이메일 주소</b>
	<input type="text" name="email" id="email" placeholder="Enter email" value="<%=getemail %>" ><br><br>
	<div class="clearfix">
		<input type="submit" class="submitbtn" value="수정">
		<input type="button" class="cancelbtn" value="취소">
	</div>
	</form>
</body>
</html>