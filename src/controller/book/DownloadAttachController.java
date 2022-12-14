package controller.book;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AuthorDto;
import dto.BookDto;
import service.AdminAuthorService;
import service.SearchService;

@WebServlet(name = "controller.book.DownloadAttachController", urlPatterns = "/controller/book/DownloadAttachController")
public class DownloadAttachController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		SearchService searchService = (SearchService) application.getAttribute("SearchService");
		AdminAuthorService adminAuthorService = (AdminAuthorService) application.getAttribute("AdminAuthorService");
		int reqType = Integer.parseInt(request.getParameter("reqType"));
		
		//책 이미지 요청
		if(reqType == 1) {
			int bookNo = Integer.parseInt(request.getParameter("bookNo"));
			BookDto bookDto = new BookDto();
			bookDto.setBook_no(bookNo);
			BookDto book = searchService.book(bookDto);
			
			String fileName = book.getFileName();
			String filePath = "C:/OTI/WebProjects/workspace/bookShopping/WebContent/resources/images/imageOfBook/" + book.getSavedName();
			String contentType = book.getFileType();
			
			//HTTP 응답에 Content-Type 헤더를 추가
			response.setContentType(contentType);
			//response.setHeader("Content-Type, contentType;}
			
			//브라우저의 종류 얻기
			String userAgent = request.getHeader("User-Agent");
			if(userAgent.contains("Trident") || userAgent.contains("MSIE")) {
				//IE일 경우
				fileName = URLEncoder.encode(fileName, "UTF-8");
			} else {
				//Chrome, Edge, FireFox, Safari
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			}

			//HTTP 응답에 Content-Disposition 헤더를 추가
			response.setHeader("Content-Disposition", "attachment; filename = \"" + fileName + "\"");
			
			
			ServletOutputStream sos = response.getOutputStream();
			Path path = Paths.get(filePath);
			Files.copy(path, sos);
			sos.flush();
			sos.close();
		}
		//저자 이미지 요청
		else {
			int authorNo = Integer.parseInt(request.getParameter("authorNo"));
			AuthorDto authorDto = new AuthorDto();
			authorDto.setAuthor_no(authorNo);
			AuthorDto author = adminAuthorService.adminAuthorInfo(authorDto);
			
			String fileName = author.getFileName();
			String filePath = "C:/OTI/WebProjects/workspace/bookShopping/WebContent/resources/images/imageOfAuthor/" + author.getSavedName();
			String contentType = author.getFileType();
			System.out.println(fileName);
			//HTTP 응답에 Content-Type 헤더를 추가
			response.setContentType(contentType);
			//response.setHeader("Content-Type, contentType;}
			
			//브라우저의 종류 얻기
			String userAgent = request.getHeader("User-Agent");
			if(userAgent.contains("Trident") || userAgent.contains("MSIE")) {
				//IE일 경우
				fileName = URLEncoder.encode(fileName, "UTF-8");
			} else {
				//Chrome, Edge, FireFox, Safari
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			}

			//HTTP 응답에 Content-Disposition 헤더를 추가
			response.setHeader("Content-Disposition", "attachment; filename = \"" + fileName + "\"");
			
			
			ServletOutputStream sos = response.getOutputStream();
			Path path = Paths.get(filePath);
			Files.copy(path, sos);
			sos.flush();
			sos.close();
		}
		
	}
}
