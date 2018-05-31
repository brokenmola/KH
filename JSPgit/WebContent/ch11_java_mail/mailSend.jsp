<%-- ������ ��� smtp ���� �ּҸ� ������ ���̹��� "���̵�@naver.com"���� �մϴ�. --%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%@ page import="java.util.*" %>
<%-- �ڹ� ���� API�� ����ϱ� ���� ���� ��Ű���� import�Ѵ�. --%>
<%@ page import="javax.activation.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String sender=request.getParameter("sender");
	String receiver=request.getParameter("receiver");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	//SMTP ���� �ּҸ� �����մϴ�.
	String server = "smtp.naver.com";
	
	try{
		//���� ������ Properties ��ü�� �����մϴ�.
		Properties properties = new Properties();
		
		//SMTP ���� ���� ����
		//���̹��� ��� smtp.naver.com
		properties.put("mail.smtp.host", server);
		
		//������ Properties��ü�� ������ ������ �ν��Ͻ��� �����մϴ�.
		//public static Session getDefaultInstance(Properties)
		Session s = Session.getDefaultInstance(properties);
		
		//������ ���ϰ� �޴� �ּҸ� �����մϴ�.
		Address sender_address = new InternetAddress(sender);
		Address receiver_address = new InternetAddress(receiver);
		
		//������ ������ ���� ������ �Է��ϱ� ���� MEssage ��ü�� �����մϴ�.
		Message message = new MimeMessage(s);
		
		//������ ������ ������ �ѱ��� ��� ������ �ʵ��� content-type�� �����մϴ�.
		message.setHeader("content-type","text/html;charset=euc-kr");
		
		//������ ���� �ּ� ������ �����մϴ�
		message.setFrom(sender_address);
		
		//�޴� ���� �ּ� ������ �����մϴ�
		//Message.RecipientType�� Message Ŭ�������� ����ϴ� ������ ������ �����մϴ�.
		//Message.RecipientType.To : �޴� ����� �ǹ��մϴ�.
		message.addRecipient(Message.RecipientType.TO, receiver_address);
		
		//���� ������ �����մϴ�
		message.setSubject(subject);
		
		//������ ������ �����մϴ�.
		message.setContent(content,"text/html;charset=euc-kr");
		
		//������ ��¥�� �����մϴ�.
		message.setSentDate(new java.util.Date());
		
		//public Transport getTransport(String protocol) throws NoSuchProviderException
		//������ ��������(smtp)�� �����ϴ� Transport ��ü�� �����ɴϴ�
		//������ �����ϴ� Ŭ�����Դϴ�.
		Transport transport = s.getTransport("smtp");
		
		//ù��° ���ڴ� ������ ȣ��Ʈ �Դϴ�.
		//�ι��� ���ڴ� ���̵�, ������ ���ڴ� ��й�ȣ�� �ǹ��մϴ�.
		
		transport.connect(server,"jgb9064","dsaqwe321!");
		
		//getAllrecipients() : �޽����� ��� ������ �ּҸ� �����ɴϴ�.
		//������ �ּ� ������� �޽����� �����ϴ�.
		transport.sendMessage(message,message.getAllRecipients());
		
		//������ �����մϴ�.
		transport.close();
		
		out.println("<h3>������ ���������� ���۵Ǿ����ϴ�.</h3>");
	}catch(Exception e){
		out.println("SMTP ������ �߸� �����Ǿ��ų�, ���񽺿� ������ ������ϴ�.");
		e.printStackTrace();
	}
%>