package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.UserDto;
import service.MemberService;

@WebServlet(name = "controller.user.logoutController", urlPatterns =  "/controller/user/logoutController")
public class logoutController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//세션에 저장된 데이터(객체)를 제거
		HttpSession session = request.getSession();
		session.removeAttribute("userDto");
		
		response.sendRedirect("/shopping/");
		
	}
	
}
