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

 // ������ ���̽��� �����ϴ� �޼ҵ� 
 public void con(){
  try {
   // 1.��� ������ ���̽��� ����Ұ����� ���� 
   Class.forName("oracle.jdbc.driver.OracleDriver");
   // 2.���� ������ ���̽��� �����ϱ����� �ҽ��� �ۼ� == ���ӿϷ�Ǹ� Ŀ�ؼ��� ����
   con = DriverManager.getConnection(url, id, pass); 

  }catch(Exception e){
   e.printStackTrace();
  } 
 }

 // �α��� �� ���� �˻縦 ���� �޼ҵ�
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


 // �ɹ� �����͸� �����ϴ� �޼ҵ�
 public void insertMember(MemberBean mbean){
  // ������ ���̽��� ����
  this.con();
  // �����غ�
  String sql ="insert into member values(?,?,?,?,?,?,?,?,?,?,?,?)";
  // ���� ���ఴü �غ�
  try {
   pstmt = con.prepareStatement(sql);
   // ?�� ������ �Է�
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

   // ������ ���� �Ͻÿ�
   pstmt.executeUpdate();
   // �ڿ� �ݳ�
   pstmt.close();
   con.close();

  } catch (SQLException e) {
   e.printStackTrace();
  }
 }

 // ��� ȸ���� ���� �������� �޼ҵ�
 public Vector<MemberBean> getAllMember(){
  Vector<MemberBean> vector = new Vector<>();
  MemberBean bean;
  try {
   // Ŀ�ؼ� ����
   this.con();
   // ���� �غ�
   String sql = "select * from member order by num";
   // ���� ����
   pstmt = con.prepareStatement(sql);
   // ���� ������ ����� resultset�� �޾���
   rs =pstmt.executeQuery();
   // �ݺ����� �̿��Ͽ� �����͸� ��Ŭ������ �����Ŀ� �׺� Ŭ������ ���Ϳ� ����
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
    // ��Ŭ������ ���� �����͸� ���Ϳ� �߰�
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

 // �ѻ���� ���� ������ ��� ������ �޼ҵ�
 public MemberBean getOneMember(String id){

  MemberBean bean=null; // �����ϱ����ؼ� �ʿ��� ��ü- �ѻ���� ������ ����Ǵ� Ŭ����
  try {
   // Ŀ�ؼǿ���
   this.con();
   // ���� �غ�
   String sql ="select * from member where id=?";
   // ������ �����ų ��ü ����
   pstmt = con.prepareStatement(sql);
   // ?�� ���� �Է�
   pstmt.setString(1, id);

   // ���� ������ �����͸� ���� ����
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

 // ȸ�� ���� ����
 public void updateMember(String id , String address, String email){
  try {
   con();
   // �����غ�
   String sql="update member set address=?, email=? where id=?";
   // Ŀ���� �����Ҽ� �ִ� ��ü ����
   pstmt = con.prepareStatement(sql);
   pstmt.setString(1, address);
   pstmt.setString(2, email);
   pstmt.setString(3, id);

   // Ŀ�� ����
   pstmt.executeUpdate();

   pstmt.close();
   con.close();
  } catch (Exception e) {
  }
 }

 // ȸ�� ���� ����
 public void deleteMember(String id){
  try {
   con();
   // �����غ�
   String sql="delete from member where id=?";
   // Ŀ���� �����Ҽ� �ִ� ��ü ����
   pstmt = con.prepareStatement(sql);
   pstmt.setString(1, id);
   // Ŀ�� ����
   pstmt.executeUpdate();

   pstmt.close();
   con.close();
  } catch (Exception e) {
  }
 }
}