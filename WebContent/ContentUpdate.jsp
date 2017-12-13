<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <%
   request.setCharacterEncoding("euc-kr");
  int num = Integer.parseInt(request.getParameter("num2"));
  String id = session.getAttribute("name").toString();
  String bname = request.getParameter("bname");
  String btext = request.getParameter("btext");
   
  // 디비 연결객체 생성
  BoardDao bdao = new BoardDao();
  // 게시판 글을 수정하는 메소드 호출
  
  if(bdao.updateBoard(num, bname, btext, id)) // 아이디가 일치하면 수정 후
   response.sendRedirect("ContentList.jsp"); // 게시판 리스트로 보냄
  
  else{
 %>
   <script type="text/javascript">
    alert("수정 권한이 없습니다.");
    history.go(-1); // -1은 이전페이지로 이동하라는 의미
   </script>
 <%
  }
 %>
</body>
</html>