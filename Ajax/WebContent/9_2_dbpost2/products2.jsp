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
		pstmt = conn.prepareStatement("select * from products");
		rs=pstmt.executeQuery();
		
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		int i=0;
		
		while(rs.next()){
			i++;
			int id = rs.getInt(1);
			name = rs.getString(2);
			modelnumber = rs.getString(3);
			series = rs.getString(4);

			sb.append("{\"id\":"+ "\""+id +"\""+","
					+"\"name\":"+ "\""+name +"\""+","
					+"\"modelnumber\":"+ "\""+modelnumber +"\""+","
					+"\"series\":"+ "\""+series +"\""+"},");
		}
		if(i!=0){
			sb.deleteCharAt(sb.length()-1);//맨 마지막 콤마를 제거합니다.
			sb.append("]");
		} else{
			//데이터가 없는 경우 모두 제거합니다.
			//delete(start, end):index가 start부터 end-1까지 제거합니다.
			sb.delete(0, sb.length());
		}
		//page가 안바뀐상태에서 한번 요청하면 갱신이 안되고 캐쉬에 남아있는
		//데이터를 계속 쓰게 됩니다.
		//ajax처리시 캐쉬에 저장하지 않겠다고 세팅해야 합니다.
		response.setHeader("cache-control","no-cache,no-store");
		out.print(sb);
	    
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
