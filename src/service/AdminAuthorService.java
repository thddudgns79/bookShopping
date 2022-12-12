package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.AdminAuthorDao;
import dto.AuthorDto;
import dto.PagerDto;

public class AdminAuthorService {
	private ServletContext application;
	private DataSource ds;

	public AdminAuthorService(ServletContext application) {
		this.application = application;
		ds = (DataSource) application.getAttribute("dataSource");
	}

	// 저자 행 수
	public int adminAuthorListCount(ServletContext application) {
		AdminAuthorDao adminAuthorDao = (AdminAuthorDao) application.getAttribute("AdminAuthorDao");
		Connection conn = null;
		int count = 0;
		try {
			conn = ds.getConnection();
			count = adminAuthorDao.adminAuthorListCount(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// 저자 목록 출력
	public ArrayList<AuthorDto> adminAuthorList(PagerDto pagerDto, ServletContext application) {
		AdminAuthorDao adminAuthorDao = (AdminAuthorDao) application.getAttribute("AdminAuthorDao");
		ArrayList<AuthorDto> list = adminAuthorDao.adminAuthorList(null, pagerDto);
		return list;
	}

	// 저자 이름 검색 행 수
	public int adminAuthorListByNameCount(AuthorDto authorDto) {
		AdminAuthorDao adminAuthorDao = (AdminAuthorDao) application.getAttribute("AdminAuthorDao");
		Connection conn = null;
		int count = 0;
		try {
			conn = ds.getConnection();
			count = adminAuthorDao.adminAuthorListByNameCount(conn, authorDto);
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

	// 저자 이름 검색 목록 출력
	public ArrayList<AuthorDto> adminAuthorListByName(AuthorDto authorDto, PagerDto pagerDto) {
		AdminAuthorDao adminAuthorDao = (AdminAuthorDao) application.getAttribute("AdminAuthorDao");
		ArrayList<AuthorDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = adminAuthorDao.adminAuthorListByName(conn, authorDto, pagerDto);
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

	// 저자 상세정보
	public AuthorDto adminAuthorInfo(AuthorDto authorDto) {
		AdminAuthorDao adminAuthorDao = (AdminAuthorDao) application.getAttribute("AdminAuthorDao");
		AuthorDto authorInfo = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			authorInfo = adminAuthorDao.adminAuthorInfo(conn, authorDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return authorInfo;
	}

	// 저자 추가
	public int adminAuthorAdd(Connection conn, AuthorDto authorDto, ServletContext application) {
		AdminAuthorDao adminAuthorDao = (AdminAuthorDao) application.getAttribute("AdminAuthorDao");
		int rows = adminAuthorDao.adminAuthorAdd(null, authorDto);
		return rows;
	}

	// 저자 삭제
	public int adminAuthorPop(Connection conn, AuthorDto authorDto, ServletContext application) {
		AdminAuthorDao adminAuthorDao = (AdminAuthorDao) application.getAttribute("AdminAuthorDao");
		int rows = adminAuthorDao.adminAuthorPop(null, authorDto);
		return rows;
	}

	// 저자 정보 변경
	public int adminAuthorUpdate(Connection conn, AuthorDto authorDto, ServletContext application) {
		AdminAuthorDao adminAuthorDao = (AdminAuthorDao) application.getAttribute("AdminAuthorDao");
		int rows = adminAuthorDao.adminAuthorUpdate(null, authorDto);
		return rows;
	}
}
