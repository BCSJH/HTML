package Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import Board.DBConnectionMgr;

public class ReplyMgr {
	private DBConnectionMgr pool;

	public ReplyMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//¥Ò±€ ∏ÆΩ∫∆Æ
	public Vector<ReplyBean> getReplyList(int board_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ReplyBean> vlist = new Vector<ReplyBean>();
		try {
			con = pool.getConnection();
			sql = "select * from board_reply where board_idx =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReplyBean bean = new ReplyBean();
				bean.setIdx(rs.getInt("idx"));
				bean.setName(rs.getString("Name"));
				bean.setContent(rs.getString("content"));
				bean.setReg_date(rs.getTimestamp("reg_date"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return vlist;
	}

//¥Ò±€ æ≤±‚
	public void insertReply(HttpServletRequest req, int board_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert board_reply(board_idx, name,content,reg_date, pass )";
			sql += "values(?, ?, ?, now(), ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			pstmt.setString(2, req.getParameter("name"));
			pstmt.setString(3, req.getParameter("content"));
			pstmt.setString(4, req.getParameter("pass"));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
	}

//¥Ò±€ ªË¡¶
	public boolean deleteReply(int num, int board_idx, String inPass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		boolean delete_ok = false;
		try {
			con = pool.getConnection();
			sql = "select pass from board_reply where idx=? and board_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, board_idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (inPass.equals(rs.getString("pass"))) {
					sql = "delete from board_reply where idx=? and board_idx=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.setInt(2, board_idx);
					pstmt.executeUpdate();
					delete_ok = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return delete_ok;
	}
}