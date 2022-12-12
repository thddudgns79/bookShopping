package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.JoinDao;
import dao.LoginDao;
import dao.MainPageDao;
import dto.UserDto;

public class MemberService {
	private ServletContext application;
	private DataSource ds;
	private JoinDao joinDao;
	private LoginDao loginDao;
	
	//생성자
	public MemberService(ServletContext application) {
		this.application = application;
		joinDao = (JoinDao)application.getAttribute("JoinDao");
		loginDao = (LoginDao)application.getAttribute("LoginDao");
		ds = (DataSource) application.getAttribute("dataSource");
	}

	
	// 회원가입
	public int insertJoinUser(UserDto insJoinUser) {
		JoinDao joinDao = (JoinDao) application.getAttribute("JoinDao");
		int rows = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			rows = joinDao.insertJoinUser(insJoinUser, conn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rows;
	}

	// 회원가입시 아이디 존재 여부에 대해 검사
	public boolean selectJuserId(UserDto selJuserId) {
		JoinDao joinDAO = (JoinDao) application.getAttribute("JoinDao");
		boolean occupiedId = false;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			occupiedId = joinDAO.selectJuserId(selJuserId, conn); // DAO에서 수행한 결과값만 들어가니까 id 아닌 나머지는 어차피 null
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return occupiedId;
	}

	// 로그인
	public UserDto selectLogin(UserDto selLogin) {
		UserDto juser = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			juser = loginDao.selectLogin(selLogin, conn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return juser;
	}

	// 아이디 찾기
	public UserDto selectSearchId(UserDto selSearchId) {
		UserDto juserid = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			juserid = loginDao.selectSearchId(selSearchId, conn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return juserid;
	}

	// 비밀번호 찾기
	public UserDto selectSearchPw(UserDto selSearchPw) {
		UserDto juserpw = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			juserpw = loginDao.selectSearchPw(selSearchPw, conn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return juserpw;
	}

}