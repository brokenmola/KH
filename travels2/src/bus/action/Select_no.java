package bus.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

public class Select_no implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) 
					throws Exception {
		BusDAO bd = new BusDAO();
		JSONArray array = new JSONArray();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		
		String area=(String)session.getAttribute("area");
		String start=(String)session.getAttribute("start");
		String end= request.getParameter("bus_end");
		
		session.setAttribute("end",end);
		
		System.out.println("no1 "+ area);
		System.out.println("no2 "+ start);
		System.out.println("no3 "+ end);
		
		array = bd.select_no(area, start, end);
		
		response.setHeader("cache-control","no-cache,no-store");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println(array);
		out.print(array);
		return null;
	}

}
