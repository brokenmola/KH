package notice_board.db;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {

	DataSource ds;  
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public NoticeDAO(){
	try {
		Context init = new InitialContext();
		ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	} catch(Exception e) {
		System.out.println("DB ���� ���� : " + e);
		return;
	}
}
	
	//���� ���� ���ϱ�
	public int getListCount() {
	      int x=0;
	      try {
	         conn=ds.getConnection();
	         pstmt=conn.prepareStatement("select count(*) from notice_board");
	         rs=pstmt.executeQuery();
	         
	         if(rs.next()) {
	            x=rs.getInt(1);
	         }
	      }catch(Exception ex) {
	         System.out.println("getListCount(); ���� : "+ex);
	      }finally {
	         if(pstmt != null)
	               try{
	                  pstmt.close();
	               }catch(SQLException ex){
	                  ex.printStackTrace();
	               }
	            if(conn != null)
	               try{
	                  conn.close();
	               }catch(SQLException ex){ex.printStackTrace();}
	      }
	      return x;
	   }
	
	
	public List<NoticeBean> getBoardList(int page, int limit, String notice_list_sql) {
		//page : ������
		//limit : ������ �� ����� ��
		//BOARD_RE_REF desc, BOARD_RE_SEQ asc�� ���� ������ ����
		//�������� �´� rnum�� ������ŭ �������� �������Դϴ�.
		String notice_list_sql1= "select * from "
				+	"(select rownum rnum, notice_no notice_title,"
				+	" notice_content, notice_date, admin_no from"
				+		"(select * from notice_board)) "
				+	"where rnum>=? and rnum<=?";

		
		List<NoticeBean> list = new ArrayList<NoticeBean>();
						//�� �������� 10���� ����� ��� 	  	  1������     2������	  3������
		int startrow=(page-1)* limit + 1; //�б� ������ row ��ȣ(1		11		21
		int endrow = startrow + limit -1; //���� ������ row ��ȣ(10		20		30
		
		
		try {
			conn=ds.getConnection();
			pstmt= conn.prepareStatement(notice_list_sql1);
			pstmt.setInt(1,  startrow);
			pstmt.setInt(2,  endrow);
			rs=pstmt.executeQuery();

			
			//������ �����͸� VO��ü�� ����ϴ�.
			while(rs.next()) {
				NoticeBean notice = new NoticeBean();
				notice.setNotice_no(rs.getInt("notice_no"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_date(rs.getDate("notice_date"));
				notice.setAdmin_no(rs.getInt("admin_no"));
				
				list.add(notice);
			}
			return list;	//���� ���� ��ü�� ������ ����Ʈ�� ȣ���� ������ ������
		} catch(Exception e) {
			System.out.println("getNoticeList() ����:" + e);
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
		return null;
	}
	
	
	public boolean noticeInsert(NoticeBean Notice) {
		int num=0;
		int result=0;
		boolean y=false;
		System.out.println("notice.getnotice_FILE() = " + Notice.getnotice_FILE());
		try {
			conn=ds.getConnection();
			
			//board ���̺��� board_num �ʵ��� �ִ밪�� ���ؿͼ� ����
			//����� �� �� ��ȣ�� ���������� �����ϱ� �����Դϴ�.
			String max_sql = "select max(notice_no) from notice_board";
			pstmt= conn.prepareStatement(max_sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1)+1;
			} else {
				num=1;//ó�� �����͸� ����ϴ� ����Դϴ�.
			}
			
			pstmt.close();
			String sql="insert into notice values(?,?,?,sysdate,?)";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, Notice.getNotice_no());
			pstmt.setString(2, Notice.getNotice_title());
			pstmt.setString(3, Notice.getNotice_content());
			pstmt.setDate(4, (Date) Notice.getNotice_date());
			pstmt.setInt(5, Notice.getAdmin_no());
			
			result=pstmt.executeUpdate();
			
			
			
			if(result==0)
				return false;
			return true;
		} catch(Exception e) {
			System.out.println("getListCount() ����:" + e);
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
		return false;
	}
	
	
	public NoticeBean getDetail(int num) {
		NoticeBean boarddata = new NoticeBean();
		try {
			conn=ds.getConnection();
			String sql= "select * from notice_board where NOTICE_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boarddata.setNotice_no(rs.getInt("notice_no"));
				boarddata.setNotice_title(rs.getString("notice_title"));
				boarddata.setNotice_content(rs.getString("notice_content"));
				boarddata.setNotice_date(rs.getDate("notice_date"));
				boarddata.setAdmin_no(rs.getInt("admin_no"));
				
			}
		} catch(Exception e) {
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
		return boarddata;
	}
	public String deleteCheck(int num) {
		String BOARD_PASS ="";
		String sql = "select ADMIN_PASS from notic_board where ADMIN_NO = ?";
		

		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				BOARD_PASS = rs.getString(1);
			} else {
				BOARD_PASS = null;
			}
			
		} catch(Exception e) {
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
		return BOARD_PASS;
	}
	
	public void delete(int num) {
		
		
		String sql2= "delete from notice_board "
				+	"where notice_no = ?";
		
		try {
			conn=ds.getConnection();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
		} catch(Exception e) {
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
	}

	
	public void update(NoticeBean boarddata) {
		
		String sql2= "update notice_board "
				+	"set NOTICE_TITLE = ?, NOTICE_CONTENT = ? "
				+	"where NOTICE_NO = ?";
		
		try {
			conn=ds.getConnection();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, boarddata.getNotice_no());
			pstmt.setString(2, boarddata.getNotice_title());
			pstmt.setString(3, boarddata.getNotice_content());
			pstmt.setDate(4, (Date) boarddata.getNotice_date());
			pstmt.setInt(5, boarddata.getAdmin_no());
		
			
			pstmt.executeUpdate();
			
			
		} catch(Exception e) {
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
	}
	
	
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	

