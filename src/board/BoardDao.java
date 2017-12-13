package board;

import java.sql.*;
import java.util.Vector;

public class BoardDao {

 String url="jdbc:oracle:thin:@localhost:1521:ORCL";
 String id="school";
 String pass="school";
 Connection con;
 PreparedStatement pstmt;
 ResultSet rs;

 // 데이터 베이스에 접근하는 메소드 
 public void con(){
  try {
   // 1.어느 데이터 베이스를 사용할건지를 설정 
   Class.forName("oracle.jdbc.driver.OracleDriver");
   // 2.실제 데이터 베이스에 접근하기위한 소스를 작성 == 접속완료되면 커넥션을 리턴
   con = DriverManager.getConnection(url, id, pass); 

  }catch(Exception e){
   e.printStackTrace();
  } 
 }

 // 게시판 데이터를 저장하는 메소드
 public void insertBoard(BoardBean bbean){
  // 데이터 베이스에 접근
  this.con();
  // 쿼리준비
  String sql ="insert into board values(seq_inc.nextval,?,?,?,?,0)"; // 게시판 번호가 자동으로 1씩 증가하도록 시퀀스 적용
  // 쿼리 실행객체 준비
  try {
   pstmt = con.prepareStatement(sql);
   // ?에 데이터 입력
   pstmt.setString(1, bbean.getUname()); 
   pstmt.setString(2, bbean.getBname());
   pstmt.setString(3, bbean.getBtext()); 
   pstmt.setString(4, bbean.getBdate());  

   // 쿼리를 실행 하시오
   pstmt.executeUpdate();
   // 자원 반납
   pstmt.close();
   con.close();

  } catch (SQLException e) {
   e.printStackTrace();
  }
 }

 // 모든 게시판에 대한 가져오는 메소드
 public Vector<BoardBean> getAllBoard(){
  Vector<BoardBean> vector = new Vector<>();
  BoardBean bean;
  try {
   // 커넥션 연결
   this.con();
   // 쿼리 준비
   String sql = "select * from board";
   // 쿼리 실행
   pstmt = con.prepareStatement(sql);
   // 쿼리 실행후 결과를 resultset이 받아줌
   rs =pstmt.executeQuery();
   // 반복문을 이용하여 데이터를 빈클래스에 담은후에 그빈 클래스를 백터에 저장
   while(rs.next()){
    bean = new BoardBean();
    bean.setNum(rs.getInt(1));
    bean.setUname(rs.getString(2));
    bean.setBname(rs.getString(3));
    bean.setBtext(rs.getString(4));
    bean.setBdate(rs.getString(5));
    bean.setTotal(rs.getInt(6));
    // 빈클래스에 담은 데이터를 백터에 추가
    vector.add(bean);
   }   
   con.close();
   pstmt.close();
   rs.close();
  } catch (Exception e) {
   e.printStackTrace();
  }  
  return vector;
 }

 // 한사람의 대한 정보를 모두 얻어오는 메소드
 public BoardBean getOneBoard(int num){
  BoardBean bean = null; // 리턴하기위해서 필요한 객체- 한 게시물에 대한 정보가 저장되는 클래스
  // 커넥션연결
  this.con();
  try {
   //쿼리 준비
   String sql ="select * from board where num=?";
   //쿼리를 실행시킬 객체 선언
   pstmt = con.prepareStatement(sql);
   //?에 값을 입력
   pstmt.setInt(1, num);

   //쿼리 실행후 데이터를 리턴 받음
   rs = pstmt.executeQuery();

   while(rs.next()){
    bean = new BoardBean();
    bean.setNum(rs.getInt(1));
    bean.setUname(rs.getString(2));
    bean.setBname(rs.getString(3));
    bean.setBtext(rs.getString(4));
   }
   con.close();
   pstmt.close();
   rs.close();  
  } catch (Exception e) {
  }
  return bean;
 }

 // 게시판 정보 수정 (해당 아이디와 일치하지 않으면 수정 불가)
 public boolean updateBoard(int num, String bname, String btext, String id){
  try {
   con();
   // 쿼리준비
   String sql = "select uname from board where num=?";
   // 커리를 실행할수 있는 객체 생성
   pstmt = con.prepareStatement(sql);
   pstmt.setInt(1, num);
   // 커리 실행
   rs = pstmt.executeQuery();

   rs.next();   
   if(rs.getString(1).equals(id)){
    sql = "update board set bname=?, btext=? where num=?";
    // 커리를 실행할수 있는 객체 생성
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, bname);
    pstmt.setString(2, btext);
    pstmt.setInt(3, num);

    // 커리 실행
    pstmt.executeUpdate();
    pstmt.close();
    con.close();
    rs.close();
    
    return true;
   }
   
   pstmt.close();
   con.close();
   rs.close();
   
  } catch (Exception e) {
  }
  return false;
 }

 // 게시판 정보 삭제 (해당 아이디와 일치하지 않으면 삭제 불가)
 public boolean deleteBoard(int num, String id){
  try {
   con();
   //쿼리준비
   String sql = "select uname from board where num=?";
   //커리를 실행할수 있는 객체 생성
   pstmt = con.prepareStatement(sql);
   pstmt.setInt(1, num);
   //커리 실행
   rs = pstmt.executeQuery();

   rs.next();
   if(rs.getString(1).equals(id)){
    sql = "delete from board where num=?";
    // 커리를 실행할수 있는 객체 생성
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, num);
    // 커리 실행
    pstmt.executeUpdate();
    pstmt.close();
    con.close();
    rs.close();
    
    return true;
   }
   
   pstmt.close();
   con.close();
   rs.close();

  } catch (Exception e) {
  }
  return false;
 }

 // 조회수를 증가시키기 위한 메소드
 public void increaseTotal (int num){
  con();
  try{
   // 현재 선택된 게시글 번호의 조회수를 가져옴
   String sql = "select total from board where num=?";
   pstmt = con.prepareStatement(sql);
   pstmt.setInt(1, num);
   rs = pstmt.executeQuery();
   rs.next();
   int total = rs.getInt(1); // 가져온 조회수를 변수에 넣음
   
   // 해당 게시글 번호의 조회수를 수정
   sql = "update board set total=? where num=?";
   pstmt = con.prepareStatement(sql);
   pstmt.setInt(1, total+1); // 1 증가시켜서 수정
   pstmt.setInt(2, num);
   pstmt.executeUpdate();

   pstmt.close();
   con.close();
  } catch (Exception e) {
  }
 }
}