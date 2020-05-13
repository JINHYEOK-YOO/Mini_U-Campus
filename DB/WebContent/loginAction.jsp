<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.StudentDAO"%>
<%@ page import="user.ProfessorDAO" %>
<%@ page import="user.Student" %>
<%@ page import="user.Professor" %>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginAction</title>
</head>
<body>
	<%
	String userNum = null;
	if (session.getAttribute("userNum") != null) {
		userNum = (String) session.getAttribute("userNum");
	}
	if (userNum != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	if(code.equals("1")){
		StudentDAO studentDAO = new StudentDAO();
		Student student = studentDAO.getInfo(request.getParameter("userNum"));
		int result = studentDAO.login(student.getsNum());
		if (result == 1) {
			session.setAttribute("userCode",request.getParameter("code"));
			session.setAttribute("userNum", student.getsNum());
			session.setAttribute("userMajor", student.getsMajor());
			session.setAttribute("userMail", student.getsMail());
			session.setAttribute("userName", student.getsName());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}

		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('학번이 존재하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
	if(code.equals("2")){
		ProfessorDAO professorDAO = new ProfessorDAO();
		Professor professor = professorDAO.getInfo(request.getParameter("userNum"));
		int result = professorDAO.login(professor.getpNum());
		if (result == 1) {
			session.setAttribute("userCode",request.getParameter("code"));
			session.setAttribute("userNum", professor.getpNum());
			session.setAttribute("userMail", professor.getpMail());
			session.setAttribute("userName", professor.getpName());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('학번이 존재하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
	%>
</body>
</html>