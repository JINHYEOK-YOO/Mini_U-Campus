<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="post.PostDAO"%>
<%@ page import="post.Post"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
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
		if (userNum == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int pNum = 0;
		if (request.getParameter("pNum") != null) {
			pNum = Integer.parseInt(request.getParameter("pNum"));
		}
		if (pNum == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		Post post = new PostDAO().getPost(pNum);
		if (!userNum.equals(post.getwNum())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		} else {
			if (request.getParameter("pTitle") == null || request.getParameter("pContext") == null
					|| request.getParameter("pTitle") == "" || request.getParameter("pContext") == "") {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PostDAO postDAO = new PostDAO();
				int result = postDAO.update(pNum,request.getParameter("pTitle"), request.getParameter("pContext"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='board.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>