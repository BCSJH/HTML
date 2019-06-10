package Board;

import java.sql.Connection;
import java.util.Calendar;//Calendar class importing...  새 글 

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
//import member.DBConnectionMgr;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;


public class BoardMgr {
private DBConnectionMgr pool;

private static final String SAVEFOLDER = "fileupload"; //경로
private static final String ENCTYPE = "EUC-KR";
private static int MAXSIZE = 5*1024*1024;


public BoardMgr() {
try {
pool= DBConnectionMgr.getInstance();
} catch (Exception e) {
e.printStackTrace();
}
}

// 게시판 리스트
public Vector<BoardBean> getBoardList(String keyField, String keyWord,int start, int end) {
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;
Vector<BoardBean> vlist = new Vector<BoardBean>();
try {
con = pool.getConnection();
if (keyWord.equals("null") || keyWord.equals("")) {
sql = "select * from board order by idx desc limit ?, ?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, start);
pstmt.setInt(2, end);
}

else {
sql = "select * from board where " + keyField + " like ? ";
sql += "order by idx desc limit ? , ?";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, "%" + keyWord + "%");
pstmt.setInt(2, start);
pstmt.setInt(3, end);
}
rs = pstmt.executeQuery();
while (rs.next()) {
BoardBean bean = new BoardBean();
bean.setIdx(rs.getInt("idx"));
bean.setMem_name(rs.getString("mem_name"));
bean.setTitle(rs.getString("title"));
bean.setReg_date(rs.getTimestamp("reg_date"));
bean.setCount(rs.getInt("count"));
vlist.add(bean);
}
} catch (Exception e) {
e.printStackTrace();
} finally {
if (rs != null) try { rs.close(); } catch(SQLException ex) {}
if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
if (con != null) try { con.close(); } catch(SQLException ex) {}
}
return vlist;
}

//총 게시물수
public int getTotalCount(String keyField, String keyWord) {
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;
int totalCount = 0;
try {
con = pool.getConnection();
if (keyWord.equals("null") || keyWord.equals("")) {
sql = "select count(idx) from board";
pstmt = con.prepareStatement(sql);
} else {
sql = "select count(idx) from board where " + keyField + " like ? ";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, "%" + keyWord + "%");
}
rs = pstmt.executeQuery();
if (rs.next()) {
totalCount = rs.getInt(1);
}
} catch (Exception e) {
e.printStackTrace();
} finally {
if (rs != null) try { rs.close(); } catch(SQLException ex) {}
if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
if (con != null) try { con.close(); } catch(SQLException ex) {}
}
return totalCount;
}

//게시물 입력
public void insertBoard(HttpServletRequest req) {
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;
MultipartRequest multi = null;
int filesize = 0;
String filename = null;
try {
con = pool.getConnection();
File file = new File(SAVEFOLDER);
if (!file.exists())
file.mkdirs();
multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
if (multi.getFilesystemName("filename") != null) {
filename = multi.getFilesystemName("filename");
filesize = (int) multi.getFile("filename").length();
}
String content = multi.getParameter("content");
if (multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
content = UtilMgr.replace(content, "<", "&lt;");
}
sql = "insert board(mem_name,content,title,reg_date,pass,count,ip,filename,filesize)";
sql += "values(?, ?, ?, now(), ?, 0, ?,?, ?)";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, multi.getParameter("mem_name"));
pstmt.setString(2, content);
pstmt.setString(3, multi.getParameter("title"));
pstmt.setString(4, multi.getParameter("pass"));
pstmt.setString(5, multi.getParameter("ip"));
pstmt.setString(6, filename);
pstmt.setInt(7, filesize);
pstmt.executeUpdate();
} catch (Exception e) {
e.printStackTrace();
} finally {
if (rs != null) try {rs.close();} catch (SQLException ex) {}
if (pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
if (con != null) try {con.close();} catch (SQLException ex) {}
}
}

//게시물 리턴
public BoardBean getBoard(int num) {
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;
BoardBean bean = new BoardBean();
try {
con = pool.getConnection();
sql = "select * from board where idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, num);
rs = pstmt.executeQuery();
if (rs.next()) {
bean.setIdx(rs.getInt("idx"));
bean.setMem_name(rs.getString("mem_name"));
bean.setTitle(rs.getString("title"));
bean.setContent(rs.getString("content"));
bean.setReg_date(rs.getTimestamp("reg_date"));
bean.setPass(rs.getString("pass"));
bean.setCount(rs.getInt("count"));
bean.setIp(rs.getString("ip"));
bean.setFilename(rs.getString("filename"));
bean.setFilesize(rs.getInt("filesize"));
bean.setIp(rs.getString("ip"));
}
} catch (Exception e) {
e.printStackTrace();
} finally { if (rs != null) try {rs.close();} catch (SQLException ex) {}
if (pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
if (con != null) try {con.close();} catch (SQLException ex) {}
}
return bean;
}


//파일 다운로드
public void downLoad(HttpServletRequest req, HttpServletResponse res, JspWriter out, PageContext
pageContext) {
try {
String filename = req.getParameter("filename");
File file = new File(UtilMgr.con(SAVEFOLDER + File.separator + filename));
byte b[] = new byte[(int) file.length()];
res.setHeader("Accept-Ranges", "bytes");
String strClient = req.getHeader("User-Agent");
if (strClient.indexOf("MSIE6.0") != -1) {
res.setContentType("application/smnet;charset=euc-kr");
res.setHeader("Content-Disposition", "filename=" + filename + ";");
} else {
res.setContentType("application/smnet;charset=euc-kr");
res.setHeader("Content-Disposition", "attachment;filename=" + filename + ";");
}
out.clear();
out = pageContext.pushBody();
if (file.isFile()) {
BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
BufferedOutputStream outs = new BufferedOutputStream(res.getOutputStream());
int read = 0;
while ((read = fin.read(b)) != -1) {
outs.write(b, 0, read);
}
outs.close();
fin.close();
}
} catch (Exception e) {
e.printStackTrace();
}
}





//조회수 증가
public void upCount(int num) {
Connection con = null;
PreparedStatement pstmt = null;
String sql = null;
try {
con = pool.getConnection();
sql = "update board set count=count+1 where idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.executeUpdate();
} catch (Exception e) {
e.printStackTrace();
} finally {
if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
if (con != null) try { con.close(); } catch(SQLException ex) {}
}
}

//게시물 삭제
public void deleteBoard(int num) {
Connection con = null;
PreparedStatement pstmt = null;
String sql = null;
ResultSet rs = null;
try {
con = pool.getConnection();
sql = "delete from board where idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.executeUpdate();
} catch (Exception e) {
e.printStackTrace();
} finally {
if (rs != null) try { rs.close(); } catch(SQLException ex) {}
if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
if (con != null) try { con.close(); } catch(SQLException ex) {}
}
}

//게시물 수정
public void updateBoard(BoardBean bean) {
Connection con = null;
PreparedStatement pstmt = null;
String sql = null;
try {
con = pool.getConnection();
sql = "update board set mem_name=?,title=?,content=? where idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, bean.getMem_name());
pstmt.setString(2, bean.getTitle());
pstmt.setString(3, bean.getContent());
pstmt.setInt(4, bean.getIdx());
pstmt.executeUpdate();
} catch (Exception e) {
e.printStackTrace();
} finally {
if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
if (con != null) try { con.close(); } catch(SQLException ex) {}
}
}


//새 글 표시 
public String getDateFormat( ){ 
Calendar cal=Calendar.getInstance(); 
String formatStr=""; 
int year=cal.get(cal.YEAR); 
int month=cal.get(cal.MONTH)+1; 
int day=cal.get(cal.DATE); 

formatStr=year+"-"+((month<10)? "0"+month:""+month)+"-"+((day<10)? "0"+day:""+day); 

return formatStr; 
} 



}