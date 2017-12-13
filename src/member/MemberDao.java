package member;

import java.sql.*;
import java.util.Vector;

public class MemberDao {

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

 // 로그인 시 권한 검사를 위한 메소드
 public int login(String id, String pw) {
  con();
  try{
   String sql = "select pass from member where id=?";
   pstmt = con.prepareStatement(sql);
   pstmt.setString(1, id);
   rs = pstmt.executeQuery();
   if(!rs.next())
    return 1;
   if(rs.getString(1).equals(pw))  
    return 0;  

   pstmt.close();
   rs.close();
   con.close();
  }
  catch(Exception e) {
   e.printStackTrace();
  }
  return 2;
 }


 // 맴버 데이터를 저장하는 메소드
 public void insertMember(MemberBean mbean){
  // 데이터 베이스에 접근
  this.con();
  // 쿼리준비
  String sql ="insert into member values(?,?,?,?,?,?,?,?,?,?,?,?)";
  // 쿼리 실행객체 준비
  try {
   pstmt = con.prepareStatement(sql);
   // ?에 데이터 입력
   pstmt.setString(1, mbean.getId()); 
   pstmt.setString(2, mbean.getPass()); 
   pstmt.setString(3, mbean.getName());
   pstmt.setString(4, mbean.getGender()); 
   pstmt.setString(5, mbean.getHobby1()); 
   pstmt.setString(6, mbean.getHobby2()); 
   pstmt.setString(7, mbean.getAddress()); 
   pstmt.setString(8, mbean.getEmail()); 
   pstmt.setString(9, mbean.getPhone1()); 
   pstmt.setString(10, mbean.getPhone2()); 
   pstmt.setString(11, mbean.getPhone3()); 
   pstmt.setString(12, mbean.getIntroduce()); 

   // 쿼리를 실행 하시오
   pstmt.executeUpdate();
   // 자원 반납
   pstmt.close();
   con.close();

  } catch (SQLException e) {
   e.printStackTrace();
  }
 }

 // 모든 회원에 대한 가져오는 메소드
 public Vector<MemberBean> getAllMember(){
  Vector<MemberBean> vector = new Vector<>();
  MemberBean bean;
  try {
   // 커넥션 연결
   this.con();
   // 쿼리 준비
   String sql = "select * from member order by num";
   // 쿼리 실행
   pstmt = con.prepareStatement(sql);
   // 쿼리 실행후 결과를 resultset이 받아줌
   rs =pstmt.executeQuery();
   // 반복문을 이용하여 데이터를 빈클래스에 담은후에 그빈 클래스를 백터에 저장
   while(rs.next()){
    bean = new MemberBean();
    bean.setId(rs.getString(1));
    bean.setPass(rs.getString(2));
    bean.setName(rs.getString(3));
    bean.setGender(rs.getString(4));
    bean.setHobby1(rs.getString(5));
    bean.setHobby2(rs.getString(6));
    bean.setAddress(rs.getString(7));
    bean.setEmail(rs.getString(8));
    bean.setPhone1(rs.getString(9));
    bean.setPhone2(rs.getString(10));
    bean.setPhone3(rs.getString(11));
    bean.setIntroduce(rs.getString(12));
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
 public MemberBean getOneMember(String id){

  MemberBean bean=null; // 리턴하기위해서 필요한 객체- 한사람의 정보가 저장되는 클래스
  try {
   // 커넥션연결
   this.con();
   // 쿼리 준비
   String sql ="select * from member where id=?";
   // 쿼리를 실행시킬 객체 선언
   pstmt = con.prepareStatement(sql);
   // ?에 값을 입력
   pstmt.setString(1, id);

   // 쿼리 실행후 데이터를 리턴 받음
   rs = pstmt.executeQuery();

   while(rs.next()){
    bean = new MemberBean();
    bean.setId(rs.getString(1));
    bean.setPass(rs.getString(2));
    bean.setName(rs.getString(3));
    bean.setGender(rs.getString(4));
    bean.setHobby1(rs.getString(5));
    bean.setHobby2(rs.getString(6));
    bean.setAddress(rs.getString(7));
    bean.setEmail(rs.getString(8));
    bean.setPhone1(rs.getString(9));
    bean.setPhone2(rs.getString(10));
    bean.setPhone3(rs.getString(11));
    bean.setIntroduce(rs.getString(12));
   }
   con.close();
   pstmt.close();
   rs.close();  
  } catch (Exception e) {
  }
  return bean;
 }

 // 회원 정보 수정
 public void updateMember(String id , String address, String email){
  try {
   con();
   // 쿼리준비
   String sql="update member set address=?, email=? where id=?";
   // 커리를 실행할수 있는 객체 생성
   pstmt = con.prepareStatement(sql);
   pstmt.setString(1, address);
   pstmt.setString(2, email);
   pstmt.setString(3, id);

   // 커리 실행
   pstmt.executeUpdate();

   pstmt.close();
   con.close();
  } catch (Exception e) {
  }
 }

 // 회원 정보 삭제
 public void deleteMember(String id){
  try {
   con();
   // 쿼리준비
   String sql="delete from member where id=?";
   // 커리를 실행할수 있는 객체 생성
   pstmt = con.prepareStatement(sql);
   pstmt.setString(1, id);
   // 커리 실행
   pstmt.executeUpdate();

   pstmt.close();
   con.close();
  } catch (Exception e) {
  }
 }
}