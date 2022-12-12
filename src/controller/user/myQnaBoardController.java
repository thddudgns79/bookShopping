package controller.user;

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
import dto.UserDto;
import service.QnaService;

@WebServlet(name = "controller.user.myQnaBoardController", urlPatterns =  "/controller/user/myQnaBoardController")
public class myQnaBoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDto userDto = new UserDto();
		userDto.setUser_id(request.getParameter("user_id"));
		
		
		String strPageNo = request.getParameter("pageNo");
		 if(strPageNo == null	) {
			 strPageNo = "1";
		 }
		 
		
		 int pageNo = Integer.parseInt(strPageNo);
		 
		 //QnaService 객체 얻기
		 ServletContext application = request.getServletContext();
		 QnaService qnaService = (QnaService) application.getAttribute("QnaService");
		 
		 
		 //문의게시글 전체 행수 얻기
		 int totalQnaNum = qnaService.selectQmylistCount(userDto);
		
		 //Pager 생성
		 PagerDto pager = new PagerDto(10,5, totalQnaNum, pageNo);
		 
		 //해당 pageNo에 해당하는 게시물 가져오기
		 List<QnaDto> pageList = qnaService.selectQmylist(userDto,pager);
		 request.setAttribute("userDto", userDto);
		 request.setAttribute("pager", pager);
		 request.setAttribute("pageList", pageList);
		
		request.getRequestDispatcher("/WEB-INF/views/user/myQnaBoard.jsp").forward(request, response);
	}

}
