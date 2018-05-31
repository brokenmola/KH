package _1.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycleTest
 */
@WebServlet("/ch3/_1.login/LifeCycleTest")
public class LifeCycleTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LifeCycleTest() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void service(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException{
	System.out.println("저는 service() 입니다.~");
	doGet(request, response);
}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//응답하는 데이터 타입이 html 이고
		//charset = UTF-8 로 지정하면서 응답되는 데이트들의 한글처리를 한부분입니다.
		response.setContentType("text/html;charset=UTF-8");

		//getContextPath() : 웹 애플리케이션 경로 정보를 반환합니다.
		//URL 에서 포트번호와 슬래시 다음 웹 애플리케이션 이름을 지정합니다.
		//이 값을 추출하는 메소드입니다.
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//getParameter() 메서드 : 
		//name 으로 전송되어 온 파라미터 값을 반환해 주는 메서드 입니다.
		//클라이언트에서 전송디어 오는 id 라는 이름의 파라미터 값과
		//passwd 라는 이름의 파라미터 값을 받는 부분입니다.
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		PrintWriter out = response.getWriter();
		//out.write("<HTML><HEAD></HEAD><BODY> <br>  <p>ID = "+id +"</p>  <p>PWD = "+ passwd + "</p></BODY></HTML");
		out.println("<br>" + "아이디 = " + id + "<br>");
		out.println("비번 = " + passwd + "<br>");
		
		out.close();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
