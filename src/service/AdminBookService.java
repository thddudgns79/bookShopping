package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.AdminAuthorDao;
import dao.AdminBookDao;
import dto.AuthorBookDto;
import dto.AuthorDto;
import dto.BookDto;
import dto.BookHashDto;
import dto.PagerDto;
import dto.WarehousingDto;

public class AdminBookService {
	private ServletContext application;
	private DataSource ds;

	public AdminBookService(ServletContext application) {
		this.application = application;
		ds = (DataSource) application.getAttribute("dataSource");
	}

	// 상품관리
	// 책 제목 검색의 행 수
	public int adminBookListByBookNameCount(BookDto bookDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		int count = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			count = adminBookDao.adminBookListByBookNameCount(conn, bookDto);
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

	// 출간일 순 행 수
	public int adminBookListOrderByPublishDateCount() {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		int count = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			count = adminBookDao.adminBookListOrderByPublishDateCount(conn);
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

	// 판매량 순 행 수
	public int adminBookListBySalesCount() {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		int count = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			count = adminBookDao.adminBookListBySalesCount(conn);
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

	// 관리자 페이지 => 책 제목 검색
	public ArrayList<BookDto> adminBookListByBookName(PagerDto pagerDto, BookDto bookDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		ArrayList<BookDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = adminBookDao.adminBookListByBookName(conn, pagerDto, bookDto);
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

	// 전체 책 목록 검색(출간일 순)
	public ArrayList<BookDto> adminBookListOrderByPublishDate(PagerDto pagerDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		ArrayList<BookDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = adminBookDao.adminBookListOrderByPublishDate(conn, pagerDto);
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

	// 전체 책 목록 검색(판매량 순 - 주문 취소건은 합산x)
	public ArrayList<BookDto> adminBookListBySales(PagerDto pagerDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		ArrayList<BookDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = adminBookDao.adminBookListBySales(conn, pagerDto);
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

	// 책 상세정보
	public BookDto adminBookInfo(BookDto bookDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		BookDto book = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			book = adminBookDao.adminBookInfo(conn, bookDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return book;
	}

	// 책의 저자 정보 조회
	public ArrayList<AuthorDto> adminBookAuthorInfo(BookDto bookDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		ArrayList<AuthorDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = adminBookDao.adminBookAuthorInfo(conn, bookDto);
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

	// 책의 해시태그 정보 조회
	public ArrayList<BookHashDto> adminBookHashInfo(BookDto bookDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		ArrayList<BookHashDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = adminBookDao.adminBookHashInfo(conn, bookDto);
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

	// 책 정보수정
	public int adminBookUpdate(BookDto bookDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		int rows = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			rows = adminBookDao.adminBookUpdate(conn, bookDto);
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

	// 책에 저자 추가
	public int adminBookAuthorAdd(AuthorBookDto authorBookDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		int rows = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			rows = adminBookDao.adminBookAuthorAdd(conn, authorBookDto);
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

	// 책의 저자 삭제
	public int adminBookAuthorPop(AuthorBookDto authorBookDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		int rows = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			rows = adminBookDao.adminBookAuthorPop(conn, authorBookDto);
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

	// 책 해시태그 추가
	public int adminHashTagAdd(BookHashDto bookHashDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		int rows = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			rows = adminBookDao.adminHashTagAdd(conn, bookHashDto);
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

	// 책 해시태그 삭제
	public int adminHashTagPop(BookHashDto bookHashDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		int rows = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			rows = adminBookDao.adminHashTagPop(conn, bookHashDto);
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

	// 책 삭제 -> rows = 0이면 실패 1이면 성공
	public int adminBookDelete(BookDto bookDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		int rows = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			rows = adminBookDao.adminBookDelete(conn, bookDto);
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

	// 책 추가
	public int adminBookCreate(BookDto bookDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		int bookNo = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			bookNo = adminBookDao.adminBookCreate(conn, bookDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bookNo;
	}

	// 책 재고 추가 = warehousing 행 추가 + book_store 값 + => 트랜잭션 처리
	public boolean adminWareHousingAdd(WarehousingDto warehousingDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		boolean done = false;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			done = adminBookDao.adminWareHousingAdd(null, warehousingDto);
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

	// 상품 입출고 이력 행 수
	public int adminWareHistorySearchCount(BookDto bookDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		int rows = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			rows = adminBookDao.adminWareHistorySearchCount(null, bookDto);
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

	// 상품 입출고 이력 확인(입출고 날짜 최신 순)
	public ArrayList<WarehousingDto> adminWareHistorySearch(BookDto bookDto, PagerDto pagerDto) {
		AdminBookDao adminBookDao = (AdminBookDao) application.getAttribute("AdminBookDao");
		ArrayList<WarehousingDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = adminBookDao.adminWareHistorySearch(conn, bookDto, pagerDto);
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
