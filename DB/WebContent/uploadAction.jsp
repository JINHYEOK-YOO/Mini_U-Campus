<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="file.FileDAO"%>
<%@ page import="file.FileDTO"%>
<%@ page import="file.FilePost"%>
<%@ page import="file.FilePostDAO"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 싸이트</title>
</head>
<body>
	<%
		FilePostDAO filePostDAO = new FilePostDAO();
		FilePost filePost = new FilePost();
		String path = application.getRealPath("/upload/" + Integer.toString(filePostDAO.getNext())+"/");
		File file = new File(path);
		if(!file.exists()){
			file.mkdirs();
		}
		String directory = application.getRealPath("/upload/" + Integer.toString(filePostDAO.getNext())+"/");
		int maxSize = 1024 * 1024 * 100;//100mb
		String encoding = "UTF-8";
		MultipartRequest mpr = new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());
		int section = 0;
		if (mpr.getParameter("secNum") != null)
			section = Integer.parseInt(mpr.getParameter("secNum"));

		filePost.setfTitle(mpr.getParameter("fTitle"));
		filePost.setfContext(mpr.getParameter("fContext"));

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
		} else {
			if (filePost.getfTitle() == null || filePost.getfContext() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {

				int fNum = filePostDAO.getNext();
				int result = filePostDAO.write(fNum, filePost.getfTitle(), filePost.getfContext(), section);
				//파일 전송

				Enumeration fileNames = mpr.getFileNames();
				while (fileNames.hasMoreElements()) {
					String parameter = (String) fileNames.nextElement();
					String fileName = mpr.getOriginalFileName(parameter);
					String fileRealName = mpr.getFilesystemName(parameter);
					if (fileName == null)
						continue;
					new FileDAO().upload(fNum, fileName, fileRealName);
				}

				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='prof-lecture.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>