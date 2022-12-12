package controller.book;

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
import dto.PagerDto;
import dto.ReviewDto;
import dto.UserDto;
import service.SearchService;

@WebServlet(name = "controller.book.bookInfoController", urlPatterns = "/controller/book/bookInfoController")
public class bookInfoController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDto bookDto = new BookDto();
		bookDto.setBook_no(Integer.parseInt(request.getParameter("bookNo")));
		String strReviewPageNo = request.getParameter("reviewPageNo");
		if(strReviewPageNo == null) {
			strReviewPageNo = "1";
		}
		int reviewPageNo = Integer.parseInt(strReviewPageNo);
		
		ServletContext application = request.getServletContext();
		SearchService searchService = (SearchService) application.getAttribute("SearchService");
		
		BookDto bookInfo = searchService.book(bookDto);
		ArrayList<AuthorDto> authorList = searchService.authorList(bookDto);
		int reviewCount = searchService.reviewListCount(bookDto);
		PagerDto pager = new PagerDto(10, 5, reviewCount, reviewPageNo);
		ArrayList<ReviewDto> reviewList = searchService.reviewList(bookDto, pager);
		request.setAttribute("pager", pager);
		request.setAttribute("bookInfo", bookInfo);
		request.setAttribute("authorList", authorList);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("authorSize", authorList.size());
		if(authorList.size() > 0) {
			request.setAttribute("firstAuthor", authorList.get(0));
		}
		request.setAttribute("reviewSize", reviewList.size());
		

		request.getRequestDispatcher("/WEB-INF/views/book/bookInfo.jsp").forward(request, response);
	}

}
