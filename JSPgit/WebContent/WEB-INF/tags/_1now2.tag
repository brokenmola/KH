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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="date" class="java.util.Date"/>


<fmt:formatDate value="${date }" type="both" timeStyle="long" dateStyle="long"/>
