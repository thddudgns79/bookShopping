package service;

import java.sql.Connection;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.AdminBookDao;
import dao.AdminQnaDao;
import dto.AnswerDto;
import dto.PagerDto;
import dto.QnaDto;

public class AdminQnaService {
	private ServletContext application;
	private DataSource ds;

	public AdminQnaService(ServletContext application) {
		this.application = application;
		ds = (DataSource) application.getAttribute("dataSource");
	}
	/*
	 * 사용자 문의 관리
	 */

	// qna게시글 전체 행 수
	public int adminQnaListCount(Connection conn, ServletContext application) {
		AdminQnaDao adminQnaDao = (AdminQnaDao) application.getAttribute("AdminQnaDao");
		int rows = adminQnaDao.adminQnaListCount(conn);
		return rows;
	}

	// 답변 안 달린 qna게시글 전체 행 수
	public int adminQnaNoAnswerListCount(Connection conn, ServletContext application) {
		AdminQnaDao adminQnaDao = (AdminQnaDao) application.getAttribute("AdminQnaDao");
		int rows = adminQnaDao.adminQnaNoAnswerListCount(conn);
		return rows;
	}

	// qna게시글 전체 목록
	public ArrayList<QnaDto> adminQnaList(Connection conn, PagerDto pagerDto, ServletContext application) {
		AdminQnaDao adminQnaDao = (AdminQnaDao) application.getAttribute("AdminQnaDao");
		ArrayList<QnaDto> list = adminQnaDao.adminQnaList(conn, pagerDto);
		return list;
	}

	// 답변 안달린 qna게시글 전체 목록
	public ArrayList<QnaDto> adminQnaNoAnswerList(Connection conn, PagerDto pagerDto, ServletContext application) {
		AdminQnaDao adminQnaDao = (AdminQnaDao) application.getAttribute("AdminQnaDao");
		ArrayList<QnaDto> list = adminQnaDao.adminQnaNoAnswerList(conn, pagerDto);
		return list;
	}

	// qna 상세정보 가져오기
	public QnaDto adminQnaInfo(Connection conn, QnaDto qnaDto, ServletContext application) {
		AdminQnaDao adminQnaDao = (AdminQnaDao) application.getAttribute("AdminQnaDao");
		QnaDto aq = adminQnaDao.adminQnaInfo(conn, qnaDto);
		return aq;
	}

	// qna글에 딸린 문의답변 가져오기
	public AnswerDto adminAnswerInfo(Connection conn, QnaDto qnaDto, ServletContext application) {
		AdminQnaDao adminQnaDao = (AdminQnaDao) application.getAttribute("AdminQnaDao");
		AnswerDto ad = adminQnaDao.adminAnswerInfo(conn, qnaDto);
		return ad;
	}

//	qna 문의답변 생성
	public int adminAnswerCreate(Connection conn, AnswerDto answerDto, ServletContext application) {
		AdminQnaDao adminQnaDao = (AdminQnaDao) application.getAttribute("AdminQnaDao");
		int rows = adminQnaDao.adminAnswerCreate(conn, answerDto);
		return rows;
	}

//	qna 문의답변 삭제
	public int adminAnswerDelete(Connection conn, AnswerDto answerDto, ServletContext application) {
		AdminQnaDao adminQnaDao = (AdminQnaDao) application.getAttribute("AdminQnaDao");
		int rows = adminQnaDao.adminAnswerDelete(conn, answerDto);
		return rows;
	}
}
