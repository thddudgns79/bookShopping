package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.JoinDao;
import dao.MyExtraDao;
import dto.DibDto;
import dto.PagerDto;
import dto.QnaDto;
import dto.ReviewDto;
import dto.SelectAnswerDto;
import dto.SelectDibDto;
import dto.UserDto;

public class MyExtraService {
	private ServletContext application;
	private DataSource ds;

	public MyExtraService(ServletContext application) {
		this.application = application;
		ds = (DataSource) application.getAttribute("dataSource");
	}

	// 회원 돈 충전 하기
	public boolean chargeMoney(UserDto user, int money) {
		MyExtraDao myDao = (MyExtraDao) application.getAttribute("MyExtraDao");
		boolean done = false;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			done = myDao.chargeMoney(conn, user, money);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return done;
	}

	// 찜 목록 조회
	public ArrayList<SelectDibDto> selectDib(PagerDto pagerDto, SelectDibDto sdib){
		MyExtraDao myDao = (MyExtraDao) application.getAttribute("MyExtraDao");
		ArrayList<SelectDibDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = myDao.selectDib(conn, pagerDto, sdib);
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

	// 찜 목록의 행 수(pager의 totalRows)
	public int selectDibCount(SelectDibDto sdib) {
		MyExtraDao myDao = (MyExtraDao) application.getAttribute("MyExtraDao");
		int count = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			count = myDao.selectDibCount(conn, sdib);
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
	
	// Qna조회
	public ArrayList<QnaDto> selectQna(PagerDto pagerDto, QnaDto qna) {
		MyExtraDao myDao = (MyExtraDao) application.getAttribute("MyExtraDao");
		ArrayList<QnaDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = myDao.selectQna(conn, pagerDto, qna);
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

	public int selectQnaCount(QnaDto qna) {
		// Qna조회 Count
		MyExtraDao myDao = (MyExtraDao) application.getAttribute("MyExtraDao");
		int count = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			count = myDao.selectQnaCount(conn, qna);
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

	public ArrayList<SelectAnswerDto> selectAnswer(SelectAnswerDto sanswer) {
		// answer답변 조회
		MyExtraDao myDao = (MyExtraDao) application.getAttribute("MyExtraDao");
		ArrayList<SelectAnswerDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = myDao.selectAnswer(conn, sanswer);
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

	// 찜 삭제
	public int deleteDib(DibDto deldib) {
		MyExtraDao myDao = (MyExtraDao) application.getAttribute("MyExtraDao");
		int row = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			row = myDao.deleteDib(conn, deldib);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}

	public ArrayList<ReviewDto> checkBookNumber(ReviewDto review) {
		MyExtraDao myDao = (MyExtraDao) application.getAttribute("MyExtraDao");
		ArrayList<ReviewDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = myDao.checkBookNumber(conn, review);
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
