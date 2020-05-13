<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="file.FilePost"%>
<%@ page import="file.FilePostDAO"%>
<%@ page import="subject.SecSubject"%>
<%@ page import="user.StudentDAO"%>

<%@ page import="java.util.ArrayList"%>
<!--강의자료실 목록-->
<html>
<head>
<title>:: KwangWoon University U-Learning System ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
a, a:link, a:visited, a:hover {
	color: inherit;
	font-size: inherit;
	font-weight: inherit;
	font-family: inherit;
	text-decoration: none;
}

table {
	text-align: center;
}

.btn011 {
	height: 22px;
	width: 1px;
	background-image:
		url(http://info2.kw.ac.kr/images/COMMON/user/btn/011.gif);
	background-repeat: no-repeat;
}

.btn012 {
	height: 22px;
	font-size: 8pt;
	color: #404040;
	padding: 2px 8px 0px 20px;
	background-image:
		url(http://info2.kw.ac.kr/images/COMMON/user/btn/012.gif);
	background-repeat: no-repeat;
}

.btn013 {
	height: 22px;
	width: 2px;
	background-image:
		url(http://info2.kw.ac.kr/images/COMMON/user/btn/013.gif);
	background-repeat: no-repeat;
}

.tl_tit {
	font-size: 8pt;
	color: #5572c3;
	text-align: center;
	font-weight: bold;
	Background-color: #d7e4f6;
	padding: 5px 0px 2px 0px;
	line-height: 15px;
}

select {
	font-size: 9pt;
	color: #666666;
	border: 1px solid #999999;
	Background-color: #fafafa;
}
</style>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'
	type='text/javascript'></script>
<script type='text/javascript'>
	function getSection() {
		var secNum = $('#section option:selected').val();
		window.location.replace("stud-lecture.jsp?secNum=" + secNum);
	};
</script>
</head>
<body>
	<%
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		StudentDAO studentDAO = new StudentDAO();
		ArrayList<SecSubject> lectures = studentDAO.getLectures((String) session.getAttribute("userNum"));
	%>
	<table width="680" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td style="padding: 0px 0 20px 0">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="tit_og" align="left"><img
							src="http://info2.kw.ac.kr/images/KOREAN/user/main_/tit_cir.gif"
							align="absmiddle"><span class="style3">강의자료&#160;ㅣ&#160;</span></td>
						<td class="location" align="right" style="font-size: 8pt;"><img
							src="http://info2.kw.ac.kr/images/KOREAN/user/main_/home.gif"><img
							src="http://info2.kw.ac.kr/images/KOREAN/user/main_/tri.gif"
							align="absmiddle">학습지원실<img
							src="http://info2.kw.ac.kr/images/KOREAN/user/main_/tri.gif"
							align="absmiddle">강의자료</td>
					</tr>
					<tr>
						<td height="1" colspan="2"
							background="http://info2.kw.ac.kr/images/KOREAN/user/main_/dot3_gray.gif"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>


	<table width='680' border='0' cellspacing='0' cellpadding='0'>
		<tr>
			<td width='5'><img
				src='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b01.gif'></td>
			<td
				background='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b02.gif'></td>
			<td width='5'><img
				src='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b03.gif'></td>
		</tr>
		<tr>
			<td
				background='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b04.gif'></td>
			<td
				background='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b05.gif'
				style='padding: 2 0 2 10'>
				<div style="float: left;">
					<b style="font-size: 9pt;">과목정보 : <!-- 현재 선택된 과목 정보--></b><br>
					<select name="secNum" id='section' title="과목을 선택하여 주십시오">
						<option>과목을 선택하여 주십시오</option>
						<%
							for (int i = 0; i < lectures.size(); i++) {
						%>
						<option value="<%=lectures.get(i).getSecNum()%>"><%=lectures.get(i).getSuName()%></option>
						<%
							}
						%>
					</select><img src="http://info2.kw.ac.kr/images/COMMON/user/btn/go_b.gif"
						border="0" align="absmiddle" onclick='getSection()'>
				</div>
			</td>
			<td
				background='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b06.gif'></td>
		</tr>
		<tr>
			<td><img
				src='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b07.gif'></td>
			<td
				background='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b08.gif'></td>
			<td><img
				src='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b09.gif'></td>
		</tr>
	</table>
	<br>
	<table width='680' border='1' cellspacing='0' cellpadding='0'
		style='border: lightgray;'>
		<tr>
			<td class="tl_tit" width="10%">No</td>
			<td class="tl_tit" width="60%">제목</td>
			<td class="tl_tit" width="30%">등록일</td>
		</tr>
		<%
			int sec = 0;
			if (request.getParameter("secNum") != null)
				sec = Integer.parseInt(request.getParameter("secNum"));
			FilePostDAO filepostDAO = new FilePostDAO();
			ArrayList<FilePost> list = filepostDAO.getList(pageNumber, sec);
			for (int i = 0; i < list.size(); i++) {
		%>
		<tr>
			<td><%=list.get(i).getfNum()%></td>
			<td><a style="color: black"
				href="lecture-view.jsp?fNum=<%=list.get(i).getfNum()%>"> <%=list.get(i).getfTitle()%></a></td>
			<td><%=list.get(i).getfDate().substring(0, 11) + list.get(i).getfDate().substring(11, 13) + "시"
						+ list.get(i).getfDate().substring(14, 16) + "분"%></td>
		</tr>
		<%
			}
		%>
	</table>
	</form>
</html>