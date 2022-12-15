package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.AdminAuthorDao;
import dao.AdminUserDao;
import dao.BuyDao;
import dto.BookDto;
import dto.OrderDto;
import dto.OrderdetailDto;
import dto.UserDto;

public class BuyService {
	private ServletContext application;
	private DataSource ds;
	private BuyDao bDao;

	public BuyService(ServletContext application) {
		this.application = application;
		this.bDao = (BuyDao) application.getAttribute("BuyDao");
		ds = (DataSource) application.getAttribute("dataSource");
	}

    // 주문  orderDto = 주문 기본 정보(배송지, 배송메모, 수령인 이름, 전화번호...etc), OrderdetailDto = 어떤 책 몇권 * n
	public boolean buy(OrderDto orderDto, ArrayList<OrderdetailDto> list) {
		Connection conn = null;
		boolean result = false;
		
		//유저의 충전금액 확인
		UserDto oderUser = new UserDto();
		oderUser.setUser_id(orderDto.getUser_id());

		UserDto userCharge = userMoney(oderUser);
		int userChargeMoney = userCharge.getUser_money();
		
		int totalOrderMoney = getTotalOrderPrice(list);
		
		if(userChargeMoney < totalOrderMoney) {
			System.out.println("금액 부족");
			return false;
		}
		
		//주문 수량과 책 보유량 비교
		for(int i = 0; i<list.size(); i++) {
			BookDto book = new BookDto();
			book.setBook_no(list.get(i).getBook_no());
			BookDto foundBook = bookStore(book);
			if(list.get(i).getOd_qty() > foundBook.getBook_store()) {
				System.out.println("재고부족");
				return false;
			}
		
		}
		
		try {
			conn = ds.getConnection();
			result = bDao.insertBuy(conn, orderDto, list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	//주문받은 총 가격 구하기
	public int getTotalOrderPrice(ArrayList<OrderdetailDto> list) {
		SearchService service = (SearchService)application.getAttribute("SearchService");
		int total = 0;
		for(int i = 0; i<list.size(); i++) {
			int qty = list.get(i).getOd_qty();
			
			//책 한권 가격 
			BookDto book = new BookDto();
			book.setBook_no(list.get(i).getBook_no());		
			BookDto foundBook = service.book(book);
			int aBookPrice = foundBook.getBook_price();
			
			total += aBookPrice * qty;
		}
		return total;
	}
	
	// 주문대상 책 재고 확인
	public BookDto bookStore(BookDto bookDto) {
		BookDto bookStore = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			bookStore = bDao.selectBookStore(conn, bookDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bookStore;
	}

	 // 주문자의 머니 체크 
	public UserDto userMoney(UserDto userDto) {
		UserDto user = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			user = bDao.selectUserMoney(conn, userDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}

	/*
	 * <buy 서비스를 요청할 때 클라이언트가 서버로 보내는 json형식> {"command" : "buy", "data" :
	 * {"userOrder" : {"orderNo : "주문번호값", "orderDate : "주문날짜값" .....} ,
	 * "orderDetailList" :
	 * [{"orderNo : "주문번호값", "bookNo" : "책번호값", "odQty" :  "주문수량값"}, {}, {} ...]}}
	 */

}
