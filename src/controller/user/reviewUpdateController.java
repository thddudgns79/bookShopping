package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.ReviewDto;
import dto.UserDto;
import service.MyReviewUserService;

@WebServlet(name = "controller.user.reviewUpdateController", urlPatterns =  "/controller/user/reviewUpdateController")
public class reviewUpdateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setReview_no(Integer.parseInt(request.getParameter("review_no")));
		
		HttpSession session = request.getSession();
		session.setAttribute("ReviewDto", reviewDto);
		
		request.getRequestDispatcher("/WEB-INF/views/user/reviewUpdate.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MyReviewUserService myReviewUserService = (MyReviewUserService)request.getServletContext().getAttribute("MyReviewUserService");
		ReviewDto reviewDto = new ReviewDto();
		ReviewDto review = (ReviewDto)session.getAttribute("ReviewDto");
		reviewDto.setReview_content(request.getParameter("reviewContent"));
		reviewDto.setReview_score(Integer.parseInt(request.getParameter("rating")));
		reviewDto.setReview_no(review.getReview_no());		
		int reviewUpdate = myReviewUserService.updateReview(reviewDto);
		response.sendRedirect("/shopping/controller/user/myPageReviewListController");
	}
}
