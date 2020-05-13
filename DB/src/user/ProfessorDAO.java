package user;

import java.sql.DriverManager;
import user.Professor;
import java.sql.ResultSet;
import java.util.ArrayList;
import subject.SecSubject;


import java.sql.Connection;
import java.sql.PreparedStatement;

public class ProfessorDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ProfessorDAO() {
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

	public int login(String pNum) {
		String SQL = "SELECT pNum FROM professor WHERE pNum = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(pNum)) {
					return 1; // �α��� ����
				} else
					return 0;// ��й�ȣ ����ġ
			}
			return -1;// ���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// �����ͺ��̽� ����
	}

	public Professor getInfo(String sNum) {
		String SQL = "SELECT * FROM professor WHERE pNum = ?";
		Professor professor = new Professor();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, sNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				professor.setpNum(rs.getString(1));
				professor.setpName(rs.getString(2));
				professor.setpMail(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return professor;
	}
	
	public ArrayList<SecSubject> getLectures(String pNum) {
		String SQL = "select suname, secnum from section, subject where section.sunum = subject.sunum and pnum=?;";
		ArrayList<SecSubject> lectures = new ArrayList<SecSubject>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SecSubject subject = new SecSubject();
				subject.setSuName(rs.getString(1));
				subject.setSecNum(rs.getInt(2));
				lectures.add(subject);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lectures;
	}
	
}

