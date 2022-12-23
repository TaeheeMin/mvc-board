package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.service.BoardService;

// C => M 호출 ====> 클라이언트가 다른 C 호출 redirect 
// view(jsp) 파일은 보안 폴더 안으로 이동해서 틀라이언트가 직접 호출 못하도록
// list select : C > M > V 
// form 페이지 호출 : C > V
// action insert/update/delete : C > M ===> redirect 

@WebServlet("/mvc/AddBoardActionController")
public class AddBoardActionController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 유효성 검사 
		if(request.getParameter("title") == null || request.getParameter("title").equals("") || request.getParameter("content") == null || request.getParameter("content").equals("") ) {
			response.sendRedirect(request.getContextPath() + "/mvc/AddBoardFormController");
			return;
		}
		
		// 값 받아오기
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// db연결
		int result = 0;
		BoardService boardService = new BoardService();
		result = boardService.addBoard(content, title);
		
		// 결과
		if(result == 1) {
			// 리스트로 이동
			System.out.println("입력성공");
			response.sendRedirect(request.getContextPath()+"/mvc/BoardListController"); 
		} else {
			// 폼이동
			System.out.println("입력실패");
			response.sendRedirect(request.getContextPath()+"/mvc/AddBoardFormController");
		}
	}

}
