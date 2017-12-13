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
 <!-- 빈클래스 생성 -->
  <jsp:useBean id = "mbean" class = "member.MemberBean"></jsp:useBean>
  <!-- 빈클래스에 데이터를 추가 -->
   <jsp:setProperty property = "*" name = "mbean"/>
   
 <%
  String id = request.getParameter("id");
  String pass = request.getParameter("pass");

  // Dao클래스에 있는 한사람에대한 정보를 얻어오는 메소드를 작성
  MemberDao mdao = new MemberDao();
  int result = mdao.login(id, pass);
  
  if(result == 0){ // 아이디와 비밀번호 일치
   session.setAttribute("name", id); // id를 세션에 name으로 저장
   session.setAttribute("pass", pass);
   response.sendRedirect("ContentList.jsp"); // 게시판 리스트로 보냄
  }
  
  else if(result == 1){
  %>
   <script type="text/javascript">
    alert("아이디를 다시 확인해 주십시오.");
    history.go(-1); // -1은 이전페이지로 이동하라는 의미
   </script>
  <%
  }
  
  else{
  %>
   <script type="text/javascript">
    alert("비밀번호를 다시 확인해 주십시오.");
    history.go(-1); // -1은 이전페이지로 이동하라는 의미
   </script>
  <%
   }
  %>
</body>
</html>