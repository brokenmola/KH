package _2.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycle
 */

/*
 * 이 페이지의 URL은
 * http://localhost:8088/JspProject/ch3/_1.login/login_Test.html
 * 을 의미합니다.
 * 
 * action의 의미는
 * http://localhost:8088/JspProject/ch3/_1.login/LifeCycleTest
 * 을 의미합니다.
 * 
 * src 폴더의 하위 폴더 _1.login의 LifeCycleTest.java에서
 * @WebServlet(urlPatterns = "/ch3/_1.login/LifeCycleTest");
 * @WebServlet("/ch3/_1.login/LifeCycleTest");
 * 으로 설정해야 합니다.
 * */
@WebServlet("/ch3/_2.main/memReg")
public class MemReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//응당하는 데이터 타입이 html타입이고
		//charset=UTF-8로 지정하면 응답되는 데이터들의 한글 처리를 한 부분
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		String hobby = request.getParameter("hobby");
		PrintWriter out = response.getWriter();
		out.write("<HTML><HEAD><TITLE>LifeCycleTest</TITLE></HEAD>");
		out.write("<BODY><H3>");
		out.write("회원명 : " + name + "<br>");
		out.write("주소: " + addr + "<br>");
		out.write("전화번호 : " + tel + "<br>");
		out.write("취미 : " + hobby + "<br>");
		out.write("</H3></BODY></HTML>");

		out.close();
	}

}
