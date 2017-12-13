<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="board.BoardBean"%>
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
 <% request.setCharacterEncoding("euc-kr"); %>
 <!-- 빈클래스 생성 -->
  <jsp:useBean id = "bbean" class = "board.BoardBean"></jsp:useBean>
  <!-- 빈클래스에 데이터를 추가 -->
   <jsp:setProperty property = "*" name = "bbean"/>
   
   <!-- 데이터를 추가 -->
  <%
 BoardDao bdao = new BoardDao();
 
 String id = session.getAttribute("name").toString();
 
 Calendar cal = Calendar.getInstance(); // 게시글 날짜를 위한 메소드 호출
 java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
  
 bbean.setUname(id); // Session으로 받아온 게시자 저장
 bbean.setBdate(date.toString()); // 게시글 날짜 저장
 
  // 게시글 데이터를 추가하는 메소드 호출
 bdao.insertBoard(bbean);

  // 데이터를 추가 후 제어권을 ContentList로 넘겨줌
 response.sendRedirect("ContentList.jsp");
 %>
</body>
</html>