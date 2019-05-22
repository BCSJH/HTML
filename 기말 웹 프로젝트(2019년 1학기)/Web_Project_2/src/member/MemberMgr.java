package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

public class MemberMgr {
	private DBConnectionMgr pool ;
	public MemberMgr() {
		try {
				pool= DBConnectionMgr.getInstance();
				System.out.println("���� ������?");
			} catch (Exception e) {
				System.out.println("���䰡 �ù�?");
					e.printStackTrace();
			}
	}
	
	
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
		System.out.println("pool -> "+pool);
		
		con = pool.getConnection();
		System.out.println("con -> "+con);
		sql = "select userID from attend_info where userID = ?";
		System.out.println(sql);
		pstmt = con.prepareStatement(sql);
		pstmt.setString(2, id);
		flag = pstmt.executeQuery().next();
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		if (rs != null) try {
			rs.close();
			} catch(SQLException ex) {
			
		}
		if (pstmt != null)
			try {
				pstmt.close();
				} catch(SQLException ex) {
			
		}
		if (con != null)
			try {
				con.close();
				} catch(SQLException ex) {
				
			}
		}
		return flag;
	}
	
	//�α���
	public boolean loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
		con = pool.getConnection();
		sql = "select userID from attend_info where userID = ? and userPassword = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		rs = pstmt.executeQuery();
		flag = rs.next();
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (con != null) try { con.close(); } catch(SQLException ex) {}
		}
		return flag;
		}
	
	//ȸ������ ��������
	//�����ؾߵ�
	public info_check getMember(String id) {
		Connection con = null;
		Boolean connect =false;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		info_check bean = null;
		try {
			String jdbcUrl="jdbc:mysql://localhost:3306/attend_check"; //���� pc�� ��ġ �Ǿ��ִ� mysql�� ����
			String dbId="root"; //��� ID
			String dbPass="test1234"; // ��� �н�����
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			connect=true;
			
			String sql = "select * from attend_info where userID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			bean = new info_check();
			bean.setUserID(rs.getInt("userID"));
		}
		
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (con != null) try { con.close(); } catch(SQLException ex) {}
		}
		if(connect==true){
			System.out.print("����Ǿ����ϴ�");
		}else {
			System.out.print("���ῡ �����Ͽ����ϴ�.");
			}
		return bean;
		
		}
}