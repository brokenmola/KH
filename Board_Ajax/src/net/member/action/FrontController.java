package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.net")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doProcess(HttpServletRequest request,
								HttpServletResponse response)
		throws ServletException, IOException {
	
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);
		
		//getContextPath() : 컨텍스트 경로가 반환됩니다.
		//contextPath는 "/JspProject"가 반환됩니다.
		String contextPath=request.getContextPath();
		System.out.println("contextPath = " + contextPath);
		
		//RequestURI에서 컨텍스트 경로 길이 값의 인덱스 위치의 문자부터
		//마지막 위치 문자까지 추출합니다.
		//command는 "/login.net"로 반환됩니다.
		String command=RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);

		//초기화
		ActionForward forward=null;
		Action action=null;
		if(command.equals("/login.net")) {
			forward=new ActionForward();
			forward.setRedirect(false);	//주소 변경 없이 jsp페이지의 내용을 보여줍니다.
			forward.setPath("/member/loginForm.jsp");
		}
		else if(command.equals("/loginProcess.net")) {
			action = new LoginProcessAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/member_list.net")) {
			action = new ListAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/member_info.net")) {
			action = new Member_infoAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/member_delete.net")) {
			action = new Member_deleteAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/member_update.net")) {
			action = new Member_updateAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/updateProcess.net")) {
			action = new updateProcessAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/main.net")) {
			forward=new ActionForward();
			forward.setRedirect(false);	//주소 변경 없이 jsp페이지의 내용을 보여줍니다.
			forward.setPath("/member/main.jsp");
		}
		else if(command.equals("/logout.net")) {
			action = new LogoutAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/join.net")) {
			forward=new ActionForward();
			forward.setRedirect(false);	//주소 변경 없이 jsp페이지의 내용을 보여줍니다.
			forward.setPath("/member/joinForm.jsp");
		}
		else if(command.equals("/joinProcess.net")) {
			action = new joinProcessAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/IdcheckAjax.net")) {
			action = new IdcheckAjax();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		if(forward !=null) {
			if(forward.isRedirect()) {//리다이렉트 됩니다.
				response.sendRedirect(forward.getPath());
			}else {//포워딩됩니다.
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	
		
	}
	
	//doProcess(request,response)메소드를 구현하여 요청이 GET방식으든
	//POST방식으로 전송되어 오든 같은 메소드에서 요청을 처리할 수 있도록 하였습니다.
	protected void doGet(HttpServletRequest request,
								HttpServletResponse response)
			throws ServletException, IOException {
			doProcess(request, response);
		}

	protected void doPost(HttpServletRequest request,
								HttpServletResponse response) 
		throws ServletException, IOException {
		doProcess(request, response);
	}

}
