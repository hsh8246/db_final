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
 <h2> 회 원 가 입 </h2>
 <form action = "MemberJoinProc.jsp" method = "post">
   <table border = "1" width = "700" class="table table-striped b-t text-sm" cellpadding = "5">
  
    <tr>
    <td> 아이디 </td>
    <td> <input type = "text" class="form-control" name = id> </td>
    <td colspan = "2" align = "right"><b> *10자이내 </b> </td>
    </tr>
    
    <tr>
    <td> 비밀번호 </td>
    <td> <input type = "password" class="form-control" name = pass></td>
    <td> 성명 </td>
    <td> <input type = "text" class="form-control" name = "name"></td>
   </tr>
   
    <tr>
    <td> 성별 </td>
    <td><input type = "radio" name = "gender" value = "남"> 남
     <input type = "radio" name = "gender" value = "여"> 여 </td>
    <td> 취미 </td>
    <td><input type = "checkbox"  name = "hobby1" value = "음악감상"> 음악감상 
     <input type = "checkbox"  name = "hobby2" value = "영화감상"> 영화감상 </td>
    </tr>
    
    <tr>
    <td> 주소 </td>
    <td> <input type = "text" class="form-control" name = "address"> </td>
    <td> 이메일 </td>
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
       
 <td colspan = "2" align = "right"> <b>*필수입력 </b> </td>
 </tr>
 
 <tr>
    <td> 자기소개 </td>
    <td colspan = "3">
    <textarea cols = "50" rows = "3" class="form-control" name = "introduce"></textarea> </td>
    </tr>
    
    <tr>
    <td colspan = "4" align = "center"> 
    <input type = "submit" class="btn btn-sm btn-success" value = "가입">
    <input type = "reset" class="btn btn-sm btn-primary" value = "취소">
    <input type = "button" class="btn btn-sm btn-danger" value = "뒤로가기" onclick = "window.location='Login.jsp'"></td>
    </tr>
   </table>

 </form>
</center>
</body>
</html>