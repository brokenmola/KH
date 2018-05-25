package client.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateProcessAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response)
					throws Exception {
		request.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("user_id");
		String user_passwd = request.getParameter("user_passwd");
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		int user_type = Integer.parseInt(request.getParameter("user_type"));
		
		Client c = new Client();
		c.setUser_id(user_id);
		c.setUser_passwd(user_passwd);
		c.setUser_name(user_name);
		c.setUser_email(user_email);
		c.setUser_type(user_type);
			
		ClientDAO cd = new ClientDAO();
		int result = cd.update(c);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		//삽입이 된 경우
		if(result==1) {
		out.println("alert('수정이 완료되었습니다..')");
		out.println("location.href='./main.net'");
		}else {
			out.println("aler('수정을 하지 못하였습니다..')");
			out.println("history.back();");
		}
		out.println("</script>");
		out.close();
		
		// TODO Auto-generated method stub
		return null;
	}

}
