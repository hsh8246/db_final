<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>

<link rel="stylesheet" href="css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap/animate.css">
<link rel="stylesheet" href="css/fonts/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap/font.css">
<link rel="stylesheet" href="css/bootstrap/fuelux.css">
<link rel="stylesheet" href="css/bootstrap/datatables.css">
<link rel="stylesheet" href="css/bootstrap/app.css">
</head>
<body>
<br/>
<br/>
<br/>

       <div class="row m-n">
          <div class="col-md-4 col-md-offset-4 m-t-lg">
             <section class="panel">
                <form action = "LoginProc.jsp" method = "post">
                   <div class="form-group">
                      <label class="control-label">���̵�</label>
                      <input type="text" placeholder="ID" class="form-control" name="id" id="id" />
                   </div>
                   <div class="form-group">
                      <label class="control-label">�н�����</label>
                      <input type="password" placeholder="PASSWORD" class="form-control"  name="pass" id="pass" autocomplete="off"/>
                   </div>                  
             <input type = "submit" class="btn btn-sm btn-danger" value = "�α���">
			 <input type = "button" class="btn btn-sm btn-success" value = "ȸ������" onclick = "window.location='MemberJoin.jsp'">
                </form>
             </section>
          </div>
       </div>
</body>
</html>