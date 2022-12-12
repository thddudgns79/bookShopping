package controller.qna;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PagerDto;
import dto.QnaDto;
import service.QnaService;


@WebServlet(name = "controller.qna.qnaBoardCategoryController", urlPatterns =  "/controller/qna/qnaBoardCategoryController")
public class qnaBoardCategoryController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = null;

		int categoryNo =Integer.parseInt(request.getParameter("category"));

		switch (categoryNo) {
		case 1:
			category = "[배송]";
			break;
		case 2:
			category = "[주문/결제]";
			break;
		case 3:
			category = "[도서/상품정보]";
			break;
		case 4:
			category = "[반품/교환/환불]";
			break;
		case 5:
			category = "[회원정보서비스]";
			break;
		case 6:
			category = "[웹사이트 이용 관련]";
			break;
		case 7:
			category = "[시스템 불편사항]";
			break;
		case 8:
			category = "[기타]";
			break;
			
		}
		
		
		String strPageNo = request.getParameter("pageNo");
		 if(strPageNo == null	) {
			 strPageNo = "1";
		 }
		 
		
		 int pageNo = Integer.parseInt(strPageNo);
		 
		 //QnaService 객체 얻기
		 ServletContext application = request.getServletContext();
		 QnaService qnaService = (QnaService) application.getAttribute("QnaService");
		 
		 
		 //문의게시글 전체 행수 얻기
		 int totalQnaNum = qnaService.selectQcglistCount(category);
		
		 //Pager 생성
		 PagerDto pager = new PagerDto(10,5, totalQnaNum, pageNo);
		 
		 //해당 pageNo에 해당하는 게시물 가져오기
		 List<QnaDto> pageList = qnaService.selectQcglist(category,pager);
		 request.setAttribute("categoryNo", categoryNo);
		 request.setAttribute("pager", pager);
		 request.setAttribute("pageList", pageList);
		
		 request.getRequestDispatcher("/WEB-INF/views/qna/qnaCategory.jsp").forward(request, response);
	}

}
