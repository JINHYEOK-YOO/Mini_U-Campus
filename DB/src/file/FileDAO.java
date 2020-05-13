package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class FileDAO {

	private Connection conn;

	public FileDAO() {
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
	
	public int upload(int fNum, String filename, String fileRealName) {
		String SQL ="INSERT INTO file VALUES (?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, fNum);
			pstmt.setString(2, filename);
			pstmt.setString(3, fileRealName);
			return pstmt.executeUpdate(); //성공 시 1 을 반환한다.
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //에러 발생
	}
}
