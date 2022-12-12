package service;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.BookBoardDao;
import dao.CategoryDao;
import dao.IntegrationDao;
import dto.AuthorDto;
import dto.BookDto;
import dto.CategoryDto;
import dto.DibDto;
import dto.PagerDto;
import dto.ReviewDto;
import dto.SearchDto;
import dto.SubCategoryDto;

public class SearchService {
	private ServletContext application;
	private DataSource ds;

	public SearchService(ServletContext application) {
		this.application = application;
		ds = (DataSource) application.getAttribute("dataSource");
	}

	// 카테고리 목록
	public ArrayList<CategoryDto> category() {
		CategoryDao cDao = (CategoryDao) application.getAttribute("CategoryDao");
		ArrayList<CategoryDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = cDao.selectCategory(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 서브카테고리 목록
	public ArrayList<SubCategoryDto> subCategory(CategoryDto categoryDto) {
		CategoryDao cDao = (CategoryDao) application.getAttribute("CategoryDao");
		ArrayList<SubCategoryDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = cDao.selectSubCategory(conn, categoryDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 카테고리 행 수
	public int categoryBoardCount(SubCategoryDto subCategoryDto) {
		CategoryDao cDao = (CategoryDao) application.getAttribute("CategoryDao");
		int count = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			count = cDao.SelectCategoryBoardCount(conn, subCategoryDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// 카테고리 검색 목록
	public ArrayList<SearchDto> categoryBoard(SubCategoryDto subCategoryDto, PagerDto pagerDto) {
		CategoryDao cDao = (CategoryDao) application.getAttribute("CategoryDao");
		ArrayList<SearchDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = cDao.SelectCategoryBoard(conn, subCategoryDto, pagerDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 통합 검색 행수
	public int integrationCount(SearchDto searchDto) {
		IntegrationDao iDao = (IntegrationDao) application.getAttribute("IntegrationDao");
		int result = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = iDao.selectIntegrationCount(conn, searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 통합 검색 목록
	public ArrayList<SearchDto> integration(SearchDto searchDto, PagerDto pagerDto) {
		IntegrationDao iDao = (IntegrationDao) application.getAttribute("IntegrationDao");
		ArrayList<SearchDto> list = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			list = iDao.selectIntegration(conn, searchDto, pagerDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 책 상세정보 조회
	public BookDto book(BookDto bookDto) {
		BookBoardDao bDao = (BookBoardDao) application.getAttribute("BookBoardDao");
		BookDto book = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			book = bDao.selectBook(conn, bookDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}

	// 책의 저자목록 조회
	public ArrayList<AuthorDto> authorList(BookDto bookDto) {
		BookBoardDao bDao = (BookBoardDao) application.getAttribute("BookBoardDao");
		ArrayList<AuthorDto> authorList = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			authorList = bDao.selectAuthors(conn, bookDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return authorList;
	}

	// 책 리뷰목록 조회
	public ArrayList<ReviewDto> reviewList(BookDto bookDto, PagerDto pager) {
		BookBoardDao bDao = (BookBoardDao) application.getAttribute("BookBoardDao");
		ArrayList<ReviewDto> reviewList = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			reviewList = bDao.selectReviews(conn, bookDto, pager);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviewList;
	}

	// 책의 리뷰 목록 행 수(pager의 totalRows)
	public int reviewListCount(BookDto bookDto) {
		BookBoardDao bDao = (BookBoardDao) application.getAttribute("BookBoardDao");
		int count = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			count = bDao.selectReviewsCount(conn, bookDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// userId, bookNo 찜에 존재하는지 여부 조회
	public boolean selectCheckDibs(DibDto dibDto) {
		BookBoardDao bDao = (BookBoardDao) application.getAttribute("BookBoardDao");
		boolean result = false;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = bDao.selectCheckDibs(conn, dibDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 찜하기
	public int dibs(DibDto dibDto) {
		BookBoardDao bDao = (BookBoardDao) application.getAttribute("BookBoardDao");
		int result = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = bDao.insertDibs(conn, dibDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 찜 삭제
	public int deleteDibs(DibDto dibDto) {
		BookBoardDao bDao = (BookBoardDao) application.getAttribute("BookBoardDao");
		int result = 0;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = bDao.deleteDibs(conn, dibDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
