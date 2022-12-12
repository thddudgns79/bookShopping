package controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.OrderDetailBookDto;
import dto.OrderDto;
import dto.PagerDto;
import dto.UserDto;
import service.MyOrderService;

@WebServlet(name = "controller.user.myPageOrderController", urlPatterns =  "/controller/user/myPageOrderController")
public class myPageOrderController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		MyOrderService myOrderService = (MyOrderService) application.getAttribute("MyOrderService");
		
		HttpSession session = request.getSession();
		UserDto user = (UserDto)session.getAttribute("userDto");
		
		OrderDto orderDto = new OrderDto();
		orderDto.setUser_id(user.getUser_id());
		
		String strPageNo = request.getParameter("pageNo");
		if(strPageNo == null) {
			strPageNo = "1";
		}
		int pageNo = Integer.parseInt(strPageNo);
		int totalRows = myOrderService.selectOrderCount(orderDto);
		PagerDto pager = new PagerDto(5, 5, totalRows, pageNo);
		ArrayList<OrderDto> orderList = myOrderService.selectOrder(pager, orderDto);
		for(OrderDto orderDto2 : orderList) {
			ArrayList<OrderDetailBookDto> odList = orderDto2.getOrderDetails();
			for(OrderDetailBookDto dto : odList) {
				System.out.println(dto.getFileName());
			}
			System.out.println();
		}
		request.setAttribute("orderList", orderList);
		request.setAttribute("pager", pager);
		
		
		request.getRequestDispatcher("/WEB-INF/views/user/myPageOrder.jsp").forward(request, response);
	}

}
