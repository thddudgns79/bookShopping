package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.MyOrderDao;
import dto.OrderDto;
import dto.PagerDto;

public class MyOrderService {
	private ServletContext application;
	private DataSource ds;

	public MyOrderService(ServletContext application) {
		this.application = application;
		ds = (DataSource) application.getAttribute("dataSource");
	}

	// 주문 내역 조회(orderDto의 userId에 session userId 대입해서 넘겨줌)
	public ArrayList<OrderDto> selectOrder(PagerDto pagerDto, OrderDto sorder) {
		MyOrderDao myOrderDao = (MyOrderDao) application.getAttribute("MyOrderDao");
		ArrayList<OrderDto> orderlist = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			orderlist = myOrderDao.selectOrder(conn, pagerDto, sorder);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return orderlist;
	}

	// 주문 내역 목록의 행 수(pager의 totalRows)
	public int selectOrderCount(OrderDto order) {
		MyOrderDao myOrderDao = (MyOrderDao) application.getAttribute("MyOrderDao");
		int count = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			count = myOrderDao.selectOrderCount(conn, order);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}

	// 주문 취소
	public boolean cancelOrder(OrderDto corder) {
		MyOrderDao myOrderDao = (MyOrderDao) application.getAttribute("MyOrderDao");
		boolean list = false;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = myOrderDao.cancelOrder(conn, corder);
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

}
