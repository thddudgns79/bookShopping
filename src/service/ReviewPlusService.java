package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.QnaDao;
import dao.ReviewPlusDao;
import dto.ReviewDto;

public class ReviewPlusService {
	private ServletContext application;
	private DataSource ds;

	public ReviewPlusService(ServletContext application) {
		this.application = application;
		ds = (DataSource) application.getAttribute("dataSource");
	}

	// 리뷰 작성 
	public int reviewBoardPlus(ReviewDto reviewdto) {
		ReviewPlusDao rDao = (ReviewPlusDao) application.getAttribute("ReviewPlusDao");
		int result = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = rDao.insertReviewBoardPlus(conn, reviewdto);
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

	// 해당 책에 이미 리뷰 작성했는지 여부 체크(ReviewDto에 userId, bookNo 삽입)
	public boolean reviewCheck(ReviewDto reviewdto) {
		ReviewPlusDao rDao = (ReviewPlusDao) application.getAttribute("ReviewPlusDao");
		boolean result = false;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = rDao.selectReviewCheck(conn, reviewdto);
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

	// 책 구매했는지 체크(ReviewDto에 userId, bookNo 삽입)
	public boolean orderCheck(ReviewDto reviewdto) {
		ReviewPlusDao rDao = (ReviewPlusDao) application.getAttribute("ReviewPlusDao");
		boolean result = false;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = rDao.selectOrderCheck(conn, reviewdto);
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
