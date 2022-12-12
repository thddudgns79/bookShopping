package controller.user;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ReviewDto;
import service.MyReviewUserService;

@WebServlet(name = "controller.user.deleteReviewListController", urlPatterns =  "/controller/user/deleteReviewListController")
public class deleteReviewListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		MyReviewUserService myReviewUserService = (MyReviewUserService) application.getAttribute("MyReviewUserService");
		int reviewNo = Integer.parseInt(request.getParameter("review_no"));
		System.out.println(reviewNo);
		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setReview_no(reviewNo);
		
		int delDib = myReviewUserService.deleteReview(reviewDto);
		
		String url = "/shopping/controller/user/myPageReviewListController?type=" + 1;
		response.sendRedirect(url);
	}
}
