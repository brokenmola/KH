package _8.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/ch3/_8.admin/login_ok")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		//파라미터 id와 passwd의 값 가져오기
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		//입력 받은 값과 비교
		//입력 받은 값과 일치하는 경우
		if(id.equals("java") && passwd.equals("java")) {
			//세션 생성
			HttpSession session = request.getSession();
			
			//세션 객체에 id라는 속성으로 id값을 저장
			session.setAttribute("id", id);
			response.sendRedirect("loginSuccess.jsp");
		} else if(id.equals("java")){
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.')");
			out.println("history.back()");	//바로 전 페이지로 이동
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('로그인을 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
	}

}
