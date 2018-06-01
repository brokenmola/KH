<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int num=0;
	try{
		Context init = new InitialContext();
	    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	    conn = ds.getConnection();
	    String max_sql = "select max(id) from products";
	    pstmt = conn.prepareStatement(max_sql);
	    rs=pstmt.executeQuery();
	    if(rs.next()){
	    	num = rs.getInt(1)+1;
	    } else{
	    	num =1;
	    }
	    
	    pstmt.close();
	    
		pstmt = conn.prepareStatement("insert into products values(?, ?, ?, ?)");
		
		String name = request.getParameter("name");
		String modelnumber = request.getParameter("modelnumber");
		String series = request.getParameter("series");
		
		pstmt.setInt(1, num);
		pstmt.setString(2, name);
		pstmt.setString(3, modelnumber);
		pstmt.setString(4, series);
		pstmt.executeUpdate();

	}catch(Exception e){
	       out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
	       e.printStackTrace();
	    } finally{
	    	if(rs!=null)
	    		try{
	    			rs.close();
	    							
	    		} catch(SQLException ex){ex.printStackTrace();}
	    	if(pstmt!=null)
	    		try{
	    			pstmt.close(); 
	    		} catch(SQLException ex){ex.printStackTrace();}
	    	if(conn!=null)
	    		try{
	    			conn.close();
	    		} catch(SQLException ex){ex.printStackTrace();}
	    }
%>
