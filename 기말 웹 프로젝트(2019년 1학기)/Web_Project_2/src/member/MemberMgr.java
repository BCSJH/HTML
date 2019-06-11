package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberMgr {
	private DBConnectionMgr pool ;
	public MemberMgr() {
		try {
				pool= DBConnectionMgr.getInstance();
			} catch (Exception e) {
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
		con = pool.getConnection();
		sql = "select userID from attend_info where userID = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		flag = pstmt.executeQuery().next();
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (con != null) try { con.close(); } catch(SQLException ex) {}
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
	public info_check getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		info_check bean = null;
		try {
		con = pool.getConnection();
		String sql = "select * from attend_info where userID = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
		bean = new info_check();
		bean.setUserID(rs.getInt("userID"));
		bean.setUserPassword(rs.getString("userPassword"));
		bean.setUserName(rs.getString("userName"));
		bean.setUserGender(rs.getString("userGender"));
		bean.setUserMajor(rs.getString("userMajor"));
		}
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (con != null) try { con.close(); } catch(SQLException ex) {}
		}
		return bean;
		}
}