package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class memberDAO {
	
	//DB 연결
	public Connection getConnection() {
		
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ansgusgh12");
			if(conn != null) {
				System.out.println("DB--------------성공");
			}
			else {
				System.out.println("DB..............실패");
			}
						
			return conn;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
	//instance 설정
	public static memberDAO instance = new memberDAO();
	
	public static memberDAO GetInstance() {
		return instance;
	}
	
	private memberDAO() {
		
	}
	
	
	//DB 연결 해제-1
	public void closeDBResource(Connection conn, PreparedStatement pstmt) {
		if(conn != null) {
			try {
				conn.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//DB연결 해제-2
	public void CloseDBResource(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(conn != null) {
			try {
				conn.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(rs != null) {
			try {
				rs.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//회원 목록
	public ArrayList<memberVO> readMembers() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<memberVO> list = new ArrayList<memberVO>();
		String sql = null;
		
		try {
			
			conn = getConnection();
			sql = "SELECT custno, custname, phone, address, TO_CHAR(joindate, 'yyyy-mm-dd') AS joindate, "
					+ "CASE grade WHEN 'A' THEN 'VIP' WHEN 'B' THEN '일반' WHEN 'C' THEN '직원' END AS grade, city "
					+ "FROM member_tbl_02";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				memberVO vo = new memberVO();
				vo.setCustno(rs.getInt(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5));
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));
				list.add(vo);
			}
			
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			CloseDBResource(conn, pstmt, rs);
		}
		return list;
	}

	//회원 정보 조회 조건부 - 사용못함
	public ArrayList<memberVO> readMember() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<memberVO> list = new ArrayList<memberVO>();
		String sql = null;
		
		try {
			
			conn = getConnection();
			sql = "SELECT custno, custname, phone, address, TO_CHAR(joindate, 'yyyy-mm-dd') AS joindate, "
					+ "CASE grade WHEN 'A' THEN 'VIP' WHEN 'B' THEN '일반' WHEN 'C' THEN '직원' END AS grade, city "
					+ "FROM member_tbl_02 WHERE custno = ?";	
			pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				memberVO vo = new memberVO();
				
				vo.setCustno(rs.getInt(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5));
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));
				pstmt.setInt(8, vo.getCustno());
				list.add(vo);
			}
			
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			CloseDBResource(conn, pstmt, rs);
		}
		return list;
	}
	
	
	//회원 번호 불러오기
	public ArrayList<memberVO> callnumber() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<memberVO> list = new ArrayList<memberVO>();
		String sql = null;
		
		try {
			conn = getConnection();
			sql = "SELECT (MAX(custno))+1 AS custno FROM member_tbl_02";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				memberVO vo = new memberVO();
				vo.setCustno(rs.getInt("custno"));
				list.add(vo);
				
			}
			return list;
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			closeDBResource(conn, pstmt);
		}
		return list;
	}
	
	//회원 등록
	public int addmember(int custno, String name, String phone, String address, String joindate, String grade, String city) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int rs = 0;
		
		try {
			
			conn = getConnection();
			
			sql = "INSERT INTO member_tbl_02 VALUES (?, ?, ?, ?, TO_DATE(?, 'yyyy-mm-dd'), ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, custno);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			pstmt.setString(4, address);
			pstmt.setString(5, joindate);
			pstmt.setString(6, grade);
			pstmt.setString(7, city);
			
			rs = pstmt.executeUpdate();
			
			return rs;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			closeDBResource(conn, pstmt);
		}
		
		return rs;		
	}
	
	
	//매출 조회
	public ArrayList<memberVO> readsal() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<memberVO> list = new ArrayList<memberVO>();
		String sql = null;
		
		try {
			conn = getConnection();
			sql = " SELECT me.custno, me.custname, CASE me.grade WHEN 'A' THEN 'VIP' WHEN 'B' THEN '일반' WHEN 'C' THEN '직원' END AS grade, "
					+ " sum(mo.price) AS price FROM MONEY_TBL_02 mo INNER JOIN MEMBER_TBL_02 me ON mo.CUSTNO = me.CUSTNO "
					+ " GROUP BY me.CUSTNO, me.custname, me.grade ORDER BY PRICE DESC";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memberVO vo = new memberVO();
				vo.setCustno(rs.getInt(1));
				vo.setCustname(rs.getString(2));
				vo.setGrade(rs.getString(3));
				vo.setPrice(rs.getInt(4));
				list.add(vo);
			}
			
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			CloseDBResource(conn, pstmt, rs);
		}
		return list;
	}
	
	//회원 번호 불러오기
	public void member(memberVO vo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;		
		
		try {
			conn = getConnection();
			sql = " SELECT custno FROM MEMBER_TBL_02 ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.executeQuery();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			CloseDBResource(conn, pstmt, rs);
		}
	}
	
	//회원정보 수정
	public void updatemember(memberVO vo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = getConnection();
			sql = " UPDATE MEMBER_TBL_02 SET custname = ?, phone = ?, address = ?, "
					+ " joindate = ?, grade = ?, city = ? WHERE custno = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getCustname());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getJoindate());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());
			pstmt.setInt(7, vo.getCustno());
			
			pstmt.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			closeDBResource(conn, pstmt);
		}
	}
}
