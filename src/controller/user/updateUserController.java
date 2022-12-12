package controller.user;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.UserDto;
import service.MyReviewUserService;

@WebServlet(name = "controller.user.updateUserController", urlPatterns = "/controller/user/updateUserController")
public class updateUserController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/user/updateUser.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto)session.getAttribute("userDto");
		
		String userId = userDto.getUser_id();
		
		UserDto updateUser = new UserDto();
		updateUser.setUser_id(userId);
		updateUser.setUser_name(request.getParameter("uname"));
		updateUser.setUser_password(request.getParameter("password"));
		updateUser.setUser_tel(request.getParameter("phone"));
		updateUser.setUser_address(request.getParameter("uadress"));
		updateUser.setUser_email(request.getParameter("email"));


		ServletContext application = request.getServletContext();
		MyReviewUserService myReviewUserService = (MyReviewUserService) application.getAttribute("MyReviewUserService");
		myReviewUserService.updateUser(updateUser);
		request.setAttribute("user", userDto);
		request.setAttribute("user1", updateUser);
		request.getRequestDispatcher("/WEB-INF/views/user/myPageUpdate.jsp").forward(request, response);
	}
}
