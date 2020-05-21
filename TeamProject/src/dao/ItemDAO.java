package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.ItemBean;

public class ItemDAO {	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	private static ItemDAO instance;
	
	private ItemDAO() {}
	public static ItemDAO getInstance() {
		if(instance == null) {
			instance = new ItemDAO();
		}
		
		return instance;
	}

	// Service 클래스로부터 Connection 객체를 전달받는 메서드 setConnection() 정의
	public void setConnection(Connection con) {
		this.con = con;
	}

	// 게시물 등록
	public int insertArticle(ItemBean itemBean) {
		int insertCount = 1;
		
		try {
			sql = "INSERT INTO item VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 0); // it_no
			pstmt.setString(2, itemBean.getName());
			pstmt.setString(3, "test"); // itemBean.getMemberID() - 테스트용으로 test 계정 삽입해둠
			pstmt.setTimestamp(4, itemBean.getWriteTime());
			pstmt.setString(5, itemBean.getEndTime());
			pstmt.setInt(6, itemBean.getStartPrice());
			pstmt.setInt(7, itemBean.getMaxPrice());
			pstmt.setInt(8, 0); // it_now_price
			pstmt.setInt(9, itemBean.getSuccessfulPrice());
			pstmt.setString(10, itemBean.getContent());
			pstmt.setInt(11, itemBean.getDeliveryPrice());
			pstmt.setString(12, itemBean.getCategory());
			pstmt.setString(13, itemBean.getThumbnail());
			pstmt.setInt(14, 0); // it_is_delete
			
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return insertCount;
	}
	
}
