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

 // �Խ��� �����͸� �����ϴ� �޼ҵ�
 public void insertBoard(BoardBean bbean){
  // ������ ���̽��� ����
  this.con();
  // �����غ�
  String sql ="insert into board values(seq_inc.nextval,?,?,?,?,0)"; // �Խ��� ��ȣ�� �ڵ����� 1�� �����ϵ��� ������ ����
  // ���� ���ఴü �غ�
  try {
   pstmt = con.prepareStatement(sql);
   // ?�� ������ �Է�
   pstmt.setString(1, bbean.getUname()); 
   pstmt.setString(2, bbean.getBname());
   pstmt.setString(3, bbean.getBtext()); 
   pstmt.setString(4, bbean.getBdate());  

   // ������ ���� �Ͻÿ�
   pstmt.executeUpdate();
   // �ڿ� �ݳ�
   pstmt.close();
   con.close();

  } catch (SQLException e) {
   e.printStackTrace();
  }
 }

 // ��� �Խ��ǿ� ���� �������� �޼ҵ�
 public Vector<BoardBean> getAllBoard(){
  Vector<BoardBean> vector = new Vector<>();
  BoardBean bean;
  try {
   // Ŀ�ؼ� ����
   this.con();
   // ���� �غ�
   String sql = "select * from board";
   // ���� ����
   pstmt = con.prepareStatement(sql);
   // ���� ������ ����� resultset�� �޾���
   rs =pstmt.executeQuery();
   // �ݺ����� �̿��Ͽ� �����͸� ��Ŭ������ �����Ŀ� �׺� Ŭ������ ���Ϳ� ����
   while(rs.next()){
    bean = new BoardBean();
    bean.setNum(rs.getInt(1));
    bean.setUname(rs.getString(2));
    bean.setBname(rs.getString(3));
    bean.setBtext(rs.getString(4));
    bean.setBdate(rs.getString(5));
    bean.setTotal(rs.getInt(6));
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
 public BoardBean getOneBoard(int num){
  BoardBean bean = null; // �����ϱ����ؼ� �ʿ��� ��ü- �� �Խù��� ���� ������ ����Ǵ� Ŭ����
  // Ŀ�ؼǿ���
  this.con();
  try {
   //���� �غ�
   String sql ="select * from board where num=?";
   //������ �����ų ��ü ����
   pstmt = con.prepareStatement(sql);
   //?�� ���� �Է�
   pstmt.setInt(1, num);

   //���� ������ �����͸� ���� ����
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

 // �Խ��� ���� ���� (�ش� ���̵�� ��ġ���� ������ ���� �Ұ�)
 public boolean updateBoard(int num, String bname, String btext, String id){
  try {
   con();
   // �����غ�
   String sql = "select uname from board where num=?";
   // Ŀ���� �����Ҽ� �ִ� ��ü ����
   pstmt = con.prepareStatement(sql);
   pstmt.setInt(1, num);
   // Ŀ�� ����
   rs = pstmt.executeQuery();

   rs.next();   
   if(rs.getString(1).equals(id)){
    sql = "update board set bname=?, btext=? where num=?";
    // Ŀ���� �����Ҽ� �ִ� ��ü ����
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, bname);
    pstmt.setString(2, btext);
    pstmt.setInt(3, num);

    // Ŀ�� ����
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

 // �Խ��� ���� ���� (�ش� ���̵�� ��ġ���� ������ ���� �Ұ�)
 public boolean deleteBoard(int num, String id){
  try {
   con();
   //�����غ�
   String sql = "select uname from board where num=?";
   //Ŀ���� �����Ҽ� �ִ� ��ü ����
   pstmt = con.prepareStatement(sql);
   pstmt.setInt(1, num);
   //Ŀ�� ����
   rs = pstmt.executeQuery();

   rs.next();
   if(rs.getString(1).equals(id)){
    sql = "delete from board where num=?";
    // Ŀ���� �����Ҽ� �ִ� ��ü ����
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, num);
    // Ŀ�� ����
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

 // ��ȸ���� ������Ű�� ���� �޼ҵ�
 public void increaseTotal (int num){
  con();
  try{
   // ���� ���õ� �Խñ� ��ȣ�� ��ȸ���� ������
   String sql = "select total from board where num=?";
   pstmt = con.prepareStatement(sql);
   pstmt.setInt(1, num);
   rs = pstmt.executeQuery();
   rs.next();
   int total = rs.getInt(1); // ������ ��ȸ���� ������ ����
   
   // �ش� �Խñ� ��ȣ�� ��ȸ���� ����
   sql = "update board set total=? where num=?";
   pstmt = con.prepareStatement(sql);
   pstmt.setInt(1, total+1); // 1 �������Ѽ� ����
   pstmt.setInt(2, num);
   pstmt.executeUpdate();

   pstmt.close();
   con.close();
  } catch (Exception e) {
  }
 }
}