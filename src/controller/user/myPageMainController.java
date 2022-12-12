package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.UserDto;
import service.MyReviewUserService;

@WebServlet(name = "controller.user.myPageMainController", urlPatterns =  "/controller/user/myPageMainController")
public class myPageMainController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto)session.getAttribute("userDto");
		String userId = userDto.getUser_id();
		
		MyReviewUserService myreviewUserService = (MyReviewUserService)request.getServletContext().getAttribute("MyReviewUserService");
		UserDto user = myreviewUserService.getUserInfo(userId);
		request.setAttribute("user", userDto);
		request.getRequestDispatcher("/WEB-INF/views/user/myPageMain.jsp").forward(request, response);	
	}
}
