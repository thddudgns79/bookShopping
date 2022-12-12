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

import org.json.JSONObject;

import dto.UserDto;
import service.MemberService;

@WebServlet(name = "controller.user.SearchUserIdController", urlPatterns =  "/controller/user/SearchUserIdController")
public class SearchUserIdController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 request.getRequestDispatcher("/WEB-INF/views/user/checkUserId.jsp").forward(request, response);
			
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 //QnaService 객체 얻기
		 ServletContext application = request.getServletContext();
		 MemberService memberService = (MemberService) application.getAttribute("MemberService");
		
		 UserDto userDto = new UserDto();
		 userDto.setUser_id(request.getParameter("user_id"));
		 System.out.println(userDto.getUser_id());
		 
		 boolean icheck =  memberService.selectJuserId(userDto);
		 System.out.println(icheck);
		

		 request.setAttribute("icheck", icheck);
		
		 request.getRequestDispatcher("/WEB-INF/views/user/checkUserId.jsp").forward(request, response);
	}

}
