package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.AuthorDto;
import dto.BookDto;
import dto.BookHashDto;
import dto.PagerDto;
import service.AdminAuthorService;
import service.AdminBookService;

@WebServlet(name = "controller.admin.authorListController", urlPatterns = "/controller/admin/authorListController")
public class authorListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		AdminAuthorService adminAuthorService = (AdminAuthorService) application.getAttribute("AdminAuthorService");
		AdminBookService adminBookService = (AdminBookService) application.getAttribute("AdminBookService");
		String searchWord = request.getParameter("searchWord");
		if (searchWord == null) {
			searchWord = "";
		}
		String strPageNo = request.getParameter("pageNo");
		if (strPageNo == null) {
			strPageNo = "1";
		}
		HttpSession session = request.getSession();
		int bookNo = (Integer) session.getAttribute("bookCreateBookNo");
		int pageNo = Integer.parseInt(strPageNo);
		AuthorDto authorDto = new AuthorDto();
		authorDto.setAuthor_name(searchWord);
		int totalRows = adminAuthorService.adminAuthorListByNameCount(authorDto);
		PagerDto pager = new PagerDto(10, 5, totalRows, pageNo);
		ArrayList<AuthorDto> authorList = adminAuthorService.adminAuthorListByName(authorDto, pager);
		BookDto bookDto = new BookDto();
		bookDto.setBook_no(bookNo);
		ArrayList<AuthorDto> bookAuthorList = adminBookService.adminBookAuthorInfo(bookDto);
		ArrayList<BookHashDto> bookHashList = adminBookService.adminBookHashInfo(bookDto);
		request.setAttribute("bookAuthorList", bookAuthorList);
		request.setAttribute("bookHashList", bookHashList);
		request.setAttribute("bookNo", bookNo);
		request.setAttribute("searchWord", searchWord);
		request.setAttribute("authorList", authorList);
		request.setAttribute("pager", pager);
		request.getRequestDispatcher("/WEB-INF/views/admin/authorHashAdd.jsp").forward(request, response);

	}

}
