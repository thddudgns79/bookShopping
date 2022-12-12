package controller.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AnswerDto;
import dto.QnaDto;
import dto.UserDto;
import service.MemberService;
import service.QnaService;

@WebServlet(name = "controller.qna.qnaDeleteController", urlPatterns =  "/controller/qna/qnaDeleteController")
public class qnaDeleteController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qnaNo = Integer.parseInt(request.getParameter("qna_no"));
		
		QnaService qnaService = (QnaService) request.getServletContext().getAttribute("QnaService");
		QnaDto qnaDto = qnaService.selectQdetail(qnaNo);
		
		request.setAttribute("qnaDto", qnaDto);
		
		request.getRequestDispatcher("/WEB-INF/views/qna/qnaDelete.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnaService qnaService = (QnaService) request.getServletContext().getAttribute("QnaService");
		int qnaNo = Integer.parseInt(request.getParameter("qna_no"));
		
		QnaDto qnaDto = new QnaDto();
		qnaDto.setQna_category(request.getParameter("qna_category"));
		qnaDto.setQna_title(request.getParameter("qna_title"));
		qnaDto.setQna_content(request.getParameter("qna_content"));
		qnaDto.setUser_id(request.getParameter("userId"));
		qnaDto.setQna_no(qnaNo);
		
		//QnA 게시글 수정전 회원정보 확인
		qnaService.selectQmatch(qnaDto);
		
		//QnA 게시글 수정 서비스
		qnaService.deleteQna(qnaDto);
		
		response.sendRedirect("qnaBoardController");
		
	}

}
