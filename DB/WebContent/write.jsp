<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<header>
      <div style="float: right; margin-right: 15px">
      <a href="logoutAction.jsp" > LOGOUT </a>
      <a href="main.jsp"> HOME </a>
      </div>
</header>
   <%
      String userNum = null;
      if (session.getAttribute("userNum") != null) {
         userNum = (String) session.getAttribute("userNum");
      }
   %>
   <br>
   <br>
   <div class="container">
      <div class="row">
         <form method="post" action="writeAction.jsp">
            <table class="table table-stryped"
               style="text-align: center; border: 1px solid #dddddd; width: 100%;">
               <thead>
                  <tr>
                     <th colspan="2"
                        style="background-color: #eeeeee; text-align: center;">게시판
                        글쓰기 양식</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td><input type="text" class="form-control"
                        placeholder="글 제목" name="pTitle" maxlength="50" style="width: 100%;"></td>
                  </tr>
                  <tr>
                     <td><textarea class="form-control" placeholder="글 내용"
                           name="pContext" maxlength="2048" style="height: 350px; width: 100%; resize: none"></textarea></td>
                  </tr>
               </tbody>
            </table>
            <br>
            <input type="submit" class="btn btn-primary pull-right" value="글쓰기" style="float: right; height: 40px; width: 80px;">
         </form>
      </div>
   </div>
</html>