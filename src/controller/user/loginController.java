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

@WebServlet(name = "controller.user.loginController", urlPatterns =  "/controller/user/loginController")
public class loginController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//HttpRequest통해서 userDTO에 저장하기
		UserDto selLogin = new UserDto();
		selLogin.setUser_id(request.getParameter("userId"));
		selLogin.setUser_password(request.getParameter("userPwd"));
		
		//서비스 객체 불러오고, userDto로 리턴 받기
		MemberService mservice = (MemberService)request.getServletContext().getAttribute("MemberService");
		UserDto juser = mservice.selectLogin(selLogin);
		
		//아이디와 비밀번호 일치 시, 세션에 담고 
		//불일치 시, login.jsp 계속 보내기 (나중에 비밀번호 틀렸다고 알리면 좋겠따)
		
		if(juser != null) {
			
			//세션 객체 생성
			HttpSession session = request.getSession();
			
			//세션에 데이터(객체)를 저장
			session.setAttribute("userDto", juser);
			
			response.sendRedirect("/shopping/");
			
		} else {
			request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
		}
		
		
	}

}
