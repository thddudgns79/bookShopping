package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.AnswerDao;
import dao.QnaDao;
import dto.AnswerDto;
import dto.PagerDto;
import dto.QnaDto;
import dto.UserDto;

public class QnaService {
	private ServletContext application;
	private DataSource ds;
	private QnaDao qnaDao;
	public QnaService(ServletContext application) {
		this.application = application;

		qnaDao = (QnaDao) application.getAttribute("QnaDao");
		ds = (DataSource) application.getAttribute("dataSource");

	}
	/*
	 * public static void main(String args[]) {
	 * 
	 * // 값 검증해보기 // QMatch() 검증 - boolean 타입 QnaService qnaService = new
	 * QnaService(); JSONObject jo = qnaService.QMatch("eunjong", 100,
	 * ConnectionProvider.getConnection());
	 * System.out.println(jo.getBoolean("data"));
	 * 
	 * // QCreate() 데이터 값 보내고 검증 - 값 입력해야하는 타입 QcreateDTO qcreateDTO = new
	 * QcreateDTO(); qcreateDTO.setQna_category("결제");
	 * qcreateDTO.setUser_id("eunjong"); qcreateDTO.setQna_title("배송");
	 * qcreateDTO.setQna_content("배송");
	 * 
	 * QnaService qnaService = new QnaService(); JSONObject jo =
	 * qnaService.QCreate(qcreateDTO); System.out.println(jo.getInt("data"));
	 * 
	 * // QList() 검증 - 다중 행 타입 QnaService qnaService = new QnaService(); JSONObject
	 * jo = qnaService.QList(ConnectionProvider.getConnection()); JSONArray arr =
	 * jo.getJSONArray("data"); for (int i = 0; i < arr.length(); i++) {
	 * System.out.println(arr.get(i).toString()); }
	 * 
	 * // QRead() 검증 - 객체 타입 QnaService qnaService = new QnaService(); QreadDTO
	 * qread = new QreadDTO(); qread.setQna_no(5);
	 * 
	 * JSONObject jo = qnaService.QRead(qread, ConnectionProvider.getConnection());
	 * System.out.println(jo.get("data").toString()); }
	 */
	// QNA 게시판 목록 행 수
	public int selectQlistCount() {
		int count = 0;
		Connection conn = null;
	      try {
	         conn = ds.getConnection();
	         count = qnaDao.selectQlistCount(conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            conn.close();
	         } catch (SQLException e) {}
	      }
		
		return count;
	}

	// QNA 게시판 목록 조회
	public ArrayList<QnaDto> selectQlist(PagerDto pagerDto) {
		Connection conn = null;
		ArrayList<QnaDto> qlist = new ArrayList<>(); 

		try {
			conn=ds.getConnection();
			qlist = qnaDao.selectQlist(pagerDto, conn);
		}catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			}catch(SQLException e) {}
		}
		

		return qlist;
	}

	// Qna 카테고리 목록 행수
	public int selectQcglistCount(String category) {
		Connection conn = null;
		int count = 0;
		try {
			conn = ds.getConnection();
			count = qnaDao.selectQcglistCount(category, conn);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			}catch(SQLException e) {}
		}
	
		return count;
	}

	// QNA 카테고리 목록 조회
	public ArrayList<QnaDto> selectQcglist(String category, PagerDto pagerDto){
		Connection conn = null;
		ArrayList<QnaDto> qlist = new ArrayList<>();
		try {
			conn = ds.getConnection();
			qlist = qnaDao.selectQcglist(category, pagerDto, conn);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(SQLException e) {}
		}
		
		return qlist;
	}

	// QNA 게시판 새 글 작성
	public int insertQna(QnaDto insQna) {
		int rows = 0; 
		Connection  conn = null;
		try {
			conn = ds.getConnection();
			rows = qnaDao.insertQna(insQna, conn);			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(SQLException e) {
				
			}
		}

		return rows;
	}

	// QNA 게시판 게시글 수정
	public int updateQna(QnaDto upQna) {
		Connection conn = null;
		int rows = 0; 
		try {
			conn = ds.getConnection();
			rows = qnaDao.updateQna(upQna, conn);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(SQLException e) {}
		}

		return rows;
	}

	// QNA 게시판 게시글 삭제
	public int deleteQna(QnaDto delQna) {
		
		Connection conn = null;
		int rows = 0; 
		try {
			conn = ds.getConnection();
			rows = qnaDao.deleteQna(delQna, conn);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(SQLException e) {}
		}

		return rows;
	}

	// QNA 게시판 글 조회
	public QnaDto selectQdetail(int qnaNo) {
		Connection conn = null;
		QnaDto qdetail = new QnaDto(); 
		try {
			conn = ds.getConnection();
			qdetail = qnaDao.selectQdetail(qnaNo, conn);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			}catch(SQLException e) {}
		}

		return qdetail;
	}

	// 게시글 수정/삭제/조회시 원글을 작성한 본인이 맞는지 확인
	public boolean selectQmatch(QnaDto selQmatch) {
		Connection conn = null;
		boolean isMine = false; 
		try {
			conn = ds.getConnection();
			isMine = qnaDao.selectQmatch(selQmatch, conn);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(SQLException e) {}
		}

		return isMine;
	}

	// QNA 게시판 조회수 카운트
	public int updateQviewcount(int qnaNo) {

		Connection conn = null;
		int rows = 0; 
		try {
			conn = ds.getConnection();
			rows = qnaDao.updateQviewcount(qnaNo, conn);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(SQLException e) {}
		}

		return rows;
	}

	// Qna Answer : 문의글 답변 상세 읽기
	public AnswerDto selectQanswer(int qnaNo) {
		AnswerDao answersDAO = (AnswerDao)application.getAttribute("AnswerDao");
		Connection conn = null;
		AnswerDto qanswer = new AnswerDto();
		try {
			conn = ds.getConnection();
			qanswer = answersDAO.selectQanswer(qnaNo, conn);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			}catch(SQLException e) {}
		}

		return qanswer;
	}
	
	//Qna 내가 작성한 글 목록
	public int selectQmylistCount(UserDto userDto) {
		int count = 0;
		Connection conn = null;
	      try {
	         conn = ds.getConnection();
	         count = qnaDao.selectQmylistCount(userDto,conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            conn.close();
	         } catch (SQLException e) {}
	      }
		
		return count;
	}
	
	
	//Qna 내가 작성한 글 조회
	public ArrayList<QnaDto> selectQmylist(UserDto userDto,PagerDto pagerDto) {
		Connection conn = null;
		ArrayList<QnaDto> qlist = new ArrayList<>(); 

		try {
			conn=ds.getConnection();
			qlist = qnaDao.selectQmylist(userDto,pagerDto, conn);
		}catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			}catch(SQLException e) {}
		}
		

		return qlist;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}