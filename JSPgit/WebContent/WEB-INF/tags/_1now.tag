<%-- tag ��Ƽ�� : JSP�������� page ��Ƽ��� �����մϴ�.
	 page ��Ƽ�� JSP �������� ���� ���� ���� ���� ����ϴ� ��ó�� 
	 tag ��Ƽ��� �±� ������ ������ ����մϴ�.
	 
	 body-content �Ӽ� : ��ü ������ ������ �Է��մϴ�.
	 
	 body-content="empty" :  �±� ������ ��Ÿ���� Ŀ���� �±��� ��ü ������ ���ٰ� ǥ���մϴ�.
	 ��) <tf:_1now/> ����ؾ� �մϴ�.
	 ���� <tf:_1now> ���� <tf:_1now/> ����ϸ� ���� �߻��մϴ�
	 
	 pageEncoding="euc-kr" : �±� ������ �ҽ� �ڵ� ���ڵ��� �˸°� �����մϴ�.
	 
--%>
<%@ tag body-content="empty" pageEncoding="euc-kr"%>
<%@ tag import="java.util.Calendar"%>
<%Calendar cal = Calendar.getInstance();%>
<%-- �±� ���Ͽ��� ����� ������ �״�� Ŭ���̾�Ʈ�� ��µ˴ϴ�.--%>
<%= cal.get(Calendar.YEAR)%>��
<%= cal.get(Calendar.MONTH)+1%>��
<%= cal.get(Calendar.DATE)%>��
