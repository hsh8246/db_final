<%@page import="member.MemberDao"%>
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
 <jsp:useBean id = "mbean" class = "member.MemberBean"> </jsp:useBean>
 <!-- 빈클래스에 데이터를 추가 -->
 <jsp:setProperty property = "*" name = "mbean"/>
  
   <!-- 데이터를 추가 -->
  <%
 MemberDao mdao = new MemberDao();
  
  // 데이터를 추가하는 메소드 호출
 mdao.insertMember(mbean);

  // 데이터를 추가 후 제어권을 MemberList로 넘겨줌
 response.sendRedirect("Login.jsp");
 %>
</body>
</html>

