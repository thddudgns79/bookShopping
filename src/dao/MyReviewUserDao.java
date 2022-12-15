package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.PagerDto;
import dto.ReviewDto;
import dto.UserDto;


public class MyReviewUserDao {
	
	public ArrayList<ReviewDto>  selectReview(Connection conn, PagerDto pagerDto, ReviewDto review) {
		//리뷰 게시판 조회 - ReviewDto
		ArrayList<ReviewDto> list = new ArrayList<>();
		try {
			String sql = "select *"
					+ " from( select rownum rnum, r.book_no, review_no, book_name, to_char(review_date,'yyyy-mm-dd') as review_date,review_content, review_score, user_id"
					+ " from reviews r, books b"
					+ " where r.book_no = b.book_no and user_id = ? and rownum <= ? )"
					+ " where rnum >= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getUser_id());
			pstmt.setInt(2, pagerDto.getEndRowNo());
			pstmt.setInt(3, pagerDto.getStartRowNo());
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewDto reviewDto = new ReviewDto();
				reviewDto.setReview_no(rs.getInt("review_no"));
				reviewDto.setBook_name(rs.getString("book_name"));
				reviewDto.setReview_date(rs.getString("review_date"));
				reviewDto.setReview_content(rs.getString("review_content"));
				reviewDto.setReview_score(rs.getInt("review_score"));
				reviewDto.setUser_id(rs.getString("user_id"));
				reviewDto.setBook_no(rs.getInt("book_no"));
				
				list.add(reviewDto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB연결 오류 발생");
		} finally {
			try {
				if (conn != null) {
					System.out.println("DB연결 해제");
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	public int selectReviewCount(Connection conn, ReviewDto review) {
		//리뷰 게시판 조회 - ReviewDto
		int count = 0;
		try {
			String sql = "select count(*) as count from reviews where user_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getUser_id());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB연결 오류 발생");
		} finally {
			try {
				if (conn != null) {
					System.out.println("DB연결 해제");
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return count;
	}
	
	
	public int updateReview(Connection conn, ReviewDto review) {
		//리뷰 수정 - ReviewDto
		int updateR_rows = 0;
		
		try {
			String sql = "UPDATE REVIEWS SET review_content=?, review_date= sysdate, review_score=? "
					 + " WHERE review_no=?"; 
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getReview_content());
			pstmt.setInt(2, review.getReview_score());
			pstmt.setInt(3, review.getReview_no());
			
			updateR_rows = pstmt.executeUpdate();
			
			System.out.println("수정된 행 수: "+updateR_rows);
			
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB연결 오류 발생");
		} finally {
			try {
				if (conn != null) {
					System.out.println("DB연결 해제");
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return updateR_rows;
	}
	

	public int deleteReview(Connection conn, ReviewDto review) {
		//리뷰 삭제
		int deleteR_row = 0;
		try {		
			String sql = "DELETE FROM REVIEWS WHERE review_no = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review.getReview_no());
			deleteR_row = pstmt.executeUpdate();
			System.out.println("행삭제 성공");
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB연결 오류 발생");
		} finally {
			try {
				if (conn != null) {
					System.out.println("DB연결 해제");
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return deleteR_row;
	}

	public int updateUser(Connection conn, UserDto updateUser) {
		//사용자 정보 수정
		System.out.println(updateUser.getUser_password());

		int updateU_rows=0;
		try {
			String sql = "UPDATE USERS SET USER_PASSWORD= ?, USER_NAME= ?, USER_EMAIL= ?, "
						+" USER_TEL= ?, USER_ADDRESS= ? "
						+" WHERE USER_ID= ? ";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateUser.getUser_password());
			pstmt.setString(2, updateUser.getUser_name());
			pstmt.setString(3, updateUser.getUser_email());
			pstmt.setString(4, updateUser.getUser_tel());
			pstmt.setString(5, updateUser.getUser_address());
			pstmt.setString(6, updateUser.getUser_id());

			updateU_rows = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB연결 오류 발생");
		} finally {
			try {
				if (conn != null) {
					System.out.println("DB연결 해제");
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return updateU_rows;
	}
	
	public int leaveUser(Connection conn, UserDto user){
		//사용자 탈퇴 요청
		int leaveU_rows = 0;
		try {
			String sql = "UPDATE USERS set user_delete='R', user_dreq_date=sysdate where user_id =?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUser_id()); 
			leaveU_rows = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch(Exception e){
			e.printStackTrace();
			System.out.println("DB연결 오류 발생");
		} finally {
			try {
				if(conn != null) {
					System.out.println("DB연결 해제");
					conn.close();
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return leaveU_rows;
	}

}
