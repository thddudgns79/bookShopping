package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import controller.user.loginController;
import dao.AdminUserDao;
import dao.MyReviewUserDao;
import dto.PagerDto;
import dto.ReviewDto;
import dto.UserDto;

public class MyReviewUserService {
	private ServletContext application;
	private DataSource ds;
	
	public MyReviewUserService(ServletContext application) {
		this.application = application;
			ds = (DataSource) application.getAttribute("dataSource");
	}
	// 서버->클라이언트

	//리뷰 목록 조회 
	public ArrayList<ReviewDto> selectReview(PagerDto pagerDto, ReviewDto selectReview) {
		MyReviewUserDao myReviewUserDao = (MyReviewUserDao) application.getAttribute("MyReviewUserDao");
		// 리뷰조회
		// {"command":[]}

		ArrayList<ReviewDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = myReviewUserDao.selectReview(conn, pagerDto, selectReview);
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

	//리뷰 목록의 행 수(pager의 totalRows)
	public int selectReviewCount(ReviewDto reviewDto) {
		MyReviewUserDao myReviewUserDao = (MyReviewUserDao) application.getAttribute("MyReviewUserDao");
		int count = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			count = myReviewUserDao.selectReviewCount(conn, reviewDto);
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

	// 리뷰수정
	public int updateReview(ReviewDto updateReview) {
		MyReviewUserDao myReviewUserDao = (MyReviewUserDao) application.getAttribute("MyReviewUserDao");
		int list = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = myReviewUserDao.updateReview(conn, updateReview);
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

	// 리뷰 삭제
	public int deleteReview(ReviewDto review) {
		MyReviewUserDao myReviewUserDao = (MyReviewUserDao) application.getAttribute("MyReviewUserDao");
		int list = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = myReviewUserDao.deleteReview(conn, review);
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

	
	// 사용자 정보 수정
	public int updateUser(UserDto updateUser) {
		MyReviewUserDao myReviewUserDao = (MyReviewUserDao) application.getAttribute("MyReviewUserDao");
		int list = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = myReviewUserDao.updateUser(conn, updateUser);
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

	
	// 사용자 탈퇴 요청
	public int leaveUser(UserDto leaveUser) {
		MyReviewUserDao myReviewUserDao = (MyReviewUserDao) application.getAttribute("MyReviewUserDao");
		int list = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = myReviewUserDao.leaveUser(conn, leaveUser);
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
	// 내 프로필 조회
	public UserDto getUserInfo(String userId) {
		AdminUserDao adminUserDao = new AdminUserDao();
		UserDto userDto = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			userDto = adminUserDao.UserInfo(conn, userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
			}
		}
		return userDto;
	}

}
