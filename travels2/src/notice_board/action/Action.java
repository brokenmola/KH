package notice_board.action;

import javax.servlet.http.HttpServletResponse;

//Ư�� ����Ͻ� ��û���� �����ϰ� ��� ���� ActionForward Ÿ������ ��ȯ�ϴ� �޼��尡 ���ǵǾ� �ֽ��ϴ�.
//Action : �������̽� ��
//ActionForward:��ȯ��
public interface Action {
	public ActionForward execute(HttpServletResponse request, HttpServletResponse response)
		throws Exception;
}
