<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게 시 판 정 보</title>
<link rel="stylesheet" href="css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap/animate.css">
<link rel="stylesheet" href="css/fonts/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap/font.css">
<link rel="stylesheet" href="css/bootstrap/fuelux.css">
<link rel="stylesheet" href="css/bootstrap/datatables.css">
<link rel="stylesheet" href="css/bootstrap/app.css">
</head>
<body>
<center>
  <h2> 게 시 판 정 보 </h2>
  <%
   BoardDao bdao = new BoardDao();
   // 게시판 빈클래스 선언
   BoardBean board = new BoardBean();
   int num = Integer.parseInt(request.getParameter("num"));
   board = bdao.getOneBoard(num); // 하나의 게시판에대한 정보를 가져옴
   
   // 조회수를 증가시킴
   bdao.increaseTotal(num);
  %>
  <form action = "ContentUpdate.jsp" method = "post">
  <table border = "1" width = "700" class="table table-striped b-t text-sm" cellpadding = "5">
  <tr>
   <th width = "100"> 글번호 </th>
   <td width = "250"> <input type = "text" size = "40" class="form-control" name = "num" value = "<%=board.getNum()%>" disabled> </td>
  </tr>
  <tr>
   <th width = "100"> 작성자 </th>
   <td width = "250"> <input type = "text" size = "40" class="form-control" name = "uname" value = "<%=board.getUname()%>" disabled> </td>
  </tr>
  <tr>
   <th width = "100"> 글제목 </th>
   <td width = "250"> <input type = "text" size = "40" class="form-control" name = "bname" value = "<%=board.getBname()%>"> </td>
  </tr>
  <tr>
   <th width = "100"> 내용 </th>
   <td width = "250"> <textarea cols = "40" rows = "10" class="form-control"  name = "btext"><%=board.getBtext()%></textarea> </td>
  </tr>
  </table>
  
  <table border = "0" width = "250" cellpadding = "5">
  <tr>
    <td> <input type = "submit" class="btn btn-sm btn-default" value = "글수정"> </td>
    <td> <input type = "button" class="btn btn-sm btn-danger" value = "글삭제" onclick = "window.location='ContentDelete.jsp?num=<%=board.getNum()%>'"> </td>
    <td> <input type = "button" class="btn btn-sm btn-primary" value = "글쓰기" onclick = "window.location='ContentWrite.jsp?num=<%=board.getNum()%>'"> </td>
    <td> <input type = "button" class="btn btn-sm btn-success" value = "목록" onclick = "window.location.replace('ContentList.jsp')"> </td>
  </tr>
  </table>
  <input type = "hidden" name="num2" value="<%=board.getNum()%>">
  
  </form>
</center>
</body>
</html>