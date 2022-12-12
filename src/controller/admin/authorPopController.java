package controller.admin;

import java.util.*;

import java.io.IOException;
import java.security.Provider.Service;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import context.ConnectionProvider;
import dto.AuthorBookDto;
import dto.AuthorDto;
import dto.BookDto;
import dto.BookHashDto;
import dto.PagerDto;
import service.AdminAuthorService;
import service.AdminBookService;

@WebServlet(name = "controller.admin.authorPopController", urlPatterns = "/controller/admin/authorPopController")
public class authorPopController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		AdminBookService bookService = (AdminBookService) application.getAttribute("AdminBookService");
		
		HttpSession session = request.getSession();
		int bookNo = (Integer)session.getAttribute("bookCreateBookNo");
		int authorNo = Integer.parseInt(request.getParameter("authorNo"));

		AuthorBookDto authorBookDto = new AuthorBookDto();
		authorBookDto.setBook_no(bookNo);
		authorBookDto.setAuthor_no(authorNo);
		
		bookService.adminBookAuthorPop(authorBookDto);
		System.out.println("저자가 책에서 삭제되었습니다.");
		
		String url = "/shopping/controller/admin/authorListController";
		response.sendRedirect(url);
	}

}
