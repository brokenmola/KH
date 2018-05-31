package _0.homework;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Myform
 */
@WebServlet("/ch3/_0.homework/send")
public class Myform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Myform() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String jumin1 = request.getParameter("jumin1");
		String jumin2 = request.getParameter("jumin2");
		String email = request.getParameter("email");
		String domain = request.getParameter("domain");
		String sel = request.getParameter("sel");
		String gender = request.getParameter("gender");
		String g = "";
		String[] hobby = request.getParameterValues("hobby");
		String post1 = request.getParameter("post1");
		String post2 = request.getParameter("post2");
		String address = request.getParameter("address");
		String intro = request.getParameter("intro");
		
		PrintWriter out = response.getWriter();
		out.write("<html><head><title>유효성검사</title><body>");
		out.write("아이디 : " + id + "<br>");
		out.write("비밀번호 : " + pass + "<br>");
		out.write("주민번호 : " + jumin1 + " - " + jumin2 + "<br>");
		
		/*
		 * 도메인을 선택한 경우 유효성 검사에서
		 * $("#domain").attr("disabled", "disabled");로 비활성화를 시켰다.
		 * 비활성화된 경우 서버로 값 전송이 이루어지지 않는다.
		 * - 주소창을 확인해 보면 도메인을 선택한 경우 domain은 전송되지 않고
		 * 	 sel만 전송된다.
		 * - 직접 입력한 경우에는 domain은 값이 저장되어 전송되고
		 * 	 sel은 값이 없는 상태로 전송된다.
		 * */
		
		if(sel.equals("")) {
			out.println("email : " + email + "@" + domain + "<br>");
		} else {
			out.println("email : " + email + "@" + sel + "<br>");
		}
		
		if(gender == "m") {
			g = "남자";
		} else {
			 g = "여자";
		}
		
		out.write("성별 : " + g + "<br>");
		for(int i = 0; i < hobby.length; i++) {
			out.write("취미 : " + hobby[i] + "<br>");
		}
		out.write("우편번호 : " + post1 + " - " + post2 + "<br>");
		out.write("주소 : " + address + "<br>");
		out.write("자기소개 : " + intro + "<br>");
		out.write("</div></body></html>");
		out.close();
	}

}
