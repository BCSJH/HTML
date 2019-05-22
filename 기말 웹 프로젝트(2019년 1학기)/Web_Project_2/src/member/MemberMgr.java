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
				System.out.println("여기 문제야?");
			} catch (Exception e) {
				System.out.println("여긴가 시발?");
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
	
	//로그인
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
	
	//회원정보 가져오기
	//수정해야된
	public info_check getMember(String id) {
		Connection con = null;
		Boolean connect =false;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		info_check bean = null;
		try {
			String jdbcUrl="jdbc:mysql://localhost:3306/attend_check"; //본인 pc에 설치 되어있는 mysql에 연결
			String dbId="root"; //디비 ID
			String dbPass="test1234"; // 디비 패스워드
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
			System.out.print("연결되었습니다");
		}else {
			System.out.print("연결에 실패하였습니다.");
			}
		return bean;
		
		}
}