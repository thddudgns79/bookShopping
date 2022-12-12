package controller.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AnswerDto;
import dto.QnaDto;
import service.QnaService;


@WebServlet(name = "controller.qna.qnaDetailController", urlPatterns =  "/controller/qna/qnaDetailController")
public class qnaDetailController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qnaNo = Integer.parseInt(request.getParameter("qna_no"));
		
		QnaService qnaService = (QnaService) request.getServletContext().getAttribute("QnaService");
		int upQviewcount = qnaService.updateQviewcount(qnaNo);

		QnaDto qnaDto = qnaService.selectQdetail(qnaNo);
		qnaDto.setQna_view(upQviewcount);
		AnswerDto answerDto = qnaService.selectQanswer(qnaNo);
		
		request.setAttribute("qnaDto", qnaDto);
		request.setAttribute("answerDto", answerDto);
		
		request.getRequestDispatcher("/WEB-INF/views/qna/qnaDetail.jsp").forward(request, response);
	}

}
