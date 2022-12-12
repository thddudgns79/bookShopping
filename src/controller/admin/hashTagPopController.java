package controller.admin;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BookHashDto;
import service.AdminBookService;

@WebServlet(name = "controller.admin.hashTagPopController", urlPatterns = "/controller/admin/hashTagPopController")
public class hashTagPopController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		AdminBookService bookService = (AdminBookService) application.getAttribute("AdminBookService");
		HttpSession session = request.getSession();
		int bookNo = (Integer)session.getAttribute("bookCreateBookNo");
		
		String hashString = request.getParameter("hashString");
		BookHashDto bookHashDto = new BookHashDto();
		bookHashDto.setBook_no(bookNo);
		bookHashDto.setHash_id(hashString);
		bookService.adminHashTagPop(bookHashDto);
		System.out.println("해시태그가 책에서 삭제되었습니다.");
		
		String url = "/shopping/controller/admin/authorListController";
		response.sendRedirect(url);		
		
		
	}

}
