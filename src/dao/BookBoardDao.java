package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.AuthorDto;
import dto.BookDto;
import dto.DibDto;
import dto.PagerDto;
import dto.ReviewDto;

public class BookBoardDao {
	// 상세 검색 메소드
	public BookDto selectBook(Connection conn, BookDto bookDto) {
		BookDto bDto = new BookDto();

		try {
			String sql = "SELECT book_no, book_name, book_detail, book_publisher, book_price, book_store, book_page, book_lang, sub_no, "
					+ " to_char(book_date, 'yyyy-mm-dd') as book_date, filename, filetype, savedname " + "FROM books " + "WHERE book_no = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookDto.getBook_no());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bDto.setBook_no(rs.getInt("book_no"));
				bDto.setBook_name(rs.getString("book_name"));
				bDto.setBook_detail(rs.getString("book_detail"));
				bDto.setBook_publisher(rs.getString("book_publisher"));
				bDto.setBook_price(rs.getInt("book_price"));
				bDto.setBook_store(rs.getInt("book_store"));
				bDto.setBook_page(rs.getInt("book_page"));
				bDto.setBook_lang(rs.getString("book_lang"));
				bDto.setBook_date(rs.getString("book_date"));
				bDto.setSub_no(rs.getInt("sub_no"));
				bDto.setFileName(rs.getString("filename"));
				bDto.setFileType(rs.getString("filetype"));
				bDto.setSavedName(rs.getString("savedname"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bDto;
	}

	// 상세 페이지의 작가 정보
	public ArrayList<AuthorDto> selectAuthors(Connection conn, BookDto bookDto) {
		ArrayList<AuthorDto> authorlist = new ArrayList<AuthorDto>();

		try {
			String sql = "SELECT a.author_no, author_name, nvl(author_detail, '저자 정보가 없습니다.') as author_detail, filename "
					+ "FROM author_book ab, authors a " + "WHERE ab.author_no = a.author_no " + "AND ab.book_no = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookDto.getBook_no());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				AuthorDto aDto = new AuthorDto();
				aDto.setAuthor_no(rs.getInt("author_no"));
				aDto.setAuthor_name(rs.getString("author_name"));
				aDto.setAuthor_detail(rs.getString("author_detail"));
				aDto.setFileName(rs.getString("filename"));
				authorlist.add(aDto);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return authorlist;
	}

	// 상세 페이지의 리뷰 정보
	public ArrayList<ReviewDto> selectReviews(Connection conn, BookDto bookDto, PagerDto pager) {
		ArrayList<ReviewDto> reviewlist = new ArrayList<ReviewDto>();
		try {
			String sql = "";
			sql += "select rnum, user_id, review_date, review_content, review_score ";
			sql += "from (select rnum, user_id, review_date, review_content, review_score ";
			sql += "from (select rownum as rnum, user_id, to_char(review_date, 'yyyy-mm-dd') review_date, review_content, review_score "; 
			sql += "from books b, reviews r where b.book_no = r.book_no and b.book_no = ?) ";
			sql += "where rnum <= ?) where rnum >= ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookDto.getBook_no());
			pstmt.setInt(2, pager.getPageNo() * pager.getRowsPerPage());
			pstmt.setInt(3, ((pager.getPageNo() - 1) * pager.getRowsPerPage()) + 1);			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewDto rDto = new ReviewDto();
				rDto.setUser_id(rs.getString("user_id"));
				rDto.setReview_date(rs.getString("review_date"));
				rDto.setReview_content(rs.getString("review_content"));
				rDto.setReview_score(rs.getInt("review_score"));
				reviewlist.add(rDto);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return reviewlist;
	}
	
	// 상세 페이지의 리뷰 행 수(pager의 totalRows)
		public int selectReviewsCount(Connection conn, BookDto bookDto) {
			int count = 0;
			try {
				String sql = "select count(*) from books b, reviews r where b.book_no = r.book_no and b.book_no = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bookDto.getBook_no());
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				count = rs.getInt(1);
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return count;
		}

	// userId, bookNo 찜에 존재하는지 여부 조회
	public boolean selectCheckDibs(Connection conn, DibDto dibDto) {
		boolean result = false;
		try {
			String sql = "select * from dibs where book_no = ? and user_id = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dibDto.getBook_no());
			pstmt.setString(2, dibDto.getUser_id());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// 상세 페이지에서 책 찜하는 메소드
	public int insertDibs(Connection conn, DibDto dibDto) {
		int result = 0;
		try {
			String sql = "INSERT INTO dibs VALUES (?, ?) ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dibDto.getBook_no());
			pstmt.setString(2, dibDto.getUser_id());
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// 찜 삭제하는 메소드
	public int deleteDibs(Connection conn, DibDto dibdto) {
		int result = 0;
		try {
			String sql = "DELETE dibs WHERE (book_no = ? AND user_id = ? ) ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dibdto.getBook_no());
			pstmt.setString(2, dibdto.getUser_id());
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}
