package controller.user;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.DibDto;
import dto.UserDto;
import service.MyExtraService;

@WebServlet(name = "controller.user.deleteDibController", urlPatterns =  "/controller/user/deleteDibController")
public class deleteDibController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		MyExtraService myextraService = (MyExtraService) application.getAttribute("MyExtraService");
		
		int bookNo = Integer.parseInt(request.getParameter("book_no"));
		HttpSession session = request.getSession();
		UserDto user = (UserDto)session.getAttribute("userDto");
		DibDto deldib = new DibDto();
		deldib.setUser_id(user.getUser_id());
		deldib.setBook_no(bookNo);
		
		int delDib = myextraService.deleteDib(deldib);
		String url = "/shopping/controller/user/myLikeListController?type=" + 1;
		response.sendRedirect(url);
	}
}