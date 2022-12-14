package controller.book;

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

@WebServlet(name = "controller.book.addCartController", urlPatterns =  "/controller/book/addCartController")
public class addCartController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		CartsService cartsService = (CartsService) application.getAttribute("CartsService");
		
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		int bookQty = Integer.parseInt(request.getParameter("bookQty"));
		HttpSession session = request.getSession();
		UserDto loginUser = (UserDto)session.getAttribute("userDto");

		if(loginUser != null) {
			CartDto cartdto = new CartDto();
			cartdto.setUser_id(loginUser.getUser_id());
			cartdto.setBook_no(bookNo);
			cartdto.setCart_qty(bookQty);
			int result = cartsService.cartsBoardPlus(cartdto);
			if(result > 0) {
				System.out.println("장바구니에 담겼습니다.");
				String url = "/shopping/controller/book/bookInfoController?bookNo=" + bookNo + "&cartAdd=success";
				response.sendRedirect(url);
			}
			else {
				System.out.println("이미 장바구니에 해당 상품이 존재합니다");
				String url = "/shopping/controller/book/bookInfoController?bookNo=" + bookNo + "&cartAdd=fail";
				response.sendRedirect(url);
			}
		}
		else {
			request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
		}
		
	}
	


}
