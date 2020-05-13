<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="user.Student"%>
<%@ page import="user.StudentDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="user.ProfessorDAO"%>
<%@ page import="subject.SecSubject"%>
<!-- 수강생 관리 및 메일 보내기 -->
<html>
<head>
<title>:: KwangWoon University U-Learning System ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.tl_tit {
	font-size: 8pt;
	color: #5572c3;
	text-align: center;
	font-weight: bold;
	Background-color: #d7e4f6;
	padding: 5px 0px 2px 0px;
	line-height: 15px;
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

select {
	font-size: 9pt;
	color: #666666;
	border: 1px solid #999999;
	Background-color: #fafafa;
}

#search {
	background-color: whitesmoke;
	border-radius: 10px;
	margin-left: 80px;
	width: 500;
	padding: 10px 20px 10px 20px;
}

a, a:link, a:visited, a:hover {
	color: inherit;
	font-size: inherit;
	font-weight: inherit;
	font-family: inherit;
	text-decoration: none;
}
</style>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'
	type='text/javascript'></script>
<script type='text/javascript'>
	function getSection() {
		var secNum = $('#section option:selected').val();
		window.location.replace("Manage.jsp?secNum=" + secNum);
	};
</script>
</head>
<body>
<%
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		ProfessorDAO professorDAO = new ProfessorDAO();
    	ArrayList<SecSubject> lectures = professorDAO.getLectures((String)session.getAttribute("userNum"));
	%>
	<!--강의자료 타이틀-->
	<table width="680" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td style="padding: 0px 0 20px 0">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="tit_og" align="left"><img
							src="http://info2.kw.ac.kr/images/KOREAN/user/main_/tit_cir.gif"
							align="absmiddle"><span class="style3">수강생
								관리&#160;ㅣ&#160;</span></td>
						<td class="location" align="right" style="font-size: 8pt;"><img
							src="http://info2.kw.ac.kr/images/KOREAN/user/main_/home.gif"><img
							src="http://info2.kw.ac.kr/images/KOREAN/user/main_/tri.gif"
							align="absmiddle">수강생관리<img
							src="http://info2.kw.ac.kr/images/KOREAN/user/main_/tri.gif"
							align="absmiddle">수강생 관리</td>
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
						<%for(int i = 0; i < lectures.size(); i++){ %>
						<option value="<%=lectures.get(i).getSecNum()%>"><%=lectures.get(i).getSuName()%></option>
						<%} %>
					</select> <img
						src="http://info2.kw.ac.kr/images/COMMON/user/btn/go_b.gif"
						border="0" align="absmiddle" onclick="getSection()">
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
	<form method="post" action="Email.jsp" target="_blank">
		<table>
			<tr>
				<td class="btn011"></td>
				<td class="btn012" style="cursor: pointer;">전체선택/해제</td>
				<!--전체 체크/해제-->
				<td class="btn013"></td>
				<td><input type="submit" value="메일보내기"></td>


				<!--선택 학생 메일 보내기-->
			</tr>
		</table>

		<table width='680' border='1' cellspacing='0' cellpadding='0'
			style="border: lightgray;">
			<tr>
				<td class="tl_tit" width="5%">선택</td>
				<td class="tl_tit" width="20%">학번</td>
				<td class="tl_tit" width="15%">이름</td>
				<td class="tl_tit" width="25%">이메일</td>
				<td class="tl_tit" width="35%">소속</td>
			</tr>
			<%
				int section = 0;
				if (request.getParameter("secNum") != null)
					section = Integer.parseInt(request.getParameter("secNum"));
			
				ArrayList<Student> students = new ArrayList<Student>();
				students = new StudentDAO().getSInfo(section);
				for (int i = 0; i < students.size(); i++) {
			%>
			<tr>
				<td><input type="checkbox" name="email"
					value="<%=students.get(i).getsMail()%>"></td>
				<td><%=students.get(i).getsNum()%></td>
				<td><%=students.get(i).getsName()%></td>
				<td><%=students.get(i).getsMail()%></td>
				<td><%=students.get(i).getsMajor()%></td>
			</tr>
			<%
				}
			%>


		</table>
	</form>
</html>