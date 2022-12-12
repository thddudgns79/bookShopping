package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.BuyDao;
import dao.CartsDao;
import dto.CartBoardDto;
import dto.CartDto;

public class CartsService {
	private ServletContext application;
	private DataSource ds;
	private CartsDao cDao;

	public CartsService(ServletContext application) {
		this.application = application;
		ds = (DataSource) application.getAttribute("dataSource");
		cDao = (CartsDao) application.getAttribute("CartsDao");

	}

	// 장바구니 목록(cartDto의 user_id가 request파라미터로 넘어옴)
	public ArrayList<CartBoardDto> cartsBoard(CartDto cartDto) {
		ArrayList<CartBoardDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = cDao.selectCartsBoard(conn, cartDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;

	}

	// 장바구니 추가
	public int cartsBoardPlus(CartDto cartdto) {
		int result = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = cDao.insertCartsBoardPlus(conn, cartdto);
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

	// 장바구니 전체 삭제
	public int cartsBoardAllDelete(CartDto cartdto) {
		CartsDao cDao = (CartsDao) application.getAttribute("CartsDao");
		int result = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = cDao.deleteCartsBoardAllDelete(conn, cartdto);
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

	// 장바구니 힌 행 삭제
	public int cartsBoardDelete(CartDto cartdto) {
		CartsDao cDao = (CartsDao) application.getAttribute("CartsDao");
		int result = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = cDao.deleteCartsBoardDelete(conn, cartdto);
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

	// 장바구니 상품 수량 변경
	public int cartsBoardQty(CartDto cartdto) {
		CartsDao cDao = (CartsDao) application.getAttribute("CartsDao");
		int result = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = cDao.updateCartsBoardQty(conn, cartdto);
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

}
