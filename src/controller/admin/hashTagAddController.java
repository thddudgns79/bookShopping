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

@WebServlet(name = "controller.admin.hashTagAddController", urlPatterns = "/controller/admin/hashTagAddController")
public class hashTagAddController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		AdminBookService bookService = (AdminBookService) application.getAttribute("AdminBookService");
		
		HttpSession session = request.getSession();
		int bookNo = (Integer)session.getAttribute("bookCreateBookNo");
		
		String hashString = request.getParameter("hashString");
		BookHashDto bookHashDto = new BookHashDto();
		bookHashDto.setBook_no(bookNo);
		bookHashDto.setHash_id(hashString);
		int result = bookService.adminHashTagAdd(bookHashDto);
		if(result > 0) {
			System.out.println("해시태그가 책에 추가되었습니다.");
		} else {
			System.out.println("이미 책에 추가된 해시태그입니다.");
		}
		
		String url = "/shopping/controller/admin/authorListController";
		response.sendRedirect(url);		
		
		
	}

}
