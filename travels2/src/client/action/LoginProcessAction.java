package client.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





public class LoginProcessAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response)
	throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("user_id");
		String user_passwd = request.getParameter("user_passwd");
		
		ClientDAO cd= new ClientDAO();
		int result = cd.isId(user_id, user_passwd);
		System.out.println("결과?? " + result);
		
		if(result==1) {
			HttpSession session = request.getSession();
			//로그인 성공
			session.setAttribute("user_id", user_id);
			forward.setRedirect(false);
			forward.setPath("/Client/main.jsp");
			return forward;
		}else {
			String message="";
			if(result==-1)
				message = "ID가 존재하지 않습니다.";
			else
				message = "비밀번호가 일치하지 않습니다.";
		
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("location.href='./login.net'");
			out.println("</script>");
			out.close();
			return null;
		}		
		
	}

}
