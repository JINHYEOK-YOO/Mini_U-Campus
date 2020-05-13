<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--login.html-->
<!--로그인 화면-->
<head>
<title>로그인</title>
<style type="text/css">
input, select {
	font-size: 1em;
	vertical-align: middle;
	list-style-type: none;
	width: 100%;
	box-sizing: border-box;
	border: solid 1px #b1b1b1;
}

select {
	height: 30px;
	padding: 0 25px 0 10px;
}

option {
	font-weight: normal;
	display: block;
	white-space: pre;
	min-height: 1.2em;
}

input {
	height: 30px;
	padding: 0 7px;
}

#btn {
	display: inline-block;
	padding: 0 1.429em;
	box-sizing: border-box;
	background: #6d2633;
	border: solid 1px #5c1e29;
	text-align: center;
	min-width: 5.714em;
	width: 100%;
	border-radius: 2px;
	height: 3em;
	line-height: 3em;
	font-size: 1.429em;
	font-weight: 400;
	color: #fff;
}
</style>
</head>
<body>
		<form class="validForm" name="loginForm" id="loginForm" method="post"
			action="loginAction.jsp">
			<fieldset>
				<legend>로그인</legend>
				<select name="code" title="사용자 구분 선택">
					<option value="1">&nbsp;학부생</option>
					<option value="2">&nbsp;교수</option>
				</select> <br> <input type="text" class="jwvalid-must-memberNo"
					name="userNum" id="id"  placeholder="개인번호 입력" title="개인번호 입력" />
				<input type="submit" id="btn" value="로그인" title="로그인" />
			</fieldset>
		</form>
</body>
</html>