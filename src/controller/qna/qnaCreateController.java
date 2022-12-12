package controller.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.QnaDto;
import dto.UserDto;
import service.MemberService;
import service.QnaService;

@WebServlet(name = "controller.qna.qnaCreateController", urlPatterns =  "/controller/qna/qnaCreateController")
public class qnaCreateController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnaService qnaService = (QnaService) request.getServletContext().getAttribute("QnaService");
		
		request.getRequestDispatcher("/WEB-INF/views/qna/qnaCreate.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnaService qnaService = (QnaService) request.getServletContext().getAttribute("QnaService");
		
		QnaDto qnaDto = new QnaDto();
		qnaDto.setQna_category(request.getParameter("qna_category"));
		qnaDto.setQna_title(request.getParameter("qna_title"));
		qnaDto.setQna_content(request.getParameter("qna_content"));
		qnaDto.setUser_id(request.getParameter("userId"));
		
		//QnA 게시판 새 글 작성 서비스
		qnaService.insertQna(qnaDto);
		
		response.sendRedirect("qnaBoardController");
		
	}

}
