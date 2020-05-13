<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--prof-menu.html-->
<!--교수 유캠퍼스 왼쪽 메뉴-->
<title>:: KwangWoon University U-Learning System ::</title>
<style type="text/css">
* {
	font-family: "Open Sans", "맑은 고딕", "Malgun Gothic", "dotum";
	text-decoration: none;
}

a {
	color: inherit;
	font-size: inherit;
	font-weight: inherit;
	font-family: inherit;
}

#ident {
	background-color: darkcyan;
	color: white;
	display: block;
	justify-content: center;
	margin: 10px 3px 10px 3px;
	padding: 20px 10px 20px 10px;
}

.elem {
	display: block;
	padding: 10px 80px 10px 10px;
}
</style>
</head>
<body>
	<a href="main.jsp" target="_top"> <img
		src="http://info.kw.ac.kr/include/images/logo.gif" width="165"
		height="50">
	</a>
	<span id="ident"><%=session.getAttribute("userName")%> (<%=session.getAttribute("userNum")%>)<a
		href="logoutAction.jsp" target="_top"> <img
			src="https://info.kw.ac.kr/include/images/top_logout.gif" width="40"
			height="10" border="2" style="margin-left: 60px;">
	</a></span>

	<table>
		<tr>
			<td><img
				src="http://info2.kw.ac.kr/images/KOREAN/user/kw_univ/left_totalinfo.gif"></td>
		</tr>
		<tr>
			<td class="elem"><a href="prof-lecture.jsp" target="right">학습지원실</a>
			</td>
		</tr>
		<tr>
			<td class="elem"><a href="Manage.jsp" target="right">수강생 관리</a>
			</td>
		</tr>
	</table>
</body>
</html>