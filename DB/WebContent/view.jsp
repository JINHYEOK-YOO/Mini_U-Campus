<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="post.Post"%>
<%@ page import="post.PostDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device=width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>광운대 자유게시판</title>
<style type="text/css">
      a:link, a:visited, a:hover {
      text-decoration: none;
   }
      a {
            color: white;
            font-size: inherit;
            font-weight: inherit;
            font-family: inherit;
            text-decoration: none;
            line-height: 41px;
      }
      header {
            position: fixed;
            background: #525150;
            top: 0px;
            left: 0px;
            width: 100%;
      }
</style>
</head>
<body>
   <%
      String userNum = null;
      if (session.getAttribute("userNum") != null) {
         userNum = (String) session.getAttribute("userNum");
      }
      int pNum = 0;
      if (request.getParameter("pNum") != null) {
         pNum = Integer.parseInt(request.getParameter("pNum"));
      }
      if (pNum == 0) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('유효하지 않는 글입니다.')");
         script.println("location.href = 'board.jsp'");
         script.println("</script>");
      }
      Post post = new PostDAO().getPost(pNum);
   %>
   <header>
      <div style="float: right; margin-right: 15px">
      <a href="logoutAction.jsp" > LOGOUT </a>
      <a href="main.jsp"> HOME </a>
      </div>
   </header>
   <br>
   <br>
   <div class="container">
      <div class="row">
         <table class="table table-stryped"
            style="text-align: center; border: 1px solid #dddddd">
            <thead>
               <tr>
                  <th colspan="3"
                     style="background-color: #eeeeee; text-align: center;">게시판
                     게시판 글 보기</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td style="width: 20%;">글 제목</td>
                  <td colspan="2"><%=post.getpTitle()%></td>
               </tr>
               <tr>
                  <td>작성자</td>
                  <td colspan="2"><%=post.getwNum()%></td>
               </tr>
               <tr>
                  <td>작성일자</td>
                  <td colspan="2"><%=post.getpDate().substring(0, 11) + post.getpDate().substring(11, 13) + "시"
               + post.getpDate().substring(14, 16) + "분"%></td>
               </tr>
               <tr>
                  <td>내용</td>
                  <td colspan="2" style="min-height: 200px; text-align: left;"><%=post.getpContext().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;")
               .replaceAll("\n", "<br>")%></td>
               </tr>
            </tbody>
         </table>
         <a href="board.jsp" class="btn btn-primary">목록</a>
         <%
            if (userNum != null && userNum.equals(post.getwNum())) {
         %>
         <a href="update.jsp?pNum=<%=pNum%>" class="btn btn-primary">수정</a> <a
            href="deleteAction.jsp?pNum=<%=pNum%>" class="btn btn-primary">삭제</a>
         <%
            }
         %>
      </div>
   </div>
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
   <script src="js/bootstrap.js"></script>
</html>