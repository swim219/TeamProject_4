package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ItemListAction;
import action.ItemWriteProAction;
import vo.ActionForward;

@WebServlet("*.it")
public class ItemFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/item/write.it")) {
			forward = new ActionForward();
			forward.setPath("/item/write.jsp");
		}
		else if(command.equals("/item/writePro.it")) {
			action = new ItemWriteProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/item/list.it")) {
			action = new ItemListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
//		else if(command.equals("/item/view.it")) {
//			action = new ItemViewAction();
//			
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		
		if(forward != null) {
			if(forward.isRedirect()) { // Redirect 방식 (주소 변경 O, request 객체 공유 X)
				response.sendRedirect(forward.getPath());
			} else { // Dispatcher 방식 (주소 변경 X, request 객체 공유 O)
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				
				dispatcher.forward(request, response);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
