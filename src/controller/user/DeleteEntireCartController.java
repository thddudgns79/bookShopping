package controller.user;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.CartDto;
import dto.UserDto;
import service.CartsService;

@WebServlet(name = "controller.user.DeleteEntireCartController", urlPatterns =  "/controller/user/DeleteEntireCartController")
public class DeleteEntireCartController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//session에서 유저 정보 담기
		HttpSession session = request.getSession();
		UserDto user = (UserDto)session.getAttribute("userDto");
		
		//파라미터값 받고 CartDto에 저장
		CartDto cartDto = new CartDto();
		cartDto.setUser_id(user.getUser_id());
		
		//서비스 객체
		ServletContext application = request.getServletContext();
		CartsService cartsService = (CartsService)application.getAttribute("CartsService");
		int result = cartsService.cartsBoardAllDelete(cartDto);
		
		
		response.sendRedirect("/shopping/controller/user/cartDetailController?type=entireDelete");
		
	}
	
}
