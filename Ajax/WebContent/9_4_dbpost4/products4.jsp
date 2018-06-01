<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import = "org.json.simple.*" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int num=0;
	try{
		Context init = new InitialContext();
	    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	    conn = ds.getConnection();
	    
	    String name = request.getParameter("name");
		String modelnumber = request.getParameter("modelnumber");
		String series = request.getParameter("series");
	    
	    if(name!=null && !name.isEmpty()){
	    	
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
			
			pstmt.setInt(1, num);
			pstmt.setString(2, name);
			pstmt.setString(3, modelnumber);
			pstmt.setString(4, series);
			pstmt.executeUpdate();
			pstmt.close();
			rs.close();
	    } 
	    String sql="";
	    
	    if(name!=null && !name.isEmpty()){
	    	sql = "select * from products where id=?";
	    	pstmt=conn.prepareStatement(sql);
	    	pstmt.setInt(1, num);
	    } else{
	    	sql = "select * from products order by id";
	    	pstmt=conn.prepareStatement(sql);
	    }
		rs=pstmt.executeQuery();
		
		int i=0;
		JSONArray array = new JSONArray();
		while(rs.next()){
			JSONObject object = new JSONObject();
			object.put("id", rs.getInt(1));
			object.put("name", rs.getString(2));
			object.put("modelnumber", rs.getString(3));
			object.put("series", rs.getString(4));
			array.add(object);
		}
		response.setHeader("cache-control","no-cache,no-store");
		out.print(array);
	    
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
