<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
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

<script language = "javascript">  // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.writeform;

  if( !form.bname.value )
   {
    alert( "제목을 적어주세요" );
    form.bname.focus();
    return;
   }
 
  if( !form.btext.value )
   {
    alert( "내용을 적어주세요" );
    form.btext.focus();
    return;
   }
 
  form.submit();
  }
 </script>
 
</head>
<body>
<center>
  <h2> 글 쓰 기 </h2>
  
  <form name=writeform action = "ContentWriteProc.jsp" method = "post">
  <table border = "1" class="table table-striped b-t text-sm" cellpadding = "5">
  <tr>
   <th width = "100"> 글 제목 </th>
   <td width = "250"> <input type = "text" class="form-control" size = "40" name = "bname"> </td>
  </tr>
  <tr>
   <th width = "100"> 글 내용 </th>
   <td width = "250"> <textarea cols = "40" class="form-control" rows = "16" name = "btext"></textarea> </td>
  </tr>
  </table>
  
  <table border = "0" width = "150" cellpadding = "5">
  <tr>
    <td> <input type = "button" class="btn btn-sm btn-primary" value = "글쓰기" OnClick="javascript:writeCheck();"> </td>
    <td> <input type = "button" class="btn btn-sm btn-success" value = "목록" onclick = "window.location.replace('ContentList.jsp')"> </td>
    <td> <input type="reset" class="btn btn-sm btn-default" value="다시작성"> </td>
  </tr>
  </table>
  </form>
</center>
</body>
</html>