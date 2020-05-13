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
<title>광운대 자유게시판</title>
<style type="text/css">
      a, a:link, a:visited, a:hover{
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
      <header>
            <div style="float: right; margin-right: 15px">
                  <a href="../login/logoutAction.jsp" > LOGOUT </a>
                  <a href="../main.jsp"> HOME </a>
            </div>
      </header>
   <%
      String userNum = null;
      if (session.getAttribute("userNum") != null) {
         userNum = (String) session.getAttribute("userNum");
      }
      if (userNum == null){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('로그인을 하세요')");
         script.println("location.href = 'login.jsp'");
         script.println("</script>");
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
      if(!userNum.equals(post.getwNum())){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('권한이 없습니다.')");
         script.println("location.href = 'board.jsp'");
         script.println("</script>");
      }
   %>
   <br>
   <br>
   <div class="container">
      <div class="row">
         <form method="post" action="updateAction.jsp?pNum=<%=pNum%>">
            <table class="table table-stryped"
               style="text-align: center; border: 1px solid #dddddd; width: 100%;">
               <thead>
                  <tr>
                     <th colspan="2"
                        style="background-color: #eeeeee; text-align: center;">게시판
                        수정 양식</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td><input type="text" class="form-control"
                        placeholder="글 제목" name="pTitle" maxlength="50" value="<%= post.getpTitle() %>" style="width: 100%;"></td>
                  </tr>
                  <tr>
                     <td><textarea class="form-control" placeholder="글 내용"
                           name="pContext" maxlength="2048" style="height: 350px; width: 100%; resize: none"><%= post.getpContext() %></textarea></td>
                  </tr>
               </tbody>
            </table>
            <input type="submit" class="btn btn-primary pull-right" value="글쓰기" style="float: right; height: 40px; width: 80px;">
         </form>
      </div>
   </div>
</html>