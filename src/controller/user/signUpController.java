package controller.user;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.UserDto;
import service.MemberService;

@WebServlet(name = "controller.user.signUpController", urlPatterns =  "/controller/user/signUpController")
public class signUpController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 //QnaService 객체 얻기
		 ServletContext application = request.getServletContext();
		 MemberService memberService = (MemberService) application.getAttribute("MemberService");
		 
		 UserDto userDto = new UserDto();
		 userDto.setUser_id(request.getParameter("user_id"));
		 
		 memberService.selectJuserId(userDto);
		 
		 request.getRequestDispatcher("/WEB-INF/views/user/signUp.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		 //QnaService 객체 얻기
		 ServletContext application = request.getServletContext();
		 MemberService memberService = (MemberService) application.getAttribute("MemberService");
		
		 UserDto userDto = new UserDto();
		 userDto.setUser_id(request.getParameter("user_id"));
		 userDto.setUser_password(request.getParameter("password"));
		 userDto.setUser_name(request.getParameter("user_name"));
		 userDto.setUser_email(request.getParameter("email"));
		 userDto.setUser_birth(request.getParameter("birthday"));
		 userDto.setUser_gender(request.getParameter("sex").charAt(0));
		 userDto.setUser_tel(request.getParameter("phone"));
		 userDto.setUser_address(request.getParameter("address"));
		 
		 memberService.insertJoinUser(userDto);
		
		 request.getRequestDispatcher("/WEB-INF/views/user/signUp.jsp").forward(request, response);
	}

}
