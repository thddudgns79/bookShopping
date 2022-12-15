package controller.book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.OrderDto;
import dto.OrderdetailDto;
import dto.UserDto;
import service.BuyService;

@WebServlet(name = "controller.book.bookOrderController", urlPatterns =  "/controller/book/bookOrderController")
public class bookOrderController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<OrderdetailDto> orderDetails = new ArrayList<>();
		// ~ /shopping/~~~?bookNo=1&odQty=3&bookNo=3&odQty=4&bookNo=5&odQty=1
		String[] bookNo = request.getParameterValues("bookNo");
		String[] bookQty = request.getParameterValues("bookQty");
		for(int i = 0; i < bookNo.length; i++) {
			OrderdetailDto orderdetailDto = new OrderdetailDto();
			orderdetailDto.setBook_no(Integer.parseInt(bookNo[i]));
			orderdetailDto.setOd_qty(Integer.parseInt(bookQty[i]));
			System.out.println("---------");
			System.out.println(bookNo[i]);
			System.out.println(bookQty[i]);
			System.out.println("---------");
			orderDetails.add(orderdetailDto);
		}
		ServletContext application = request.getServletContext();
		BuyService buyService = (BuyService)application.getAttribute("BuyService");
		int totalPrice = buyService.getTotalOrderPrice(orderDetails);
		
		session.setAttribute("totalPrice",totalPrice);
		session.setAttribute("orderDetails", orderDetails);
		request.getRequestDispatcher("/WEB-INF/views/book/bookOrder.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션 유저 정보 얻기
		OrderDto orderDto = new  OrderDto();
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto)session.getAttribute("userDto");
		orderDto.setUser_id(userDto.getUser_id());
		
		//주문 정보 받기
		orderDto.setOrder_receivename(request.getParameter("orderReceiveName"));
		orderDto.setOrder_tel(request.getParameter("orderTel"));
		orderDto.setOrder_address(request.getParameter("orderAddress"));
		orderDto.setOrder_memo(request.getParameter("orderMemo"));
		ServletContext application = request.getServletContext();
		
		//서비스 실행
		BuyService buyService = (BuyService)application.getAttribute("BuyService");
		String result = buyService.buy(orderDto, (ArrayList<OrderdetailDto>)session.getAttribute("orderDetails"));
		System.out.println(result);
		if(result.equals("잔액 부족")||result.equals("재고 부족")) {
			request.setAttribute("result", result);
			request.getRequestDispatcher("/WEB-INF/views/book/failOrder.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/WEB-INF/views/book/successOrder.jsp").forward(request, response);
		}
		
	}

}
