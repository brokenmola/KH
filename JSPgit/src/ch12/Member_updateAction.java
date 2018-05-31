package ch12;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ch12.db.Member;
import ch12.db.MemberDAO;

public class Member_updateAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, 
         HttpServletResponse response) throws Exception {
	   request.setCharacterEncoding("euc-kr");
	   ActionForward forward = new ActionForward();
      HttpSession session = request.getSession();
      String id = (String)session.getAttribute("id");
      MemberDAO mdao = new MemberDAO();
      Member m = mdao.member_info(id);
      
      forward.setPath("./ch12_db/_8.member/updateForm.jsp");
      forward.setRedirect(false);
      request.setAttribute("memberinfo",m);
      
      return forward;
   }
}






