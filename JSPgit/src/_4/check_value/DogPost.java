package _4.check_value;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class dogPost
 */
@WebServlet("/ch3/_4.check_value/choiceDog")
public class DogPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DogPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String[] name = request.getParameterValues("dog");
		
		PrintWriter out = response.getWriter();
		
		/*
		 * request.getParameterValues("dog")
		 * 하나의 파라미터 이름(dog)으로 값이 여러 개 전송되어 올 경우에 사용
		 * 같은 이름으로 여러 개의 파라미터 값을 전송하기 위해서 사용하고 있는
		 * 체크 박스의 이름은 공통적으로 dog로 지정되어 있으므로
		 * 각 체크 박스의 값으로 강아지 이미지 파일명을 지정하여 파라미터 값으로
		 * 강아지 이미지 이름이 전송되도록 하고 있습니다.
		 * */
		out.write("<html><head><title>강아지</title>");
		out.write("<style>");
		out.write("body{background-color: black;}");
		out.write("div{display: inlint-block; margin: 0 auto;}");
		out.write("h1{color:red; text-align:center}");
		out.write("span{float:left; background-color: yellow;}");
		out.write("</style></head><body><div>");
		for(int i = 0; i < name.length; i++) {
			out.write("<span><h1>" + name[i] + "</h1><img src='" + name[i] + "' width='200px' height='200px'></span>");
		}
		out.write("</div></body></html>");
		
		out.close();
	}

}
