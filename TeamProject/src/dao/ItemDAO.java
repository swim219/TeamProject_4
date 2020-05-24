package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ItemBean;
import static db.JdbcUtil.*;

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

	// 상품 등록
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
		} finally {
			close(pstmt);
		}
		
		return insertCount;
	}
	
	// 라이브 리스트 상품 전체 갯수
	public int selectListCount() {
		int listCount = 0;
		
		try {
			String sql = "SELECT COUNT(it_no) FROM item";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 라이브 리스트 출력
	public ArrayList<ItemBean> selectArticleList(int page, int limit) {
		int startRow = (page - 1) * limit; // 가져올 게시물에 대한 시작 행 번호 계산
		
		ArrayList<ItemBean> articleList = new ArrayList<ItemBean>();
		
		try {
			String sql = "SELECT * FROM item ORDER BY it_no DESC LIMIT ?, ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemBean article = new ItemBean();
				article.setNo(rs.getInt("it_no"));
				article.setName(rs.getString("it_name"));
				article.setMemberID(rs.getString("mb_id"));
				article.setContent(rs.getString("it_content"));
				article.setThumbnail(rs.getString("it_thumbnail"));
				article.setWriteTime(rs.getTimestamp("it_write_datetime"));
				article.setEndTime(rs.getString("it_end_datetime"));
				article.setMaxPrice(rs.getInt("it_max_price"));
				article.setStartPrice(rs.getInt("it_start_price"));
				article.setDeliveryPrice(rs.getInt("it_delivery_price"));
				article.setCategory(rs.getString("it_category"));
				article.setIsDelete(rs.getInt("it_is_delete"));
				
				articleList.add(article);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
	
}
