package context;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

import dao.AdminAuthorDao;
import dao.AdminBookDao;
import dao.AdminUserDao;
import dao.AnswerDao;
import dao.BookBoardDao;
import dao.BuyDao;
import dao.CartsDao;
import dao.CategoryDao;
import dao.IntegrationDao;
import dao.JoinDao;
import dao.LoginDao;
import dao.MainPageDao;
import dao.MyExtraDao;
import dao.MyOrderDao;
import dao.MyReviewUserDao;
import dao.QnaDao;
import dao.ReviewPlusDao;
import service.AdminAuthorService;
import service.AdminBookService;
import service.AdminQnaService;
import service.AdminUserService;
import service.BuyService;
import service.CartsService;
import service.MainPageService;
import service.MemberService;
import service.MyExtraService;
import service.MyOrderService;
import service.MyReviewUserService;
import service.QnaService;
import service.ReviewPlusService;
import service.SearchService;

public class WebAppContext implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("ServletContext가생성됨");
		// ServletContext에 객체(데이터)를 얻기
		ServletContext application = sce.getServletContext();
		
		//ConnectionPool (javax.sql.DataSource) 객체 얻기
		DataSource dataSource = ConnectionProvider.getDataSource();
		application.setAttribute("dataSource", dataSource);
		

		// ServletContext에 DAO 객체를 저장
		application.setAttribute("AdminAuthorDao", new AdminAuthorDao());
		application.setAttribute("AdminBookDao", new AdminBookDao());
		application.setAttribute("AdminQnaDao", new AdminBookDao());
		application.setAttribute("AdminUserDao", new AdminUserDao());
		application.setAttribute("AnswerDao", new AnswerDao());
		application.setAttribute("BookBoardDao", new BookBoardDao());
		application.setAttribute("BuyDao", new BuyDao());
		application.setAttribute("CartsDao", new CartsDao());
		application.setAttribute("CategoryDao", new CategoryDao());
		application.setAttribute("IntegrationDao", new IntegrationDao());
		application.setAttribute("JoinDao", new JoinDao());
		application.setAttribute("LoginDao", new LoginDao());
		application.setAttribute("MainPageDao", new MainPageDao());
		application.setAttribute("MyExtraDao", new MyExtraDao());
		application.setAttribute("MyOrderDao", new MyOrderDao());
		application.setAttribute("MyReviewUserDao", new MyReviewUserDao());
		application.setAttribute("QnaDao", new QnaDao());
		application.setAttribute("ReviewPlusDao", new ReviewPlusDao());
		
		
		//ServletContext에 SERVICE 객체를 저장 
		application.setAttribute("AdminAuthorService", new AdminAuthorService(application));
		application.setAttribute("AdminBookService", new AdminBookService(application));
		application.setAttribute("AdminQnaService", new AdminQnaService(application));
		application.setAttribute("AdminUserService", new AdminUserService(application));
		application.setAttribute("BuyService", new BuyService(application));
		application.setAttribute("CartsService", new CartsService(application));
		application.setAttribute("MainPageService", new MainPageService(application));
		application.setAttribute("MemberService", new MemberService(application));
		application.setAttribute("MyExtraService", new MyExtraService(application));
		application.setAttribute("MyOrderService", new MyOrderService(application));
		application.setAttribute("MyReviewUserService", new MyReviewUserService(application));
		application.setAttribute("QnaService", new QnaService(application));
		application.setAttribute("ReviewPlusService", new ReviewPlusService(application));
		application.setAttribute("SearchService", new SearchService(application));
		
	}

}
