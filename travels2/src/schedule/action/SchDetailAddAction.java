package schedule.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import schedule.db.DetailDAO;
import schedule.db.ScheduleDAO;

public class SchDetailAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ScheduleDAO sch_DAO = new ScheduleDAO();
		DetailDAO det_DAO =new DetailDAO();
		HttpSession session = request.getSession();
		boolean result = false;
		String id= (String) session.getAttribute("id");
		
		//��ٱ��Ͽ� ������ �������� �������� bean ���ؼ� ��Ƽ� �ű��
		
		
		
		
		
		
		return null;
	}

}
