<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.Professor"%>
<%@ page import="user.ProfessorDAO"%>
<%@ page import="user.Student"%>
<%@ page import="user.StudentDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--u-campus.html-->
<!--유캠퍼스 프레임-->
<title>:: KwangWoon University U-Learning System ::</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<%
	String userNum = null;
	if (session.getAttribute("userNum") != null) {
		userNum = (String) session.getAttribute("userNum");
	}
	if (session.getAttribute("userCode") == null || session.getAttribute("userCode") == "") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
%>

<frameset cols="13%, 87%" border="0">
	<%
		if (session.getAttribute("userCode").equals("2")) {
	%>
	<frame src="prof-menu.jsp" name="left">
	<%
		}
	%>
	<%
		if (session.getAttribute("userCode").equals("1")) {
	%>
	<frame src="stud-menu.jsp" name="left">
	<%
		}
	%>
	<frameset rows="12%, 88%" border="0">
		<frame
			src="http://info2.kw.ac.kr/images/KOREAN/user/kw_univ/subtop_totalinfo.gif"
			style="padding-top: 4px">
		<%
			if (session.getAttribute("userCode").equals("2")) {
		%>
		<frame src="prof-lecture.jsp" name="right">
		<%
			}
		%>
		<%
			if (session.getAttribute("userCode").equals("1")) {
		%>
		<frame src="stud-lecture.jsp" name="right">
		<%
			}
		%>
	</frameset>
</frameset>
</html>