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
 <!-- ��Ŭ���� ���� -->
  <jsp:useBean id = "bbean" class = "board.BoardBean"></jsp:useBean>
  <!-- ��Ŭ������ �����͸� �߰� -->
   <jsp:setProperty property = "*" name = "bbean"/>
   
   <!-- �����͸� �߰� -->
  <%
 BoardDao bdao = new BoardDao();
 
 String id = session.getAttribute("name").toString();
 
 Calendar cal = Calendar.getInstance(); // �Խñ� ��¥�� ���� �޼ҵ� ȣ��
 java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
  
 bbean.setUname(id); // Session���� �޾ƿ� �Խ��� ����
 bbean.setBdate(date.toString()); // �Խñ� ��¥ ����
 
  // �Խñ� �����͸� �߰��ϴ� �޼ҵ� ȣ��
 bdao.insertBoard(bbean);

  // �����͸� �߰� �� ������� ContentList�� �Ѱ���
 response.sendRedirect("ContentList.jsp");
 %>
</body>
</html>