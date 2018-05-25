/*
 DAO(Data Access Object)Ŭ����
 - ������ ���̽��� �����Ͽ� ���ڵ��� �߰�,����, ���� �۾��� �̷������ Ŭ�����Դϴ�.
 - � ActionŬ������ ȣ��Ǵ��� �׿� �ش��ϴ� ������ ���̽� ����ó���� DAO Ŭ�������� �̷������ �˴ϴ�.
 */

package festival.db;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class festivalDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;

	public festivalDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB ���� ���� : " + ex);
			return;
		}
	}//������ end
	
	public int insertFestival(festival f) {
		int result =0;
		try {
			con=ds.getConnection();
			
			int num=0;
			String seq = " select festival_seq.nextval from dual; ";
			pstmt=con.prepareStatement(seq);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1);
			}
			
			pstmt.close();
			
			
			String sql = "insert into festival_information(festival_no,festival_name,festival_startday,festival_endday,festival_address)"
						+"values(?,?,to_char(?,yyyy/mm/dd),to_char(?,yyyy/mm/dd),?) ";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, f.getFestival_name());
			pstmt.setString(3, f.getStartday());
			pstmt.setString(4, f.getEndday());
			pstmt.setString(5, f.getFestival_address());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("���� �߰� ����"+e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ee) {
				ee.printStackTrace();
			}
		}
		return result;
	}//insertFestival end
	
	
	public int insertFestival_img(festival_image f) {
		int result=0;
		try {
			con=ds.getConnection();
			
			int seq=0;
			String imgseq="select  travel_image_seq.nextval from dual ";
			
			pstmt=con.prepareStatement(imgseq);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				seq=rs.getInt(1);
			}
			
			pstmt.close();
			
			
			String sql = "insert into festival_image(festival_img_no,festival_img_name,festival_img_type,festival_no)"
						+"values(?,?,?,?) ";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.setString(2, f.getFestival_img_name());
			pstmt.setInt(3, f.getFestival_img_type());
			pstmt.setInt(4, f.getFestival_no());
			
			result =pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println("���� �̹��� �߰� ����" + e.getMessage());
		}finally {
			try {
				
			}catch(Exception ee) {
				ee.printStackTrace();
			}
		}
		return result;
	}//insertFestival_img end
	
	public List<festival> getFestivalList(){
		List<festival> list = new ArrayList<festival>();
		try {
			con=ds.getConnection();
			
		}catch(Exception e) {
			System.out.println("���� ����Ʈ ����" + e.getMessage());
		}finally {
			
		}try {
			
		}catch(Exception ee) {
			ee.printStackTrace();
		}
		return list;
	}
	
	
}//class end


