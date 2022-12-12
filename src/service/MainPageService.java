package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.CartsDao;
import dao.MainPageDao;
import dto.BookDto;
import dto.UserDto;

public class MainPageService {
	private ServletContext application;
	private DataSource ds;

	public MainPageService(ServletContext application) {
		this.application = application;
		ds = (DataSource) application.getAttribute("dataSource");
	}

	// 금주 bestSeller top-5
	public ArrayList<BookDto> mainPageBestSellerList() {
		MainPageDao mainPageDao = (MainPageDao) application.getAttribute("MainPageDao");
		ArrayList<BookDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = mainPageDao.mainPageBestSellerList(conn);
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

	// 로그인한 사용자 나이대, 성별에서 가장 많이 팔린 top-5
	public ArrayList<BookDto> mainPageGenderAgeList(UserDto userDto) {
		MainPageDao mainPageDao = (MainPageDao) application.getAttribute("MainPageDao");
		ArrayList<BookDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = mainPageDao.mainPageGenderAgeList(conn, userDto);
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

	// 신간도서 bestSeller top-5
	public ArrayList<BookDto> mainPageRecentBookList() {
		MainPageDao mainPageDao = (MainPageDao) application.getAttribute("MainPageDao");
		ArrayList<BookDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = mainPageDao.mainPageRecentBookList(conn);
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
