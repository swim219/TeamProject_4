package svc;

import java.sql.Connection;

import dao.ItemDAO;
import vo.ItemBean;

import static db.JdbcUtil.*;

public class ItemWriteProService {

	public boolean registArticle(ItemBean itemBean) { 
		boolean isSuccess = false;
		
		Connection con = getConnection();

		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		int insertCount = itemDAO.insertArticle(itemBean);
		
		if(insertCount > 0) {
			commit(con);
			isSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isSuccess;
	}
	
}
