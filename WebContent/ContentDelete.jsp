<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� �� �� �� ��</title>
</head>
<body>
 <%
  request.setCharacterEncoding("euc-kr");
  int num = Integer.parseInt(request.getParameter("num"));
  String id = session.getAttribute("name").toString();

  
  // ��� ���ᰴü ����
  BoardDao bdao = new BoardDao();
  // ���̺� ����
  if(bdao.deleteBoard(num, id)) // ���̵� ��ġ�ϸ� ���� ��
   response.sendRedirect("ContentList.jsp"); // �Խ��� ����Ʈ�� ����
  
  else{
 %>
   <script type="text/javascript">
    alert("���� ������ �����ϴ�.");
    history.go(-1); // -1�� ������������ �̵��϶�� �ǹ�
   </script>
 <%
  }
 %>
</body>
</html>