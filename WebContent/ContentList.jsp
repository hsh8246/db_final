<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� �� ��</title>
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
 <h2> �� �� �� </h2>
 <form action = "ContentWrite.jsp" method = "post">
 <table border = "1" width = "700" class="table table-striped b-t text-sm" cellpadding = "5">
 <tr>
  <th width = "50"> ��ȣ </th>
  <th width = "100"> �ۼ��� </th>
  <th width = "350"> ������ </th>
  <th width = "100"> ��¥ </th>
  <th width = "100"> ��ȸ�� </th>
 </tr>
 
 <%
 BoardDao bdao = new BoardDao();
 Vector<BoardBean> vector = new Vector();
 vector = bdao.getAllBoard(); // board DB�� ��� �Խ��� ������ ������
 
 // �Խ��� ��Ŭ���� ����
 BoardBean bean = new BoardBean();
 
 for(int i = 0 ; i < vector.size() ; i++){
  // ���Ϳ� ��� BoardBean Ŭ������ ����
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
   <input type = "submit" class="btn btn-sm btn-danger" value = "�۾���">
   <input type = "button" value = "�α׾ƿ�" class="btn btn-sm btn-primary" onclick = "window.location.replace('Login.jsp')"> </td>
 </tr>
  </table>
  </form>
</center>
</body>
</html>