<%@page import="member.MemberBean"%>
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
  <jsp:useBean id = "mbean" class = "member.MemberBean"></jsp:useBean>
  <!-- ��Ŭ������ �����͸� �߰� -->
   <jsp:setProperty property = "*" name = "mbean"/>
   
 <%
  String id = request.getParameter("id");
  String pass = request.getParameter("pass");

  // DaoŬ������ �ִ� �ѻ�������� ������ ������ �޼ҵ带 �ۼ�
  MemberDao mdao = new MemberDao();
  int result = mdao.login(id, pass);
  
  if(result == 0){ // ���̵�� ��й�ȣ ��ġ
   session.setAttribute("name", id); // id�� ���ǿ� name���� ����
   session.setAttribute("pass", pass);
   response.sendRedirect("ContentList.jsp"); // �Խ��� ����Ʈ�� ����
  }
  
  else if(result == 1){
  %>
   <script type="text/javascript">
    alert("���̵� �ٽ� Ȯ���� �ֽʽÿ�.");
    history.go(-1); // -1�� ������������ �̵��϶�� �ǹ�
   </script>
  <%
  }
  
  else{
  %>
   <script type="text/javascript">
    alert("��й�ȣ�� �ٽ� Ȯ���� �ֽʽÿ�.");
    history.go(-1); // -1�� ������������ �̵��϶�� �ǹ�
   </script>
  <%
   }
  %>
</body>
</html>