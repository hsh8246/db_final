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
 <!-- ��Ŭ���� ���� -->
 <jsp:useBean id = "mbean" class = "member.MemberBean"> </jsp:useBean>
 <!-- ��Ŭ������ �����͸� �߰� -->
 <jsp:setProperty property = "*" name = "mbean"/>
  
   <!-- �����͸� �߰� -->
  <%
 MemberDao mdao = new MemberDao();
  
  // �����͸� �߰��ϴ� �޼ҵ� ȣ��
 mdao.insertMember(mbean);

  // �����͸� �߰� �� ������� MemberList�� �Ѱ���
 response.sendRedirect("Login.jsp");
 %>
</body>
</html>

