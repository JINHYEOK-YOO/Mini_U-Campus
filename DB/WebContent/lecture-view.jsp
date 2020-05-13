<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File"%>
<%@ page import="file.FilePost"%>
<%@ page import="file.FilePostDAO"%>
<!-- 강의자료실 게시글 보기 lecture-view.jsp-->
<html>
<head>
<title>:: KwangWoon University U-Learning System ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
table {
	font-size: 12px;
	color: rgb(51, 51, 51);
	line-height: normal;
	font-family: tahoma;
	text-decoration: none;
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

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

.mid2 {
	padding: 0px 10px 40px 20px;
	vertical-align: top;
}

.tl_tit_top {
	height: 2px;
	background-image:
		url(http://info2.kw.ac.kr/images/COMMON/user/lnb/tb01.gif);
}

.tl_tit_fs9 {
	font-size: 9pt;
	color: #5572c3;
	text-align: center;
	font-weight: bold;
	Background-color: #d7e4f6;
	padding: 5px 0px 2px 0px;
	line-height: 15px;
}

.tl_tit_bottom {
	height: 2px;
	background-image:
		url(http://info2.kw.ac.kr/images/COMMON/user/lnb/tb02.gif);
}

.tl_r {
	text-align: right;
	padding: 8px 10px 5px 0px;
	color: #636363;
}

.fs8 {
	font-size: 8pt;
	color: #7e7e7e;
}

.t_dot {
	height: 1px;
	background-image:
		url(http://info2.kw.ac.kr/images/COMMON/user/lnb/dot1_gray.gif);
}

.tl_l2 {
	padding: 15px 10px 10px 10px;
	color: #636363;
	line-height: 20px;
}

.tl_l3 {
	padding: 8px 10px 5px 10px;
	color: #636363;
}

.tl_line1 {
	background-color: #93b2e0;
	height: 1px;
}

.tl_line3 {
	background-color: #ecf9fc;
	height: 3px;
}

.h10 {
	height: 10px;
}

.btn_ri {
	text-align: right;
	padding: 0px 0px 0px 0px;
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
</style>
</head>
<body>
	<%
		String userCode = null;
		if (session.getAttribute("userCode") !=null){
			userCode = (String) session.getAttribute("userCode");
		}
		String userNum = null;
		if (session.getAttribute("userNum") != null) {
			userNum = (String) session.getAttribute("userNum");
		}
		int fNum = 0;
		if (request.getParameter("fNum") != null) {
			fNum = Integer.parseInt(request.getParameter("fNum"));
		}
		if (fNum == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		FilePost post = new FilePostDAO().getPost(fNum);
	%>
	<!--강의자료 타이틀-->
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

	<br>
	<table width="680" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td class="mid2">
					<!--TABLE-->
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td width="660" colspan="2" class="tl_tit_top"></td>
							</tr>
							<tr>
								<td colspan="2" class="tl_tit_fs9"><%=post.getfTitle()%></td>
							</tr>
							<tr>
								<td colspan="2" class="tl_tit_bottom"></td>
							</tr>
							<tr>
								<td colspan="2" class="tl_r fs8"><img
									src="http://info2.kw.ac.kr/images/COMMON/user/icon/point.gif"
									align="absmiddle"> 글번호<!--글번호-->&nbsp;&nbsp;&nbsp; <img
									src="http://info2.kw.ac.kr/images/COMMON/user/icon/point.gif"
									align="absmiddle"> 등록일<%=post.getfDate().substring(0, 11) + post.getfDate().substring(11, 13) + "시"
					+ post.getfDate().substring(14, 16) + "분"%>&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2" class="t_dot"></td>
							</tr>
							<tr>
								<td colspan="2" valign="top" class="tl_l2" height="200"><%=post.getfContext().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;")
					.replaceAll("\n", "<br>")%></td>
							</tr>
							<tr>
								<td colspan="2" class="t_dot"></td>
							</tr>
							<tr>
								<td colspan="2" valign="top" class="tl_l3">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td width="80" valign="top" class="tit8_b"><img
													src="http://info2.kw.ac.kr/images/COMMON/user/icon/point.gif"
													align="absmiddle">첨부파일<!--첨부파일--> l</td>
												<td><samp class="link_b2">
														<%
															String directory = application.getRealPath("/upload/"+Integer.toString(fNum)+"/");
															String files[] = new File(directory).list();
															for (String file : files) {
																out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file="
																		+ java.net.URLEncoder.encode(file, "UTF-8") + "\">" + file + "</a><br>");
															}
														%>
													</samp></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>

					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td class="tl_line1"></td>
							</tr>
							<tr>
								<td class="tl_line3"></td>
							</tr>
						</tbody>
					</table> <!--BTN -->
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td class="h10"></td>
							</tr>
							<tr>
								<td class="btn_ri">
									<table border="0" cellspacing="0" cellpadding="0" align="right">
										<tbody>
											<tr>
												<td class="btn011"></td>
												<td class="btn012" style="cursor: pointer;"
													onclick="history.back()">목록</td>
												<td class="btn013"></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					
					</form>
</html>