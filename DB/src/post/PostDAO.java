package post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PostDAO {

	private Connection conn;
	private ResultSet rs;

	public PostDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/school?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int getNext() {
		String SQL = "SELECT pNum FROM board_post ORDER BY pNum DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int write(String pTitle, String wNum, String pContext) {
		String SQL = "INSERT INTO board_post VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, pTitle);
			pstmt.setString(3, wNum);
			pstmt.setString(4, pContext);
			pstmt.setString(5, getDate());
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate(); // 성공시 1반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 실패시 -1반환
	}
	//총10개의 게시물을 가져오는 함수
	public ArrayList<Post> getList(int pageNumber){
		String SQL = "SELECT * FROM board_post Where pNum< ? AND pAvaliable =1 ORDER BY pNum DESC LIMIT 10";
		ArrayList<Post> list = new ArrayList<Post>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Post post = new Post();
				post.setpNum(rs.getInt(1));
				post.setpTitle(rs.getString(2));
				post.setwNum(rs.getString(3));
				post.setpContext(rs.getString(4));
				post.setpDate(rs.getString(5));
				post.setpAvaliable(rs.getInt(6));
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM board_post Where pNum< ? AND pAvaliable =1 ORDER BY pNum DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//게시글 불러오기
	public Post getPost(int pNum) {
		String SQL = "SELECT * FROM board_post Where pNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Post post = new Post();
				post.setpNum(rs.getInt(1));
				post.setpTitle(rs.getString(2));
				post.setwNum(rs.getString(3));
				post.setpContext(rs.getString(4));
				post.setpDate(rs.getString(5));
				post.setpAvaliable(rs.getInt(6));
				return post;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int pNum, String pTitle, String pContext) {
		String SQL = "UPDATE board_post SET pTitle =?, pContext=? WHERE pNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pTitle);
			pstmt.setString(2, pContext);
			pstmt.setInt(3, pNum);
			return pstmt.executeUpdate(); // 성공시 1반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 실패시 -1반환
	}
	
	public int delete(int pNum) {
		String SQL ="UPDATE board_post SET pAvaliable = 0 WHERE pNum =?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, pNum);
					return pstmt.executeUpdate(); // 성공시 1반환
				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1; // 실패시 -1반환
			}
}