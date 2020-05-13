<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="post.Post"%>
<%@ page import="post.PostDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device=width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>광운대 자유게시판</title>
<style type="text/css">
      a {
            text-decoration: none;
            font-size: inherit;
            font-weight: inherit;
            font-family: inherit;
            text-decoration: none;
      }
      a:link, a:visited, a:hover {
      text-decoration: none;
   }
      header {
            position: fixed;
            background: #525150;
            top: 0px;
            left: 0px;
            width: 100%;
            line-height: 41px;
      }
</style>
<a style="color: white" href="logoutAction.jsp" > LOGOUT </a>
<a style="color: white" href="main.jsp" > HOME </a>
</head>
<body>
   <%
      int pageNumber = 1;
      if (request.getParameter("pageNumber") != null) {
         pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
      }
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
                  <th style="background-color: #eeeeee; text-align: center;">번호</th>
                  <th style="background-color: #eeeeee; text-align: center;">제목</th>
                  <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                  <th style="background-color: #eeeeee; text-align: center;">작성일</th>
               </tr>
            </thead>
            <tbody>
               <%
                  PostDAO postDAO = new PostDAO();
                  ArrayList<Post> list = postDAO.getList(pageNumber);
                  for (int i = 0; i < list.size(); i++) {
               %>
               <tr>
                  <td><%=list.get(i).getpNum()%></td>
                  <td><a style="color: black" href="view.jsp?pNum=<%=list.get(i).getpNum()%>"> <%=list.get(i).getpTitle()%></a></td>
                  <td><%=list.get(i).getwNum()%></td>
                  <td><%=list.get(i).getpDate().substring(0, 11) + list.get(i).getpDate().substring(11, 13) + "시"
                  + list.get(i).getpDate().substring(14, 16) + "분"%></td>
               </tr>
               <%
                  }
               %>
            </tbody>
         </table>
         <%
            if (pageNumber != 1) {
         %>
            <a href="board.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
         <%
            } if(postDAO.nextPage(pageNumber + 1)){
         %>
            <a href="board.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
         <%
            }
         %>
         <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
      </div>
   </div>
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
   <script src="js/bootstrap.js"></script>
</html>