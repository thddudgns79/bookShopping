package controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dto.BookDto;
import dto.CategoryDto;
import dto.SubCategoryDto;
import service.AdminBookService;
import service.SearchService;

@WebServlet(name = "controller.admin.bookCreateController", urlPatterns = "/controller/admin/bookCreateController")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20)
public class bookCreateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		SearchService searchService = (SearchService) application.getAttribute("SearchService");
		// 카테고리 목록 조회
		ArrayList<CategoryDto> categoryList = searchService.category();
		request.setAttribute("categoryList", categoryList);

		request.getRequestDispatcher("/WEB-INF/views/admin/bookCreate.jsp").forward(request, response);
	}

	// 데이터 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		AdminBookService adminBookService = (AdminBookService) application.getAttribute("AdminBookService");

		// 문자 파트
		BookDto bookDto = new BookDto();
		bookDto.setBook_name(request.getParameter("bookName"));
		bookDto.setBook_publisher(request.getParameter("bookPublisher"));
		bookDto.setBook_detail(request.getParameter("bookDetail"));
		bookDto.setBook_price(Integer.parseInt(request.getParameter("bookPrice")));
		bookDto.setBook_page(Integer.parseInt(request.getParameter("bookPage")));
		bookDto.setBook_lang(request.getParameter("bookLang"));
		bookDto.setBook_date(request.getParameter("bookPublishedDate"));
		bookDto.setSub_no(Integer.parseInt(request.getParameter("subNo")));

		// 파일 파트
		Part filePart = request.getPart("battach");
		System.out.println(filePart);
		if (!filePart.getSubmittedFileName().equals("")) {
			bookDto.setFileName(filePart.getSubmittedFileName());
			bookDto.setSavedName(new Date().getTime() + "-" + bookDto.getFileName());
			bookDto.setFileType(filePart.getContentType());
			System.out.println(bookDto.getFileName());
			System.out.println(bookDto.getSavedName());
			System.out.println(bookDto.getFileType());
			String filePath = "C:/OTI/WebProjects/workspace/bookShopping/WebContent/resources/images/imageOfBook/" + bookDto.getSavedName();
			filePart.write(filePath);
		}
		
		int bookCreateBookNo = adminBookService.adminBookCreate(bookDto);
		HttpSession session = request.getSession();
		session.setAttribute("bookCreateBookNo", bookCreateBookNo);
		String url = "/shopping/controller/admin/authorListController";
		response.sendRedirect(url);
	}

}
