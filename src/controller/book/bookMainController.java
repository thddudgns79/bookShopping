package controller.book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BookDto;
import dto.CategoryDto;
import dto.PagerDto;
import dto.SearchDto;
import dto.SubCategoryDto;
import dto.UserDto;
import service.MainPageService;
import service.SearchService;

@WebServlet(name = "controller.book.bookMainController", urlPatterns = "/controller/book/bookMainController")
public class bookMainController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// reqType 1 = 카테고리 검색 , 2 = 통합검색
		// http://localhost:8080/shopping/controller/book/bookMainController?reqType=1&bigcategory="인문"&subcategory="철학"&pageNo=1
		// http://localhost:8080/shopping/controller/book/bookMainController?reqType=2&searchVoca
		// = "코난"&pageNo=3
		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext();
		SearchService searchService = (SearchService) application.getAttribute("SearchService");
		MainPageService mainPageService = (MainPageService) application.getAttribute("MainPageService");

		int searchType = Integer.parseInt(request.getParameter("searchType"));
		request.setAttribute("searchType", searchType);
		String strPageNo = request.getParameter("pageNo");
		if (strPageNo == null) {
			strPageNo = "1";
		}
		int pageNo = Integer.parseInt(strPageNo);

		// 공통적으로 끌어와야하는 데이터

		// 1) 카테고리, 서브 카테고리 목록 조회
		Map<CategoryDto, ArrayList<SubCategoryDto>> categoryMap = new HashMap<>();
		ArrayList<CategoryDto> categoryList = searchService.category();
		for (CategoryDto categoryDto : categoryList) {
			ArrayList<SubCategoryDto> subCategoryList = searchService.subCategory(categoryDto);
			categoryMap.put(categoryDto, subCategoryList);
		}
		request.setAttribute("categoryMap", categoryMap);

		// 2) 금주 bestSeller 목록 조회
		ArrayList<BookDto> weekBestSeller = mainPageService.mainPageBestSellerList();
		request.setAttribute("weekBestSeller", weekBestSeller);

		// 3) 로그인 유저 맞춤 bestSeller 목록 조회
		UserDto loginUser = (UserDto) session.getAttribute("userDto");
		if (loginUser != null) {
			ArrayList<BookDto> userBestSeller = mainPageService.mainPageGenderAgeList(loginUser);
			request.setAttribute("userBestSeller", userBestSeller);
		}

		// 4) 신간 bestSeller 목록 조회
		ArrayList<BookDto> newBestSeller = mainPageService.mainPageRecentBookList();
		request.setAttribute("newBestSeller", newBestSeller);
		
		// 5) 검색 종류에 따른 상품 목록 조회
		// 카테고리 검색
		if (searchType == 1) {
			int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
			int subCategoryNo = Integer.parseInt(request.getParameter("subCategoryNo"));
			request.setAttribute("categoryNo", categoryNo);
			request.setAttribute("subCategoryNo", subCategoryNo);
			SubCategoryDto subCategoryDto = new SubCategoryDto();
			subCategoryDto.setSub_no(subCategoryNo);
			int totalRows = searchService.categoryBoardCount(subCategoryDto);
			PagerDto pager = new PagerDto(5, 5, totalRows, pageNo);
			ArrayList<SearchDto> bookList = searchService.categoryBoard(subCategoryDto, pager);
			ArrayList<String> bookDetailList = new ArrayList<>();

			for (SearchDto searchDto : bookList) {
				String detail = searchDto.getBook_detail();
				String limitedDetail = "";
				int index = 0;
				for (int i = 0; i < detail.length(); i++) {
					if (index == 100) {
						break;
					}
					limitedDetail = limitedDetail + detail.charAt(i);
					index++;

				}
				limitedDetail += "...";
				bookDetailList.add(limitedDetail);
			}

			request.setAttribute("bookList", bookList);
			request.setAttribute("pager", pager);
			request.setAttribute("bookDetailList", bookDetailList);
		}
		// 통합 검색
		else if (searchType == 2) {
			String searchWord = request.getParameter("searchWord");
			request.setAttribute("searchWord", searchWord);
			SearchDto searchDto = new SearchDto();
			searchDto.setSearch(searchWord);
			int totalRows = searchService.integrationCount(searchDto);
			PagerDto pager = new PagerDto(5, 5, totalRows, pageNo);
			ArrayList<SearchDto> bookList = searchService.integration(searchDto, pager);
			ArrayList<String> bookDetailList = new ArrayList<>();

			for (SearchDto book : bookList) {
				String detail = book.getBook_detail();
				String limitedDetail = "";
				int index = 0;
				for (int i = 0; i < detail.length(); i++) {
					if (index == 100) {
						break;
					}
					limitedDetail = limitedDetail + detail.charAt(i);
					index++;

				}
				limitedDetail += "...";
				bookDetailList.add(limitedDetail);
			}
			request.setAttribute("bookList", bookList);
			request.setAttribute("pager", pager);
			request.setAttribute("bookDetailList", bookDetailList);
		}

		request.getRequestDispatcher("/WEB-INF/views/book/bookMain.jsp").forward(request, response);
	}

}
