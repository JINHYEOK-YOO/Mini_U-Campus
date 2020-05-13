<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page import="user.ProfessorDAO" %>
   <%@ page import="subject.SecSubject"%>
   <%@ page import="java.util.ArrayList"%>
<!--강의자료실 글쓰기 lecture-write.jsp-->
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
    select {
      font-size: 9pt;
      color: #666666;
      border: 1px solid #999999;
      Background-color: #fafafa;
    }
    TABLE {
    FONT-SIZE: 12px;
    COLOR: #333333;
    LINE-HEIGHT: normal;
    TEXT-DECORATION: none;
    }
    .mid2 {
    padding: 0px 10px 40px 20px;
    vertical-align: top;
    }
    td, body {
    font-size: 9pt;
    font-family: dotum,verdana;
    text-decoration: none;
    color: #434343;
    line-height: 16px;
    }
    tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
    }
    tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
    }
    .tl_tit_left {
    font-size: 8pt;
    color: #5572c3;
    text-align: center;
    font-weight: bold;
    Background-color: #edf4fd;
    padding: 7px 0px 5px 0px;
    }
    .tk_left {
    padding: 7px 0px 5px 10px;
    color: #636363;
    }
    .t_dot {
    height: 1px;
    background-image: url(http://info2.kw.ac.kr/images/COMMON/user/lnb/dot1_gray.gif);
    }
    .tl_line31 {
    background-color: #93b2e0;
    height: 3px;
    }
    .padding_r5 {
    padding: 0px 5px 0px 0px;
    }
    .input2 {
    font-size: 9pt;
    color: #666666;
    border: 1px solid #cccccc;
    padding: 3px 0px 0px 2px;
    Background-color: #FFFFFF;
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
        height:22px;
        width:1px;
        background-image:url(http://info2.kw.ac.kr/images/COMMON/user/btn/011.gif);
        background-repeat:no-repeat;
    }
    .btn012 {
        height:22px;
        font-size:8pt;
        color:#404040;
        padding:2px 8px 0px 20px;
        background-image:url(http://info2.kw.ac.kr/images/COMMON/user/btn/012.gif);
        background-repeat:no-repeat;
    }
    .btn013 {
        height:22px; 
        width:2px; 
        background-image:url(http://info2.kw.ac.kr/images/COMMON/user/btn/013.gif); 
        background-repeat:no-repeat;
    }
    .btn014 {
        height:22px;
        width:5px;
    }
    </style>
    <script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'
	type='text/javascript'></script>
<script type='text/javascript'>
</script>
    </head>
    <body>
    <%
    	String section = null;
    	section = request.getParameter("secNum");

    	ProfessorDAO professorDAO = new ProfessorDAO();
    	ArrayList<SecSubject> lectures = professorDAO.getLectures((String)session.getAttribute("userNum"));
    %>
    <form method="post" action="uploadAction.jsp" enctype="multipart/form-data">
    <!--강의자료 타이틀-->
    <table width="680" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td style="padding:0px 0 20px 0">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="tit_og" align="left"><img src="http://info2.kw.ac.kr/images/KOREAN/user/main_/tit_cir.gif"align="absmiddle"><span class="style3">강의자료&#160;ㅣ&#160;</span></td>
                  <td class="location" align="right" style="font-size: 8pt;"><img src="http://info2.kw.ac.kr/images/KOREAN/user/main_/home.gif"><img src="http://info2.kw.ac.kr/images/KOREAN/user/main_/tri.gif" align="absmiddle">학습지원실<img src="http://info2.kw.ac.kr/images/KOREAN/user/main_/tri.gif" align="absmiddle">강의자료</td>
                </tr>
                <tr>
                  <td height="1" colspan="2" background="http://info2.kw.ac.kr/images/KOREAN/user/main_/dot3_gray.gif"></td>
                </tr>
              </table>
            </td>
        </tr>
    </table>
    
    
    <table width='680'  border='0' cellspacing='0' cellpadding='0'>
      <tr>
        <td width='5'><img src='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b01.gif'></td>
        <td background='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b02.gif'></td>
        <td width='5'><img src='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b03.gif'></td>
      </tr>
      <tr>
        <td background='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b04.gif'></td>
        <td background='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b05.gif' style='padding:2 0 2 10'>
          <div style="float: left;">
            <b style="font-size: 9pt;">과목정보 : <!-- 현재 선택된 과목 정보--></b><br>
          <select name="secNum" id='section' title="과목을 선택하여 주십시오">
            <option>과목을 선택하여 주십시오</option>
            <%for(int i = 0; i < lectures.size(); i++){ %>
            <option value="<%=lectures.get(i).getSecNum()%>"><%=lectures.get(i).getSuName()%></option>
            <%} %>
          </select>
          <img src="http://info2.kw.ac.kr/images/COMMON/user/btn/go_b.gif" border="0" align="absmiddle" onclick='getSection()'>
        </div>
        </td>
        <td background='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b06.gif'></td>
      </tr>
      <tr>
        <td><img src='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b07.gif'></td>
        <td background='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b08.gif'></td>
        <td><img src='http://info2.kw.ac.kr/images/COMMON/user/lnb/box_b09.gif'></td>
      </tr>
    </table>
    <br>

    <table width="680" border="0" cellspacing="0" cellpadding="0">    
            <tbody>
                <tr>
                    <td class="mid2">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr>
                                  <td class="tl_line31"></td>
                                </tr>
                            </tbody>
                        </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td width="80" class="tl_tit_left" nowrap="nowrap">제목</td>
                                <td class="tk_left">
                                    <input name="fTitle" type="text" class="input2" id="textarea2" size="80" maxlength="60"> <!-- 제목 -->
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="t_dot"></td>
                            </tr>
                            <tr>
                    <td class="tl_tit_left">내용</td>
                    <td class="tk_left">
                        <!-- 내용 -->
                      <textarea class="editor_holder" name="fContext" style="width: 550px; height: 250px; resize: none;" id="p_content" aria-hidden="true"></textarea>
                    </td>        
                  </tr>
                  <tr>
                    <td colspan="2" class="t_dot"></td>
                  </tr>
                  <tr>
                    <td class="tl_tit_left">첨부파일</td>
                    <td class="tk_left"><img src="http://info2.kw.ac.kr/images/COMMON/user/icon/point.gif" align="absmiddle">
                    <span class="fs8_b">용량 제한은 30 Mbyte 입니다.</span>
                        <table border="0" cellspacing="0" cellpadding="0">
                        <tbody><tr>
                          <td class="padding_r5">
                              <!-- 첨부파일 1 -->
                              <input name="file1" type="file" class="input2" id="textfield23" size="50">
                            </td>
                        </tr>
                      </tbody></table>
                        <table border="0" cellspacing="0" cellpadding="0">
                          <tbody><tr>
                            <td class="padding_r5">
                                <!-- 첨부파일 2 -->
                                <input name="file2" type="file" class="input2" id="textfield" size="50">
                            </td>
                          </tr>
                        </tbody></table>
                        <table border="0" cellspacing="0" cellpadding="0">
                          <tbody><tr>
                            <td class="padding_r5">
                                <!-- 첨부파일 3 -->
                                <input name="file3" type="file" class="input2" id="textfield" size="50">
                            </td>
                          </tr>
                        </tbody></table>
                        <table border="0" cellspacing="0" cellpadding="0">
                          <tbody><tr>
                            <td class="padding_r5">
                                <!-- 첨부파일 4 -->
                                <input name="file4" type="file" class="input2" id="textfield" size="50">
                            </td>
                          </tr>
                        </tbody></table>
                        <table border="0" cellspacing="0" cellpadding="0">
                          <tbody><tr>
                            <td class="padding_r5">
                                <!-- 첨부파일 5 -->
                                <input name="file5" type="file" class="input2" id="textfield3" size="50">
                            </td>
                          </tr>
                      </tbody></table></td>
                  </tr>
                </tbody></table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tbody><tr>
                    <td class="tl_line1"></td>
                  </tr>
                  <tr>
                    <td class="tl_line3"></td>
                  </tr>
                </tbody></table>      
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tbody><tr>
                    <td class="h10"></td>
                  </tr>
                  <tr>
                    <td class="btn_ri"><table border="0" cellspacing="0" cellpadding="0" align="right">
                        <tbody><tr>
                          <td><input type="submit" value="글쓰기" style="float: right; height: 40px; width: 80px;"></td>
                          <td class="btn014"></td>
                          <td><input onclick="location.href='prof-lecture-write.jsp'" value="다시쓰기" style="float: right; height: 40px; width: 80px;"></td>
                          <td class="btn014"></td>
                          <td><input onclick="location.href='prof-lecture.jsp'" value="목록" style="float: right; height: 40px; width: 80px;"></td>
                        </tr>
                    </tbody></table></td>
                  </tr>
                </tbody></table>
                
          
                </td>
            </tr>
          </tbody></table>
          <input type="submit" value="글쓰기" style="float: right; height: 40px; width: 80px;">
    </form>
    </html>