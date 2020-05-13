<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>광운대학교</title>
<!--homepage.html-->
<!--광운대학교 홈페이지-->
<head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: "Open Sans", "맑은 고딕", "Malgun Gothic", "dotum";
	text-decoration: none;
	list-style-type: none;
}

html {
	display: block;
}

body {
	font-size: 0.75em;
	margin: 0 auto;
	background-color: white;
	display: block;
}

body, html {
	height: auto;
	color: #222;
	font-size: 14px;
}

html:focus, body:focus, input:focus {
	outline: none;
}

p, td, div, dt, dd, li {
	word-break: keep-all;
	word-wrap: break-word;
}

div, ul, li, a, input, select, form, dl, dt, dd {
	background: transparent no-repeat;
	list-style-type: none;
}

div {
	display: block;
}

ul, ol {
	list-style: none;
}

ul, menu, dir {
	display: block;
}

a, span, p, em, label, dt, dd, li, strong {
	color: inherit;
	font-size: inherit;
	font-weight: inherit;
	font-family: inherit;
}

a:link, a:visited, a:hover {
	text-decoration: none;
}

li {
	display: list-item;
}

article, aside, footer, hgroup, main, nav, section {
	display: block;
}

strong, b {
	font-weight: 700;
}

img {
	border: 0;
	vertical-align: top;
}

img, input, select, textarea {
	vertical-align: middle;
}

fieldset, img {
	border: none;
}

h1 h2 h3 h4 h5 h6 {
	font-size: 100%;
	font-weight: 700 bolder;
	color: #222;
	line-height: 1em;
}

#header-util {
	background: #525150;
}

#header-util .fixed {
	position: fixed;
	z-index: 900;
	left: 0;
	top: 0;
	width: 100%;
}

#header-util .fr li {
	float: left;
	line-height: 41px;
	position: relative;
	color: #fff;
}

#header-util .fr li:before {
	content: "";
	width: 1px;
	height: 9px;
	background: #646362;
	position: absolute;
	left: 0;
	top: 50%;
	margin-top: -5px;
}

.fr {
	float: right;
}

.inner-wrap {
	max-width: 1160px;
	position: relative;
	margin: 0 auto;
}

.inner-wrap:after {
	content: "";
	display: block;
	clear: both;
}

#gnb.fixed {
	margin-top: 41px;
}

#gnb {
	position: relative;
}

#gnb .gnb-nav {
	position: relative;
	background: #fff;
	border-bottom: solid 1px #e5e8ee;
}

#gnb h1 {
	position: absolute;
	left: 0;
	top: 50%;
	margin-top: -24px;
	width: 166px;
	height: 47px;
	background: url(https://www.kw.ac.kr/_res/ko/img/css/logo.png) left top
		no-repeat;
	text-indent: -999em;
	overflow: hidden;
}

#gnb h1>a {
	display: block;
	height: 100%;
}

#gnb .gnb {
	float: right;
	height: 85px;
}

#gnb .gnb>li:first-child {
	padding-left: 0;
}

#gnb .gnb>li {
	float: left;
	padding: 0 40px;
}

#gnb .gnb>li>a {
	font-size: 1.357em;
	font-weight: 700;
	display: inline-block;
	padding: 0 20px;
	position: relative;
	line-height: 85px;
}

#gnb .gnb>li:last-child {
	padding-right: 20px;
}

.video-bkg-wrap {
	overflow: hidden;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	z-index: -200;
	background: #000;
}

.caption-wrapper {
	position: absolute;
	width: 100%;
	height: 580px;
	top: 141px;
	overflow: hidden;
	top: 274px;
}

.vod-wrapper {
	position: absolute;
	width: 700%;
	height: 100%;
	z-index: 0;
	top: 0;
}

.screen {
	position: relative;
	height: 100%;
	width: 14.2857%;
	float: left;
	overflow: hidden;
	height: 100%;
}

.screen .inner-wrap {
	height: 100%;
}

.caption-wrapper .inner-wrap {
	height: 100%;
}

.video-title {
	text-shadow: 2px 2px 1px rgba(0, 0, 0, 1);
	font-size: 2, 5em;
	color: #fff;
	position: absolute;
	left: 0;
	bottom: 5%
}

.main-contents-wrap {
	padding: 40px 0;
	background: #fff;
}

.main-contents-block:first-of-type {
	margin-top: 0;
}

.main-contents-block {
	position: relative;
}

.main-contents-block {
	margin-top: 50px;
}

.main-contents-block h3 {
	position: relative;
	padding: 12px 0 30px 0;
	font-size: 1.857em;
	font-weight: 400;
}

.main-contents-box {
	position: relative;
}

.main-contents-box .hot-issue-block {
	margin-left: -20px;
}

.main-contents-box .hot-issue-block .hot-issue-box {
	float: left;
	width: 25%;
	padding-left: 20px;
	box-sizing: border-box;
	position: relative;
	padding-bottom: 115px;
}

.main-contents-box .hot-issue-block .hot-issue-box .thumb {
	height: 130px;
	overflow: hidden;
}

.thumb {
	position: relative;
}

.main-contents-box .hot-issue-block .hot-issue-box .description {
	position: absolute;
	left: 20px;
	bottom: 0;
	right: 0;
	background: #f5f5f5;
}

.main-contents-box .hot-issue-block .hot-issue-box .description .text-box
	{
	padding: 20px;
}

.main-contents-box .hot-issue-block .hot-issue-box .description .text-box>a
	{
	font-weight: 700;
	font-size: 1.143em;
	overflow: hidden;
	text-overflow: ellipsis;
	display: inline-block;
	word-wrap: break-word;
	height: 3em;
}

.main-contents-box .hot-issue-block .hot-issue-box .description .text-box span
	{
	font-weight: 400;
	font-size: 0.929em;
	display: block;
	margin-top: 5px;
}

.thumb img {
	width: 100%;
	max-width: 100%;
}

.txt01 {
	position: absolute;
	left: 100px;
	bottom: 10px;
	color: white;
}
</style>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'
	type='text/javascript'></script>
</head>

<body id="item_body" class="pc">
	<header id="header-util" class="fixed">
		<div class="inner-wrap">
			<div class="fr remove-mobile">
				<ul>
					<li><a href="logoutAction.jsp" target="_self"> LOGOUT </a></li>
				</ul>
			</div>
		</div>
	</header>
	<div class="gnb-wrap">
		<nav id="gnb" class="fixed">
			<div class="gnb-nav">
				<div class="inner-wrap">
					<h1>
						<a href="">광운대학교 로고</a>
					</h1>
					<ul class="gnb remove-mobile">
						<li><a href="u-campus.jsp">U-CAMPUS</a></li>
						<li><a href="board.jsp">자유게시판</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="main-slider-wrap">
		<ul id="bxslider">
			<li class="thumb" style="display: block"><a
				href="http://www.mediakw.org/news/articleView.html?idxno=3038"
				target="_blank"> <img
					src="https://www.kw.ac.kr/_attach/image/2018/05/tpjKEprgDRFgYxFQjSpa.JPG"
					alt="광운대 ,숭실대 잡고 U리그 2연승 달성">
			</a>
				<h1 class="txt01">광운대 ,숭실대 잡고 U리그 2연승 달성</h1></li>

			<li class="thumb" style="display: none"><a
				href="http://news.joins.com/article/22482354" target="_blank"> <img
					src="https://www.kw.ac.kr/_attach/image/2018/03/KWSyZgPjDvBJWquqABlU.jpg"
					alt="[중앙일보] 기술·환경·예술 어우러진 캠퍼스 '주목'">
			</a>
				<h1 class="txt01">[중앙일보] 기술·환경·예술 어우러진 캠퍼스 '주목'</h1></li>

			<li class="thumb" style="display: none"><a
				href="https://www.kw.ac.kr/ko/life/newsletter.do?mode=view&articleNo=1503988"
				target="_blank"> <img
					src="https://www.kw.ac.kr/_attach/image/2018/04/NkedDCKTElIkTxjpUCli.jpg"
					alt="산업계관점 대학평가 정보통신분야 최우수대학 선정">
			</a>
				<h1 class="txt01">산업계관점 대학평가 정보통신분야 최우수대학 선정</h1></li>

			<li class="thumb" style="display: none"><a
				href="https://www.kw.ac.kr/ko/life/newsletter.do?mode=view&articleNo=1504187"
				target="_blank"> <img
					src="https://www.kw.ac.kr/_attach/image/2018/05/pDhaRLLqBhWjeXYWBMwY.jpg"
					alt="유학생 ALL-CARE 프로그램 '광운유학생 친교의 밤'">
			</a>
				<h1 class="txt01">유학생 ALL-CARE 프로그램 '광운유학생 친교의 밤'</h1></li>

			<li class="thumb" style="display: none"><a
				href="http://edu.donga.com/?p=article&ps=view&at_no=20180427110729571829"
				target="_blank"> <img
					src="https://www.kw.ac.kr/_attach/image/2018/04/IoAMSZoSqVhtnXdcIEOJ.jpg"
					alt="럭스로보 오상훈 대표 초청, 광운학원 동문특강">
			</a>
				<h1 class="txt01">럭스로보 오상훈 대표 초청, 광운학원 동문특강</h1></li>

			<li class="thumb" style="display: none"><a
				href="http://news.unn.net/news/articleView.html?idxno=185920"
				target="_blank"> <img
					src="https://www.kw.ac.kr/_attach/image/2018/03/xXWOATVSTCKhRrPIqcGb.jpg"
					alt="중앙도서관, 전국대학 벤치마킹 우수 모델로 주목">
			</a>
				<h1 class="txt01">중앙도서관, 전국대학 벤치마킹 우수 모델로 주목</h1></li>
		</ul>
	</div>
	<script type='text/javascript'>
		var $imgList = $('#bxslider>li');
		var nImgCount = $imgList.length;
		var nDuration = 4000;
		var bAuto = true;
		var nIndex = 0;

		if (bAuto == true) {
			setInterval(autoSlide, nDuration); // Javascript setInterval 함수 호출
		}

		function autoSlide() {
			var next = (++nIndex % nImgCount);
			$($imgList.get(next - 1)).fadeOut(0);
			$($imgList.get(next)).fadeIn(1000);
		}
	</script>
	<div class="main-contents-wrap" id="jwxe_main_content"
		stlye="margin-top: 303.757px">
		<div class="inner-wrap">
			<!--[s] hot issue-->
			<section class="main-contents-block">
				<h3>Hot Issue</h3>
				<div class="main-contents-box">
					<div class="hot-issue-block">
						<div class="hot-issue-box">
							<div class="hot-cont">
								<div class="thumb">
									<img
										src="https://www.kw.ac.kr/_attach/image/2018/06/thumb_XFxhbECPBDRLVZDCrzWC.jpg"
										alt=" 『제6회 풍력터빈 및 신재생 에너지 국제 컨퍼런스』 개최 ">
								</div>
								<div class="description">
									<div class="text-box">
										<a
											href="https://www.kw.ac.kr/ko/life/newsletter.do?mode=view&amp;articleNo=1504376">
											『제6회 풍력터빈 및 신재생 에너지 국제 컨퍼런스』 개최 </a> <span>2018.06.01</span>
									</div>
								</div>
							</div>
						</div>
						<div class="hot-issue-box">
							<div class="hot-cont">
								<div class="thumb">
									<img
										src="https://www.kw.ac.kr/_attach/image/2018/06/thumb_IBfxeYzVnFXAtuBvItTY.jpg"
										alt="박재영교수 연구팀(전자공학과), 무전원 압력 센서 기술 개발 성공">
								</div>
								<div class="description">
									<div class="text-box">
										<a
											href="https://www.kw.ac.kr/ko/life/newsletter.do?mode=view&amp;articleNo=1504375">
											박재영교수 연구팀(전자공학과), 무전원 압력 센서 기술 개발 성공 </a> <span>2018.06.01</span>
									</div>
								</div>
							</div>
						</div>
						<div class="hot-issue-box">
							<div class="hot-cont">
								<div class="thumb">
									<img
										src="https://www.kw.ac.kr/_attach/image/2018/06/thumb_OUwfPYgKaphxPZEGJfBR.jpg"
										alt="교육부 주관 고교교육 기여대학 지원사업 6년 연속 선정">
								</div>
								<div class="description">
									<div class="text-box">
										<a
											href="https://www.kw.ac.kr/ko/life/newsletter.do?mode=view&amp;articleNo=1504374">
											교육부 주관 고교교육 기여대학 지원사업 6년 연속 선정 </a> <span>2018.06.01</span>
									</div>
								</div>
							</div>
						</div>
						<div class="hot-issue-box">
							<div class="hot-cont">
								<div class="thumb">
									<img
										src="https://www.kw.ac.kr/_attach/image/2018/05/thumb_OsaONuQehdzBhgomopbm.jpg"
										alt="ㅇ">
								</div>
								<div class="description">
									<div class="text-box">
										<a href="https://www.kw.ac.kr/_res/ko/etc/1174_09_kw.pdf"
											target="_blank"> [한국대학신문] 광운대, 지역 사회와 함께 공존하는 캠퍼스 </a> <span>2018.05.25</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>