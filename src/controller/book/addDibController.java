package controller.book;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.CartDto;
import dto.DibDto;
import dto.UserDto;
import service.SearchService;

@WebServlet(name = "controller.book.addDibController", urlPatterns = "/controller/book/addDibController")
public class addDibController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		SearchService searchService = (SearchService) application.getAttribute("SearchService");

		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		HttpSession session = request.getSession();
		UserDto loginUser = (UserDto) session.getAttribute("userDto");

		if (loginUser != null) {
			DibDto dibDto = new DibDto();
			dibDto.setBook_no(bookNo);
			dibDto.setUser_id(loginUser.getUser_id());
			int result = searchService.dibs(dibDto);
			if (result > 0) {
				System.out.println("찜 목록에 추가되었습니다.");
				String url = "/shopping/controller/book/bookInfoController?bookNo=" + bookNo + "&dibAdd=success";
				response.sendRedirect(url);
			} else {
				System.out.println("이미 해당상품이 찜 목록에 존재합니다.");
				String url = "/shopping/controller/book/bookInfoController?bookNo=" + bookNo+ "&dibAdd=fail";
				response.sendRedirect(url);
			}
		} else {
			request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
		}

	}

}
