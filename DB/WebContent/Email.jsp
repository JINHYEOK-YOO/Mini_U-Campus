<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device=width" , initial-scale="1">
<title>메일 보내기</title>
<style type="text/css">
a, a:link, a:visited, a:hover {
	color: white;
	font-size: inherit;
	font-weight: inherit;
	font-family: inherit;
	text-decoration: none;
	line-height: 41px;
}

header {
	position: fixed;
	background: steelblue;
	color: white;
	top: 0px;
	left: 0px;
	width: 100%;
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
</style>
</head>
<body>
	<header>
		<h3 style="margin-left: 20px">| 메일 보내기</h3>
	</header>
	<%
		String userNum = null;
		if (session.getAttribute("userNum") != null) {
			userNum = (String) session.getAttribute("userNum");
		}
	%>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<form method="post" action="MailAction.jsp">
				<input type="text" name="email_textbox" id="email_textbox" style="width: 100%;" readonly>
				<%
					String[] checkbox = request.getParameterValues("email");
					String emailList = "";
					for (int i = 0; i < checkbox.length; i++)
						emailList += checkbox[i] + ';';
				%>
				<script type="text/javascript">
					document.getElementById("email_textbox").value = "<%=emailList%>";
				</script>
				<table class="table table-stryped"
					style="text-align: center; border: 1px solid #dddddd; width: 100%;">
					<tr>
						<td><input type="text" class="form-control"
							placeholder="메일 제목" name="pTitle" maxlength="50"
							style="width: 100%;"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="메일 내용"
								name="pContext" maxlength="2048"
								style="height: 350px; width: 100%; resize: none"></textarea></td>
					</tr>
				</table>
				<br> <input type="submit" class="btn btn-primary pull-right"
					value="보내기" style="float: right; height: 40px; width: 80px;">
			</form>
		</div>
	</div>
	<br>
	<br>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="js/bootstrap.js"></script>
</html>