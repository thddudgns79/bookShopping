package controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.PagerDto;
import dto.SelectDibDto;
import dto.UserDto;
import service.MyExtraService;


@WebServlet(name = "controller.user.myLikeListController", urlPatterns =  "/controller/user/myLikeListController")
public class myLikeListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pageNo 얻기
		String strPageNo = request.getParameter("pageNo");
		if(strPageNo == null) {
			strPageNo = "1";
		}
		int pageNo = Integer.parseInt(strPageNo);
		//BoardService 객체 얻기
		ServletContext application = request.getServletContext();
		MyExtraService myextraService = (MyExtraService) application.getAttribute("MyExtraService");
		
		HttpSession session = request.getSession();
		UserDto user = (UserDto)session.getAttribute("userDto");
		SelectDibDto sdib = new SelectDibDto();
		sdib.setUser_id(user.getUser_id());
		//전체 페이징 대상이 되는 행 수 얻기
		int totalBoardNum = myextraService.selectDibCount(sdib);
				
		//Pager 생성
		PagerDto pagerDto = new PagerDto(7, 5, totalBoardNum, pageNo);
		
		//pageNo에 해당하는 게시물 가져오기
		List<SelectDibDto> pageList = myextraService.selectDib(pagerDto, sdib);

		
		//JSP에서 사용할 수 있도록 request 범위에 저장
		request.setAttribute("pager", pagerDto);
		request.setAttribute("pageList",pageList);		
		
		String type = request.getParameter("type");
		// 수정, 삭제 등 ajax 요청 후에 여기로 넘어온 것 
		if(type != null) {
			request.getRequestDispatcher("/WEB-INF/views/user/myLikeListFragment.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/WEB-INF/views/user/myLikeList.jsp").forward(request, response);
		}
	}

}
