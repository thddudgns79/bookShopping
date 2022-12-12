package controller.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.CartBoardDto;
import dto.CartDto;
import dto.UserDto;
import service.CartsService;

@WebServlet(name = "controller.user.cartDetailController", urlPatterns="/controller/user/cartDetailController")
public class cartDetailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//HttpSession에 담긴 userDto 받기
		HttpSession session = request.getSession();
		
		UserDto user = (UserDto)session.getAttribute("userDto");
		
		//로그인 상태 확인후, cart 조회하기
		if(user != null) {
			CartsService cService = (CartsService)request.getServletContext().getAttribute("CartsService");
			CartDto cartDto = new CartDto();
			cartDto.setUser_id(user.getUser_id());
			ArrayList<CartBoardDto> cartList = cService.cartsBoard(cartDto);
			
			//총 가격 구하기
			int totalCartPrice = 0;
			for(int i = 0; i<cartList.size(); i++) {
				totalCartPrice += cartList.get(i).getB_c();
			}
			
			//request에 저장	
			request.setAttribute("cartList", cartList);
			request.setAttribute("cartListSize", cartList.size());
			request.setAttribute("totalCartPrice", totalCartPrice);
			
			String type = request.getParameter("type");
			if(type != null) {
				switch(type){
					case "update" :
						for(CartBoardDto cartBoardDto: cartList) {
							cartBoardDto.setChecked(false);
							for( int bookNo : (int[])session.getAttribute("checkedBookNo")) {
								if(bookNo == cartBoardDto.getBook_no()) {
									cartBoardDto.setChecked(true);
								}
							}
						}
						request.getRequestDispatcher("/WEB-INF/views/user/cartUpdate.jsp").forward(request, response);
 						
						break;
					case "entireDelete" :
						request.getRequestDispatcher("/WEB-INF/views/user/allCartDelete.jsp").forward(request, response);
						break;
					case "quantity" :
						for(CartBoardDto cartBoardDto: cartList) {
							cartBoardDto.setChecked(false);
							for(int checkedBookNo : (int[])session.getAttribute("checkedBookNo")) {
								if(cartBoardDto.getBook_no() == checkedBookNo) {
									cartBoardDto.setChecked(true);
								}
							}
						}
						request.getRequestDispatcher("/WEB-INF/views/user/cartUpdate.jsp").forward(request, response);
						break;
				}
			} else {
				request.getRequestDispatcher("/WEB-INF/views/user/cartDetail.jsp").forward(request, response);
			}
			
		} else {
			//user 로그인 안되어 있음
			response.sendRedirect("/shopping/");
		}
		
	}

}
