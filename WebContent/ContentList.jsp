<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게 시 판</title>
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
 <h2> 게 시 판 </h2>
 <form action = "ContentWrite.jsp" method = "post">
 <table border = "1" width = "700" class="table table-striped b-t text-sm" cellpadding = "5">
 <tr>
  <th width = "50"> 번호 </th>
  <th width = "100"> 작성자 </th>
  <th width = "350"> 글제목 </th>
  <th width = "100"> 날짜 </th>
  <th width = "100"> 조회수 </th>
 </tr>
 
 <%
 BoardDao bdao = new BoardDao();
 Vector<BoardBean> vector = new Vector();
 vector = bdao.getAllBoard(); // board DB의 모든 게시판 정보를 가져옴
 
 // 게시판 빈클래스 선언
 BoardBean bean = new BoardBean();
 
 for(int i = 0 ; i < vector.size() ; i++){
  // 백터에 담긴 BoardBean 클래스를 추출
  bean = vector.get(i);
 %>
 
 <tr>
  <td width = "50"> <a href = "ContentInfo.jsp?num=<%=bean.getNum()%>"> <%=bean.getNum()%> </a></td>
  <td width = "100"> <%=bean.getUname()%> </td>
  <td width = "300"> <%=bean.getBname()%> </td>
  <td width = "100"> <%=bean.getBdate()%> </td>
     <td width = "100"> <%=bean.getTotal()%></td></tr>
    <%   
    }
    %>
    <tr>
   <td colspan = "7" align = "center">
   <input type = "submit" class="btn btn-sm btn-danger" value = "글쓰기">
   <input type = "button" value = "로그아웃" class="btn btn-sm btn-primary" onclick = "window.location.replace('Login.jsp')"> </td>
 </tr>
  </table>
  </form>
</center>
</body>
</html>