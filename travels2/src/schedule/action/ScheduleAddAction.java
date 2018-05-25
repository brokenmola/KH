package schedule.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import schedule.db.ScheduleBean;
import schedule.db.ScheduleDAO;

public class ScheduleAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ScheduleDAO sch_DAO = new ScheduleDAO();
		ScheduleBean sch_bean = new ScheduleBean();
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("id");//���ǿ� ����� ���̵� �����´�.
		boolean result = false;
		
		String sch_title= request.getParameter("sch_title");
		String sch_content = request.getParameter("sch_content");
		//ó�� ������ ����Ҷ��� �ı⸦ �ۼ����� �����Ƿ� �� ������
		String start_date = request.getParameter("start_date"); //��¥�� DB������ ������ DATE�� ���������� ���� �� insert�ؾ���
		String end_date = request.getParameter("end_date");
		
		sch_bean.setSch_title(sch_title);
		sch_bean.setSch_content(sch_content);
		sch_bean.setStart_date(start_date);
		sch_bean.setEnd_date(end_date);
		//�޾ƿ� ���� �̸�/��������/���� ����,����ð��� bean�� �־���
		 
		result = sch_DAO.addSchedule(sch_bean,user_id) ;
	
		forward.setRedirect(false);
		forward.setPath("");//������ db���� ó���ϰ� ���� �ٽ� ���� ���� �������� �Ѿ�� ��.
		return forward;
	}

}
