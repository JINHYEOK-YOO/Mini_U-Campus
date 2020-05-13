package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class FilePostDAO {
	private Connection conn;
	private ResultSet rs;

	public FilePostDAO() {
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
		String SQL = "SELECT fNum FROM lecture_post ORDER BY fNum DESC";
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

	public int write(int fNum, String fTitle, String fContext, int secNum) {
		String SQL = "INSERT INTO lecture_post VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, fNum);
			pstmt.setString(2, fTitle);
			pstmt.setString(3, fContext);
			pstmt.setString(4, getDate());
			pstmt.setInt(5, secNum);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate(); // 성공시 1반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 실패시 -1반환
	}

	public ArrayList<FilePost> getList(int pageNumber, int SecNum) {
		String SQL = "SELECT * FROM lecture_post Where fNum< ? AND SecNum=? AND fAvaliable =1 ORDER BY fNum DESC LIMIT 10";
		ArrayList<FilePost> list = new ArrayList<FilePost>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			pstmt.setInt(2, SecNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FilePost filepost = new FilePost();
				filepost.setfNum(rs.getInt(1));
				filepost.setfTitle(rs.getString(2));
				filepost.setfContext(rs.getString(3));
				filepost.setfDate(rs.getString(4));
				filepost.setfAvaliable(rs.getInt(5));
				list.add(filepost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM lecture_post Where fNum< ? AND fAvaliable =1 ORDER BY pNum DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public FilePost getPost(int fNum) {
		String SQL = "SELECT * FROM lecture_post Where fNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, fNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				FilePost filepost = new FilePost();
				filepost.setfNum(rs.getInt(1));
				filepost.setfTitle(rs.getString(2));
				filepost.setfContext(rs.getString(3));
				filepost.setfDate(rs.getString(4));
				filepost.setsecNum(rs.getInt(5));
				filepost.setfAvaliable(rs.getInt(6));
				return filepost;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(int fNum, String fTitle, String fContext) {
		String SQL = "UPDATE lecture_post SET fTitle =?, pContext=? WHERE fNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fTitle);
			pstmt.setString(2, fContext);
			pstmt.setInt(3, fNum);
			return pstmt.executeUpdate(); // 성공시 1반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 실패시 -1반환
	}

	public int delete(int fNum) {
		String SQL = "UPDATE lecture_post SET fAvaliable = 0 WHERE fNum =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, fNum);
			return pstmt.executeUpdate(); // 성공시 1반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 실패시 -1반환
	}

}
