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

import context.ConnectionProvider;
import dto.AuthorBookDto;
import dto.AuthorDto;
import dto.BookDto;
import dto.BookHashDto;
import dto.CategoryDto;
import dto.PagerDto;
import dto.SubCategoryDto;
import service.AdminAuthorService;
import service.AdminBookService;
import service.SearchService;

@WebServlet(name = "controller.admin.getSubCategoryController", urlPatterns = "/controller/admin/getSubCategoryController")
public class getSubCategoryController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		SearchService searchService = (SearchService) application.getAttribute("SearchService");
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
		CategoryDto categoryDto = new CategoryDto();
		categoryDto.setCategory_no(categoryNo);
		// 카테고리 목록 조회
		ArrayList<SubCategoryDto> subCategoryList = searchService.subCategory(categoryDto);
		request.setAttribute("subCategoryList", subCategoryList);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/subCategory.jsp").forward(request, response);

	}

}
