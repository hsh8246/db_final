<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
 <h2> ȸ �� �� �� </h2>
 <form action = "MemberJoinProc.jsp" method = "post">
   <table border = "1" width = "700" class="table table-striped b-t text-sm" cellpadding = "5">
  
    <tr>
    <td> ���̵� </td>
    <td> <input type = "text" class="form-control" name = id> </td>
    <td colspan = "2" align = "right"><b> *10���̳� </b> </td>
    </tr>
    
    <tr>
    <td> ��й�ȣ </td>
    <td> <input type = "password" class="form-control" name = pass></td>
    <td> ���� </td>
    <td> <input type = "text" class="form-control" name = "name"></td>
   </tr>
   
    <tr>
    <td> ���� </td>
    <td><input type = "radio" name = "gender" value = "��"> ��
     <input type = "radio" name = "gender" value = "��"> �� </td>
    <td> ��� </td>
    <td><input type = "checkbox"  name = "hobby1" value = "���ǰ���"> ���ǰ��� 
     <input type = "checkbox"  name = "hobby2" value = "��ȭ����"> ��ȭ���� </td>
    </tr>
    
    <tr>
    <td> �ּ� </td>
    <td> <input type = "text" class="form-control" name = "address"> </td>
    <td> �̸��� </td>
    <td> <input type = "text" class="form-control" name = "email"> </td>
    </tr>
    
 <tr>
    <td> H.P </td>
    <td> <select name = "phone1">
    <option value = "010"> 010 </option>
         <option value = "011"> 011 </option>
         <option value = "070"> 070 </option>
      </select> 
      &nbsp; - &nbsp; <input type = "text" name = "phone2" size = "4">
       &nbsp; - &nbsp; <input type = "text" name = "phone3" size = "4"> </td>
       
 <td colspan = "2" align = "right"> <b>*�ʼ��Է� </b> </td>
 </tr>
 
 <tr>
    <td> �ڱ�Ұ� </td>
    <td colspan = "3">
    <textarea cols = "50" rows = "3" class="form-control" name = "introduce"></textarea> </td>
    </tr>
    
    <tr>
    <td colspan = "4" align = "center"> 
    <input type = "submit" class="btn btn-sm btn-success" value = "����">
    <input type = "reset" class="btn btn-sm btn-primary" value = "���">
    <input type = "button" class="btn btn-sm btn-danger" value = "�ڷΰ���" onclick = "window.location='Login.jsp'"></td>
    </tr>
   </table>

 </form>
</center>
</body>
</html>