<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="file.FileDAO"%>
<%@ page import="file.FileDTO"%>
<%@ page import="file.FilePost"%>
<%@ page import="file.FilePostDAO"%>
<%@ page import="java.io.File"%>
<%@ page import ="java.io.PrintWriter" %>
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
String directory = application.getRealPath("/upload/");
int maxSize = 1024 * 1024 * 100;//100mb
String encoding = "UTF-8";
MultipartRequest mpr = new MultipartRequest(request, directory, maxSize, encoding,
						new DefaultFileRenamePolicy());
				Enumeration fileNames = mpr.getFileNames();
				while (fileNames.hasMoreElements()){
					fileNames.toString();
				}
				%>
</body>
</html>