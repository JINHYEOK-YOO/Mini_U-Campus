package user;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import user.Student;
import subject.SecSubject;
public class StudentDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public StudentDAO() {
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

	public int login(String sNum) {
		String SQL = "SELECT sNum FROM student WHERE sNum = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, sNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(sNum)) {
					return 1; // 로그인 성공
				} else
					return 0;// 비밀번호 불일치
			}
			return -1;// 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// 데이터베이스 오류
	}

	public Student getInfo(String sNum) {
		String SQL = "SELECT * FROM student WHERE sNum = ?";
		Student student = new Student();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, sNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				student.setsNum(rs.getString(1));
				student.setsName(rs.getString(2));
				student.setsMail(rs.getString(3));
				student.setsMajor(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return student;
	}

	public ArrayList<Student> getSInfo(int secNum) {
		String SQL = "select student.snum, sname, smail, smajor from student, takes where student.snum=takes.snum and takes.secnum=?;";
		ArrayList<Student> students = new ArrayList<Student>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, secNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Student student = new Student();
				student.setsNum(rs.getString(1));
				student.setsName(rs.getString(2));
				student.setsMail(rs.getString(3));
				student.setsMajor(rs.getString(4));
				students.add(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return students;
	}
	
	public ArrayList<SecSubject> getLectures(String sNum) {
		String SQL = "select suname, section.secnum from section, subject, takes where section.secnum = takes.secnum and section.sunum = subject.sunum and snum = ?;";
		ArrayList<SecSubject> lectures = new ArrayList<SecSubject>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, sNum);
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
